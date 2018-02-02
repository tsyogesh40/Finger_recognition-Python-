-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 02, 2018 at 10:34 PM
-- Server version: 5.7.21-0ubuntu0.17.10.1
-- PHP Version: 7.1.11-0ubuntu0.17.10.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Humanrexx`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_credentials`
--

CREATE TABLE `admin_credentials` (
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `altered_time`
--

CREATE TABLE `altered_time` (
  `date` date NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL,
  `cadre` enum('T','NT') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `altered_time`
--

INSERT INTO `altered_time` (`date`, `in_time`, `out_time`, `cadre`) VALUES
('2018-02-01', '09:00:00', '17:30:00', 'T'),
('2018-02-01', '08:30:00', '05:30:00', 'NT');

-- --------------------------------------------------------

--
-- Table structure for table `CIVIL_entry`
--

CREATE TABLE `CIVIL_entry` (
  `cadre` enum('T','NT') NOT NULL,
  `name` varchar(60) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `store_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `outtime` time NOT NULL,
  `p_value` int(11) NOT NULL,
  `status` enum('LATE','ONTME') NOT NULL,
  `date` date NOT NULL,
  `semester` enum('ODD','EVEN') NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `staff_id` varchar(12) NOT NULL,
  `name` varchar(60) NOT NULL,
  `count` int(1) NOT NULL DEFAULT '0' COMMENT 'If(counter>=3) then p_value--;',
  `late_days` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`staff_id`, `name`, `count`, `late_days`) VALUES
('14IT46', 'Yogesh T S', 1, 1),
('14IT47', 'Yogesh 1', 3, 3),
('14it48', 'Yogesh 2', 1, 1),
('14IT49', 'Yogesh 3', 1, 1),
('14IT50', 'Gokul T S', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `CSE_entry`
--

CREATE TABLE `CSE_entry` (
  `cadre` enum('T','NT') NOT NULL,
  `name` varchar(60) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `store_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `outtime` time NOT NULL,
  `p_value` int(11) NOT NULL,
  `status` enum('LATE','ONTME') NOT NULL,
  `date` date NOT NULL,
  `semester` enum('ODD','EVEN') NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `default_time`
--

CREATE TABLE `default_time` (
  `cadre` enum('T','NT') NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Default time for Teaching and Non- teaching staffs';

--
-- Dumping data for table `default_time`
--

INSERT INTO `default_time` (`cadre`, `in_time`, `out_time`) VALUES
('T', '09:00:00', '17:30:00'),
('NT', '08:30:00', '17:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `ECE_entry`
--

CREATE TABLE `ECE_entry` (
  `cadre` enum('T','NT') NOT NULL,
  `name` varchar(60) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `store_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `outtime` time NOT NULL,
  `p_value` int(11) NOT NULL,
  `status` enum('LATE','ONTME') NOT NULL,
  `date` date NOT NULL,
  `semester` enum('ODD','EVEN') NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `EEE_entry`
--

CREATE TABLE `EEE_entry` (
  `cadre` enum('T','NT') NOT NULL,
  `name` varchar(60) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `store_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `outtime` time NOT NULL,
  `p_value` int(11) NOT NULL,
  `status` enum('LATE','ONTME') NOT NULL,
  `date` date NOT NULL,
  `semester` enum('ODD','EVEN') NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fingerprint_details`
--

CREATE TABLE `fingerprint_details` (
  `name` varchar(50) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `store_id` int(3) NOT NULL COMMENT 'fingerprints are being stored in the scanner using this storeid',
  `finger_name` enum('LEFT_THUMB','RIGHT_THUMB','LEFT_INDEX','RIGHT_INDEX','LEFT_MID','RIGHT_MID') NOT NULL,
  `finger_code` enum('LT','RT','LI','RI','LM','RM') NOT NULL COMMENT 'Abbrevated finger name',
  `finger_print` varchar(2000) NOT NULL,
  `enroll_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fingerprint_details`
--

INSERT INTO `fingerprint_details` (`name`, `staff_id`, `store_id`, `finger_name`, `finger_code`, `finger_print`, `enroll_time`) VALUES
('Yogesh T S', '14IT46', 2, 'LEFT_INDEX', 'LI', 'ef01ffffffff020102030159180000ff06f806f002c000800000000000000000000000000000000000000000000000000000000000000000000000000000000000298c001e5e0f85fe5a155abe3b22d53e5c259d1e32a980de4fbb9f9e670c5b9f3a91c17f2312949f391715bf35ae943f21b4285f1f196b7d48a9877d4a2cdcbd542fddfd4c06675a478756b31b9cd2b8213de8b823c229b8243f91d94e324a8e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002cd0ef01ffffffff080102030155180000fc06f006e002c002000200000000000000000000000000000000000000000000000200000000000000000000000000000000298c6cbe5e0f461e5a155ade5c259d1e4fbca01e658bdbdf3b1181df2212d49f381715bf3da4563f312ac09f35ae53ff2233e87f1d99eb3d48a9877d4a2cdcbd542fddfd40078012488640f04c8697701c1cd2d6460797b14db20a0e24c1a9f200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002db4', '2018-01-30 13:29:33'),
('Yogesh 1', '14IT47', 4, 'LEFT_MID', 'LM', 'ef01ffffffff020102030154130000fffefc0efc06e002800080000000000000000000000000000000000000000000000000000000000000000000000000000000229a295e341eebde293e25fe4222553f0aa3105749a995bf5033171f6eb6deff3bbc0eff58bcda5f163e253f46bc4f7c4b24c37d6536dddd61119a585e1459985cb79cb858379ad9501142f60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000026f2ef01ffffffff080102030157140000fffefe0efe06e002c000c00080008000000000000000000000000000000000008000000000000000000000000000000000005f1299fe349c2c5e3f9ed49e2bbc25be2295ea1f4ba2c43f4a27d63f77ad9edf503456bf6cb5df5f473a8fbf183be4ff3bbc0eff583c9adf598d58fc530f835c4fbe073a63b65e7b5c35dd395736dbb90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002e4c', '2018-02-01 18:43:15'),
('Yogesh 2', '14it48', 6, 'LEFT_THUMB', 'LT', 'ef01ffffffff02010203015c280000f87ec03e801e80060002000000000000000000000000000000000000000000000000000000000000000000000000000000006113dcbe2e17d65e3b27171e77a88616703245de3b3656de20b6ac5e2f39959e5b10059f5a1c041f0db4d7df28bf813f59a199fc4d26599c46ac17dc0aaf129c6c391bbc0abaa9dc6c3d05dc4c3d449c0f3daa3c354001fc0e2caafd3cafd71d49c0d91d468f00b2529fc37a6ba39b7a48a8c3da4c0f58932115d5fb1216ac3b2fc197db330c97326e1f0558699fdb79281f56921498ac70271b55ca211f400c00000000000000000000000000000000000000000000000000000000000000000000000000000000455def01ffffffff08010203015d240000f9fef0fee0fec002c002c0028002800200000000000000000000000000000000000000000000000000000000000000000000358a9a7e238fc21e2f1198be411283be49951a5e159b15d610a31696242a165e1f31c0fe1433139e3c3e837e3f42585e2543409e6d9c05df2cb8561f21be14df4e1f9a1c52a31abc6b2b465c31ae573c6aaedbfc5d31c51c2733d5dc61935c325b95c5b2419dc3da432258da5cbc457a60181c3259b69c9255b445535aba1b5960231b760eb82b16311e430e561f04b20000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000413d', '2018-02-01 18:58:43'),
('Yogesh 3', '14IT49', 3, 'RIGHT_INDEX', 'RI', 'ef01ffffffff0201020301581b0000fffefffef00ee002c000c00080000000000000000000000000000000000000000000000000000000000000000000000000005d8f027e731d997e4ea8c35e1aaad0fe6130db1e513c1b5e29c367be0da952f75d2943ff40b6c25f58ba07bf2e24aa3c269c2b3d6a2785bd69ab9a7d363e515d36c1ec7d752f9d9a19256ad329a7543b763247db2b992912621a81f61fa556962f97d28e699b996f20a6eb1500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003764ef01ffffffff080102030156180000fffefffef9fee006c006c000c000800080008000000000000000000000000000000000000000000000000000000000000000561d59be2a1de97e4ea8839e5f28c37e6130db1e4335c33e4e9b427f739f9a3f6aa7461f692b5adf59bf9f1f742edddc51bb9a1c763247dd5839889d1e190d72661b57da629c82ba2ac2a81a1c9ba67336c1ec772b1929ae36be11753916128a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000337b', '2018-02-01 19:16:37'),
('Yogesh 3', '14IT49', 3, 'RIGHT_THUMB', 'RT', 'ef01ffffffff020102030159200000fffeff1efe0ef80ef80ee00e0002000000000000000000000000000000000000000000000000000000000000000000000000570d94de613ad6be6b3f983e262ae99f31b96a9f1022289c6aacc1bc712d983c6e39985454bd80bc1723513d3fbe2c9d40c1137d4f0eab5a4012141a4f92abba519aec1a3f20ea1a6838c1d2561655185b132c36291c29f660a1969657a517564c40c0965b952bf14cbf15b7471f137446a2ebf43a9deb924ea440313517aae60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003d4cef01ffffffff080102030155230000fffeff1efe1ef81ef81ee01e000200000000000000000000000000000000000000000000000000000000000000000000000025ab693f31b96a9f6ac0585f560d949c521aebfc0fa2a87c6a2c823c70ad98bc6e39989c1723513d3fbe2c9d40c1139d33a395f22da3ead33fa0aa9863a1d73850bdecf8169c2a9340125516469f53f661a4d69661bad6b64c40c0564cbf15d74e8eab34401cec745c37800e43226bf549136bac289c2a32531e15b22b98932b4ea4402f4ca2562c3497aa86000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000465e', '2018-02-02 12:10:51'),
('Gokul T S', '14IT50', 7, 'LEFT_MID', 'LM', 'ef01ffffffff020102030154170000e03e800e80060002000000000000000000000000000000000000000000000000000000000000000000000000000000000000550d973e418fabfe3f16915e6e175b9e379ecefe48224fde52a5121e09268d7e43a8281e082da49e75af9dfe37350a7e503888be2d3a8abe273f8b9e5a89587f5c96857f5b9e591f4e18815240b60a1b4737c9db539917d251ac8bad00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000028bbef01ffffffff080102030153220000fffefdfec01ec01e801e801e8006000000000000000080008000800080008000800000000000000000000000000000000000568e177e430f6cfe3e96513e5a1f58de4228e77e36b4ca5e68b94a3e2d3a4afe123b8e56273f8a7e359d8e7f4820101f6ea6c85f712c5e7f69bd9fdf4e1842bc5499993c503888fa45431f9a52afc95b44330b524435a1d25a2e487949380a9040360a3773b69f14753049cf4cbc499557a3484c4e2b11d249baa10c502d0ad35aa91bec59a59b8d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041fc', '2018-02-02 19:20:19');

-- --------------------------------------------------------

--
-- Table structure for table `IT_entry`
--

CREATE TABLE `IT_entry` (
  `cadre` enum('T','NT') NOT NULL,
  `name` varchar(60) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `store_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `outtime` time NOT NULL,
  `p_value` int(11) NOT NULL,
  `status` enum('LATE','ONTME') NOT NULL,
  `date` date NOT NULL,
  `semester` enum('ODD','EVEN') NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MECH_entry`
--

CREATE TABLE `MECH_entry` (
  `cadre` enum('T','NT') NOT NULL,
  `name` varchar(60) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `store_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `outtime` time NOT NULL,
  `p_value` int(11) NOT NULL,
  `status` enum('LATE','ONTME') NOT NULL,
  `date` date NOT NULL,
  `semester` enum('ODD','EVEN') NOT NULL,
  `year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `overall_presence`
--

CREATE TABLE `overall_presence` (
  `name` varchar(60) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `total_days` int(4) NOT NULL,
  `present_days` int(4) NOT NULL,
  `absent_days` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff_details`
--

CREATE TABLE `staff_details` (
  `name` varchar(100) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `store_id` int(3) NOT NULL,
  `finger_preference` enum('LT','RT','LI','RI','LM','RM') NOT NULL DEFAULT 'LI',
  `department` enum('IT','CSE','MECH','ECE','EEE','CIVIL') NOT NULL,
  `designation` varchar(30) NOT NULL,
  `cadre` enum('T','NT') NOT NULL COMMENT 'T- Teaching staff , NT- Non teaching staff',
  `gender` enum('M','F') NOT NULL,
  `phone` bigint(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `DOJ` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_details`
--

INSERT INTO `staff_details` (`name`, `staff_id`, `store_id`, `finger_preference`, `department`, `designation`, `cadre`, `gender`, `phone`, `email`, `DOJ`) VALUES
('Yogesh TS ', '14IT46', 2, 'LT', 'IT', 'AP-II', 'T', 'M', 7373535614, 'tsyogesh40@gmail.com', '2018-01-30'),
('Yogesh 1', '14IT47', 4, 'LM', 'IT', 'AP-II', 'NT', 'M', 7373535614, 'tsyogesh40@gmail.com', '2018-02-21'),
('Yogesh 2', '14it48', 6, 'LT', 'IT', 'AP-II', 'NT', 'M', 7373535614, 'tsyogesh40@gmail.com', '2018-02-28'),
('Yogesh 3', '14IT49', 3, 'LI', 'IT', 'AP-III', 'T', 'M', 7373535614, 'tsyogesh40@gmail.com', '2018-02-01'),
('Gokul T S', '14IT50', 7, 'LM', 'CSE', 'AP-II', 'T', 'M', 7373535614, 'tsgokult@gmail.com', '2018-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `temp_entry`
--

CREATE TABLE `temp_entry` (
  `cadre` enum('T','NT') NOT NULL,
  `name` varchar(60) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `store_id` int(3) NOT NULL,
  `dept` enum('IT','CSE','MECH','ECE','EEE','CIVIL') NOT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `p_value` int(2) NOT NULL DEFAULT '0' COMMENT '1- Morning entry 2, Evening Entry',
  `no_of_entry` int(1) NOT NULL DEFAULT '0',
  `status` enum('LATE','ONTIME') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `semester` enum('ODD','EVEN') NOT NULL,
  `year` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_entry`
--

INSERT INTO `temp_entry` (`cadre`, `name`, `staff_id`, `store_id`, `dept`, `in_time`, `out_time`, `p_value`, `no_of_entry`, `status`, `date`, `semester`, `year`) VALUES
('NT', 'Yogesh 1', '14IT47', 4, 'IT', '18:36:29', '18:40:31', 1, 2, 'LATE', '2018-02-02', 'ODD', 2018),
('NT', 'Yogesh 2', '14it48', 6, 'IT', '19:01:29', '19:24:28', 1, 2, 'LATE', '2018-02-02', 'ODD', 2018),
('T', 'Yogesh TS ', '14IT46', 2, 'IT', '19:05:48', '19:06:28', 1, 2, 'LATE', '2018-02-02', 'ODD', 2018),
('T', 'Yogesh 3', '14IT49', 3, 'IT', '19:08:33', '19:08:59', 1, 2, 'LATE', '2018-02-02', 'ODD', 2018),
('T', 'Gokul T S', '14IT50', 7, 'CSE', '19:21:53', '19:22:19', 1, 2, 'LATE', '2018-02-02', 'ODD', 2018);

-- --------------------------------------------------------

--
-- Table structure for table `user_credentials`
--

CREATE TABLE `user_credentials` (
  `name` varchar(60) NOT NULL,
  `staff_id` varchar(12) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `desgination` enum('P','H','S') NOT NULL COMMENT 'P-PRINCIPAL , H- HOD, S- STAFFS',
  `last_login` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `altered_time`
--
ALTER TABLE `altered_time`
  ADD KEY `cadre_ref` (`cadre`);

--
-- Indexes for table `CIVIL_entry`
--
ALTER TABLE `CIVIL_entry`
  ADD KEY `staffid_ref_IT` (`staff_id`);

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `CSE_entry`
--
ALTER TABLE `CSE_entry`
  ADD KEY `staffid_ref_IT` (`staff_id`);

--
-- Indexes for table `default_time`
--
ALTER TABLE `default_time`
  ADD PRIMARY KEY (`cadre`);

--
-- Indexes for table `ECE_entry`
--
ALTER TABLE `ECE_entry`
  ADD KEY `staffid_ref_IT` (`staff_id`);

--
-- Indexes for table `EEE_entry`
--
ALTER TABLE `EEE_entry`
  ADD KEY `staffid_ref_IT` (`staff_id`);

--
-- Indexes for table `fingerprint_details`
--
ALTER TABLE `fingerprint_details`
  ADD KEY `reference` (`staff_id`);

--
-- Indexes for table `IT_entry`
--
ALTER TABLE `IT_entry`
  ADD KEY `staffid_ref_IT` (`staff_id`);

--
-- Indexes for table `MECH_entry`
--
ALTER TABLE `MECH_entry`
  ADD KEY `staffid_ref_IT` (`staff_id`);

--
-- Indexes for table `overall_presence`
--
ALTER TABLE `overall_presence`
  ADD KEY `staffid_ref_overall_presence` (`staff_id`);

--
-- Indexes for table `staff_details`
--
ALTER TABLE `staff_details`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `temp_entry`
--
ALTER TABLE `temp_entry`
  ADD KEY `staffid_ref` (`staff_id`),
  ADD KEY `cadre_ref_temp` (`cadre`);

--
-- Indexes for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD KEY `staffid_ref_user_credentials` (`staff_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `altered_time`
--
ALTER TABLE `altered_time`
  ADD CONSTRAINT `cadre_ref` FOREIGN KEY (`cadre`) REFERENCES `default_time` (`cadre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CIVIL_entry`
--
ALTER TABLE `CIVIL_entry`
  ADD CONSTRAINT `staffid_ref_CIVIL` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `counter`
--
ALTER TABLE `counter`
  ADD CONSTRAINT `staffid_ref_counter` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `CSE_entry`
--
ALTER TABLE `CSE_entry`
  ADD CONSTRAINT `staffid_ref_CSE` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ECE_entry`
--
ALTER TABLE `ECE_entry`
  ADD CONSTRAINT `staffid_ref_ECE` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `EEE_entry`
--
ALTER TABLE `EEE_entry`
  ADD CONSTRAINT `staffid_ref_EEE` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fingerprint_details`
--
ALTER TABLE `fingerprint_details`
  ADD CONSTRAINT `reference` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `IT_entry`
--
ALTER TABLE `IT_entry`
  ADD CONSTRAINT `staffid_ref_IT` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `MECH_entry`
--
ALTER TABLE `MECH_entry`
  ADD CONSTRAINT `staffid_ref_MECH` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `overall_presence`
--
ALTER TABLE `overall_presence`
  ADD CONSTRAINT `staffid_ref_overall_presence` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temp_entry`
--
ALTER TABLE `temp_entry`
  ADD CONSTRAINT `cadre_ref_temp` FOREIGN KEY (`cadre`) REFERENCES `default_time` (`cadre`),
  ADD CONSTRAINT `staffid_ref` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD CONSTRAINT `staffid_ref_user_credentials` FOREIGN KEY (`staff_id`) REFERENCES `staff_details` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
