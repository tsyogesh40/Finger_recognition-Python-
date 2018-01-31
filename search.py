from datetime import date,datetime,timedelta
import hashlib
from pyfingerprint.pyfingerprint import PyFingerprint
import serial,time,datetime
import pymysql
## Search for a finger
##

 ##Time and Date formats

t=datetime.datetime.now()
#date format
    
weekday=t.strftime("%a") # %A for abbr
day=t.strftime("%d")
month=t.strftime("%b")  #%B for abbr
month_num=t.strftime("%m") 
year=t.strftime("%Y")
    
    #time format
hour_12=t.strftime("%I")
hour_24=t.strftime("%H")
minutes=t.strftime("%H")
seconds=t.strftime("%S")
am_pm=t.strftime("%p")

   

## Tries to initialize the sensor
try:
    f = PyFingerprint('/dev/ttyUSB0', 57600, 0xFFFFFFFF, 0x00000000)

    if ( f.verifyPassword() == False ):
        raise ValueError('The given fingerprint sensor password is wrong!')

except Exception as e:
    print('The fingerprint sensor could not be initialized in USB 0!')
    f = PyFingerprint('/dev/ttyUSB2', 57600, 0xFFFFFFFF, 0x00000000)
    
    print('Exception message: ' + str(e))
   # exit(1)

## Gets some sensor information
print('Currently used templates: ' + str(f.getTemplateCount()) +'/'+ str(f.getStorageCapacity()))


def sem_calc(month):
    if(month>=1 & month<6):
        return "ODD"
    else:
        return "EVEN"

def time_12():
    t=datetime.datetime.now()
    time_12=t.strftime("%I:%M:%S %p") #12hrs time AM/PM
    return time_12
    
def time_24():
    t=datetime.datetime.now()
    time_24=t.strftime("%H:%M:%S") #24 Hrs time
    return time_24

def date():
    t=datetime.datetime.now()
    date=t.strftime("%Y-%m-%d")
    return date
    
    
while(1):
    
## Tries to search the finger and calculate hash
    try:
        print('Waiting for finger...')

        ## Wait that finger is read
        while ( f.readImage() == False ):
            pass

    ## Converts read image to characteristics and stores it in charbuffer 1
        f.convertImage(0x01)

        ## Searchs template
        result = f.searchTemplate()

        positionNumber = result[0]
        accuracyScore = result[1]
        flag=0
        if ( positionNumber == -1 ):
            print('No match found!')
            flag=1
          #  exit(0)
        else:
            print('Found template at position #' + str(positionNumber))
            print('The accuracy score is: ' + str(accuracyScore))
    
        ## OPTIONAL stuff
        ##
            
        if (flag!=1):
            flag=0
            ##db connection establishment
            cnx=pymysql.connect(user='root',password='root',host='127.0.0.1',database='Humanrexx')
            if cnx:
                print ("Localhost Connected")
            cur=cnx.cursor()

            try:
                #checking for existing records
                sql="select store_id from temp_entry where store_id='%s' and date=%s"
                result=cur.execute(sql,(positionNumber,date()))
                row=cur.rowcount
                print(row)
                if row==0:
                    count=1
                    #fetching details from staff_details
                    sql_details="select name,staff_id,department from staff_details where store_id=%s"
                    result_details=cur.execute(sql_details,(positionNumber))
                    details=cur.fetchone()
                    nm=details[0]
                    staffid=details[1]
                    department=details[2]
                    #print((nm,staffid,positionNumber,department,time_24,time_24,count,date,sem_calc(int(month_num)),year))

                    #inserting attendence entry
                    semester=sem_calc(int(month_num))
                    sql1="insert into temp_entry(name,staff_id,store_id,dept,in_time,p_value,date,semester,year) values(%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                    res=cur.execute(sql1,(nm,staffid,positionNumber,department,time_24(),count,date(),semester,year))
                    if res:
                        print ('Hello! ',nm,'Your Entry is at',time_12())
                    cnx.commit()
                    
                        
                else:
                    sql_details="select name,staff_id from staff_details where store_id=%s"
                    result_details=cur.execute(sql_details,(positionNumber))
                    details=cur.fetchone()
                    nm=details[0]
                    staffid=details[1]
                    print("Hello! ",nm)
                    sql2="select p_value from temp_entry where store_id='%s'"
                    res1=cur.execute(sql2,(positionNumber))
                    row1=cur.fetchone()
                    print('Present value=')
                    print(row1[0])
                    count=row1[0]
                    if(count<=1):
                        count+=1
                        sql3="UPDATE temp_entry set p_value='%s',out_time=%s where store_id='%s'"
                        res=cur.execute(sql3,(count,time_24(),positionNumber))
                        cnx.commit()
                        if(res):
                            print('Your entry is at',time_12(),'\nThankYou!')
                            
                    else:
                            print('Your presence is confirmed today!\nHave a nice Day')
            except Exception as ex:
                print("Manipulating problem")
                print(ex)
                cnx.rollback()
            
        ## Loads the found template to charbuffer 1
        f.loadTemplate(positionNumber, 0x01)

        ## Downloads the characteristics of template loaded in charbuffer 1
        characterics = str(f.downloadCharacteristics(0x01)).encode('utf-8')

        ## Hashes characteristics of template
        #print('SHA-2 hash of template: ' + hashlib.sha256(characterics).hexdigest())

    except Exception as e:
        print('Operation failed!')
        print('Exception message: ' + str(e))
        #exit(1)
    time.sleep(2)
