import pymysql

cnx=pymysql.connect(user='root',password='root',host='localhost',database='Humanrexx')
if cnx:
        print('localhost connected')
cur=cnx.cursor()

staffid=input("Enter the staffid")

try:
    sql="select finger_name,store_id from fingerprint_details where staff_id=%s"
    result=cur.execute(sql,(staffid))
    row=cur.fetchone()
    #for r in row:
    print(row[0],row[1])
    
except Exception as ex:
    print(ex)
