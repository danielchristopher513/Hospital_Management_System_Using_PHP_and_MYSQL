-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2022 at 04:51 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ohmsphp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` int(10) NOT NULL,
  `adminname` varchar(25) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `usertype` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `adminname`, `loginid`, `password`, `status`, `usertype`) VALUES
(1, 'Daniel Christopher', 'admin', 'Password@123', 'Active', '');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentid` int(10) NOT NULL,
  `appointmenttype` varchar(255) NOT NULL DEFAULT 'ONLINE',
  `patientid` int(10) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `appointmentdate` date NOT NULL,
  `appointmenttime` time NOT NULL,
  `doctorid` int(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `app_reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentid`, `appointmenttype`, `patientid`, `departmentid`, `appointmentdate`, `appointmenttime`, `doctorid`, `status`, `app_reason`) VALUES
(1, 'online', 1, 1, '2019-06-17', '03:00:00', 1, 'Approved', 'Fever'),
(2, 'online', 3, 2, '2021-06-25', '09:22:00', 2, 'Approved', 'this is a demo test'),
(4, 'online', 5, 4, '2021-06-24', '14:28:00', 5, 'Approved', 'demo demo demo'),
(5, 'online', 6, 7, '2021-06-24', '11:18:00', 7, 'Approved', 'Demo Test, Demo Reason!!'),
(6, 'online', 7, 2, '2022-10-22', '10:20:00', 9, 'Approved', 'abcd'),
(8, 'online', 9, 7, '2022-10-26', '20:00:00', 10, 'Approved', 'General Checkup'),
(9, 'online', 11, 4, '2022-10-27', '20:30:00', 11, 'Approved', 'checkup'),
(10, 'online', 12, 4, '2022-11-04', '21:44:00', 11, 'Approved', 'checkup'),
(11, 'online', 13, 4, '2022-11-04', '21:48:00', 11, 'Approved', 'checkup'),
(12, 'online', 14, 6, '2022-11-05', '14:58:00', 12, 'Approved', 'checkup'),
(14, 'online', 17, 7, '2022-11-13', '21:19:00', 13, 'Approved', 'checkup');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billingid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `billingdate` date NOT NULL,
  `billingtime` time NOT NULL,
  `discount` float(10,2) NOT NULL,
  `taxamount` float(10,2) NOT NULL,
  `discountreason` text NOT NULL,
  `discharge_time` time NOT NULL,
  `discharge_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`billingid`, `patientid`, `appointmentid`, `billingdate`, `billingtime`, `discount`, `taxamount`, `discountreason`, `discharge_time`, `discharge_date`) VALUES
(2, 1, 1, '2019-06-15', '19:56:20', 0.00, 0.00, 'none', '00:00:00', '0000-00-00'),
(3, 3, 2, '2021-06-24', '14:39:11', 0.00, 0.00, 'none  ', '07:56:26', '2021-06-24'),
(4, 5, 4, '2021-06-24', '18:48:00', 0.00, 0.00, 'none ', '07:26:39', '2021-06-24'),
(5, 6, 5, '2021-06-24', '19:36:12', 0.00, 0.00, 'no discounts ', '07:54:07', '2021-06-24'),
(6, 7, 6, '2022-10-21', '18:18:42', 0.00, 0.00, ' none ', '01:06:07', '2022-10-26'),
(8, 9, 8, '2022-10-26', '15:50:35', 0.00, 0.00, ' none ', '07:57:00', '2022-10-27'),
(9, 11, 9, '2022-10-27', '17:13:42', 0.00, 0.00, ' none ', '01:15:39', '2022-11-12'),
(10, 12, 10, '2022-11-04', '16:15:26', 0.00, 0.00, 'none', '00:00:00', '0000-00-00'),
(11, 13, 11, '2022-11-04', '16:18:27', 0.00, 0.00, 'none', '00:00:00', '0000-00-00'),
(12, 14, 12, '2022-11-05', '11:13:34', 0.00, 0.00, ' none ', '03:52:06', '2022-11-05'),
(13, 17, 14, '2022-11-13', '15:51:26', 0.00, 0.00, ' none ', '08:27:18', '2022-11-13');

-- --------------------------------------------------------

--
-- Table structure for table `billing_records`
--

CREATE TABLE `billing_records` (
  `billingservice_id` int(10) NOT NULL,
  `billingid` int(10) NOT NULL,
  `bill_type_id` int(10) NOT NULL COMMENT 'id of service charge or treatment charge',
  `bill_type` varchar(250) NOT NULL,
  `bill_amount` float(10,2) NOT NULL,
  `bill_date` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing_records`
--

INSERT INTO `billing_records` (`billingservice_id`, `billingid`, `bill_type_id`, `bill_type`, `bill_amount`, `bill_date`, `status`) VALUES
(1, 2, 1, 'Consultancy Charge', 45.00, '2019-06-15', 'Active'),
(2, 2, 20, 'Treatment', 300.00, '2019-06-15', 'Active'),
(3, 2, 1, 'Prescription Charge', 45.00, '2019-06-15', 'Active'),
(4, 3, 2, 'Consultancy Charge', 55.00, '2021-06-24', 'Active'),
(5, 3, 20, 'Treatment', 300.00, '2021-06-24', 'Active'),
(6, 4, 5, 'Consultancy Charge', 14.00, '2021-06-24', 'Active'),
(7, 4, 20, 'Treatment', 179.00, '2021-06-24', 'Active'),
(8, 4, 2, 'Prescription Charge', 55.00, '2021-06-24', 'Active'),
(9, 5, 7, 'Consultancy Charge', 17.00, '2021-06-24', 'Active'),
(10, 5, 33, 'Treatment', 4850.00, '2021-06-24', 'Active'),
(11, 5, 3, 'Prescription Charge', 231.00, '2021-06-24', 'Active'),
(14, 6, 4, 'Prescription Charge', 3.00, '2022-10-24', 'Active'),
(15, 6, 9, 'Consultancy Charge', 12.00, '2022-10-24', 'Active'),
(16, 6, 20, 'Treatment', 179.00, '2022-10-24', 'Active'),
(17, 6, 20, 'Treatment', 179.00, '2022-10-24', 'Active'),
(18, 6, 20, 'Treatment', 179.00, '2022-10-24', 'Active'),
(19, 6, 5, 'Prescription Charge', 14.00, '2022-10-24', 'Active'),
(20, 3, 9, 'Consultancy Charge', 12.00, '2022-10-26', 'Active'),
(21, 3, 20, 'Treatment', 179.00, '2022-10-26', 'Active'),
(22, 8, 10, 'Consultancy Charge', 6.00, '2022-10-26', 'Active'),
(23, 8, 20, 'Treatment', 179.00, '2022-10-26', 'Active'),
(24, 8, 6, 'Prescription Charge', 59.00, '2022-10-26', 'Active'),
(25, 9, 11, 'Consultancy Charge', 4620.00, '2022-10-27', 'Active'),
(26, 9, 20, 'Treatment', 179.00, '2022-10-27', 'Active'),
(27, 9, 7, 'Prescription Charge', 17.00, '2022-10-27', 'Active'),
(28, 9, 8, 'Prescription Charge', 6.00, '2022-11-04', 'Active'),
(29, 9, 9, 'Prescription Charge', 0.00, '2022-11-04', 'Active'),
(30, 10, 10, 'Prescription Charge', 6.00, '2022-11-04', 'Active'),
(31, 12, 12, 'Consultancy Charge', 5.00, '2022-11-05', 'Active'),
(32, 12, 22, 'Treatment', 1750.00, '2022-11-05', 'Active'),
(33, 12, 11, 'Prescription Charge', 4620.00, '2022-11-05', 'Active'),
(34, 13, 13, 'Consultancy Charge', 200.00, '2022-11-13', 'Active'),
(35, 13, 33, 'Treatment', 4850.00, '2022-11-13', 'Active'),
(36, 13, 12, 'Prescription Charge', 5.00, '2022-11-13', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentid` int(10) NOT NULL,
  `departmentname` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentid`, `departmentname`, `description`, `status`) VALUES
(1, 'Medicine', 'Medicine', 'Active'),
(2, 'Cardiology', 'Provides medical care to patients who have problems with their heart or circulation.', 'Active'),
(3, 'Gynecology', 'Investigates and treats problems relating to the female urinary tract and reproductive organs, such as Endometriosis, infertility and incontinence', 'Active'),
(4, 'Haematology', 'These hospital services work with the laboratory. In addition doctors treat blood diseases and malignancies related to the blood', 'Active'),
(5, 'Maternity', 'Maternity wards provide antenatal care, delivery of babies and care during childbirth, and postnatal support', 'Active'),
(6, 'Nephrology', 'Monitors and assesses patients with various kidney (renal) problems and conditions', 'Active'),
(7, 'Oncology', 'A branch of medicine that deals with cancer and tumors. A medical professional who practices oncology is an oncologist. The Oncology department provides treatments, including radiotherapy and chemotherapy, for cancerous tumors and blood disorders', 'Active'),
(8, 'Orthopaedics', 'Treats conditions related to the musculoskeletal system, including joints, ligaments, bones, muscles, tendons and nerves', 'Active'),
(9, 'Radiology', 'Deals with the study and application of imaging technology like XRay', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorid` int(10) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `departmentid` int(10) NOT NULL,
  `loginid` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `education` varchar(25) NOT NULL,
  `experience` float(11,1) NOT NULL,
  `consultancy_charge` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctorid`, `doctorname`, `mobileno`, `departmentid`, `loginid`, `password`, `status`, `education`, `experience`, `consultancy_charge`) VALUES
(1, 'Carol Bosworth', '7002225650', 1, 'carol', 'password', 'Active', 'MBBS', 7.0, 7.00),
(2, 'Sirena S Rivera', '7023695696', 2, 'rivera', 'password', 'Active', 'DM', 4.0, 400.00),
(3, 'Will Williams', '7014545470', 2, 'wiliams', 'password', 'Active', 'DM', 7.0, 500.00),
(4, 'Thomas Borkowski', '7025558690', 3, 'thomas', 'password', 'Active', 'MD', 4.0, 155.00),
(5, 'Jason Graham', '7854025410', 4, 'jason', 'password', 'Active', 'DM', 5.0, 75.00),
(6, 'Viola McRoy', '7410002540', 5, 'viola', 'password', 'Active', 'MD', 8.0, 4200.00),
(7, 'Logan Fletcher', '7012569990', 7, 'logan', 'password', 'Active', 'MD', 5.0, 995.00),
(8, 'Ben Bernier', '7012225470', 6, 'ben', 'password', 'Active', 'DM', 3.0, 689.00),
(9, 'Anos', '1234567890', 2, 'Anos', '1234567890', 'Active', 'mbbs', 2.0, 12.00),
(10, 'Charles', '1234567890', 7, 'charles', 'charles172@', 'Active', 'MDS', 4.0, 500.00),
(11, 'Micheal', '1234567890', 4, 'micheal', 'micheal172@', 'Active', 'mbbs', 2.0, 200.00),
(12, 'James', '1234567890', 6, 'james', 'james172@', 'Active', 'md', 4.0, 200.00),
(13, 'Eren', '23456789809', 7, 'eren', 'eren172@', 'Active', 'mbbs', 2.0, 200.00),
(14, 'emil', '1234567890', 2, 'emil', 'emilbluemax', 'Active', 'mbbs', 4.0, 200.00);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_timings`
--

CREATE TABLE `doctor_timings` (
  `doctor_timings_id` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_timings`
--

INSERT INTO `doctor_timings` (`doctor_timings_id`, `doctorid`, `start_time`, `end_time`, `status`) VALUES
(7, 5, '09:30:00', '13:00:00', 'Active'),
(8, 6, '13:30:00', '17:00:00', 'Active'),
(19, 7, '14:00:00', '18:00:00', 'Active'),
(20, 8, '17:00:00', '21:00:00', 'Active'),
(21, 9, '13:00:00', '19:00:00', 'Active'),
(22, 4, '07:00:00', '11:00:00', 'Active'),
(31, 1, '01:02:00', '15:04:00', 'Active'),
(32, 10, '16:25:00', '01:00:00', 'Active'),
(33, 3, '18:00:00', '00:02:00', 'Active'),
(34, 2, '07:36:00', '15:37:00', 'Active'),
(37, 11, '07:00:00', '21:00:00', 'Active'),
(38, 12, '07:16:00', '22:18:00', 'Active'),
(39, 13, '06:21:00', '22:22:00', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicineid` int(10) NOT NULL,
  `medicinename` varchar(25) NOT NULL,
  `medicinecost` float(10,2) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicineid`, `medicinename`, `medicinecost`, `description`, `status`) VALUES
(1, 'Paracetamol', 3.00, 'For fever per day 1 pc', 'Active'),
(2, 'Clotrimazole', 14.00, 'Clotrimazole is an antifungal, prescribed for local fungal infections', 'Active'),
(3, 'Miconazole', 26.00, 'Prescribed for various skin infections such as jockitch and also for vaginal yeast infections', 'Active'),
(4, 'Nystatin', 6.00, 'Antifungal drug, prescribed for fungal infections of the skin mouth vagina and intestinal tract', 'Active'),
(5, 'Lotensin', 3.00, 'prevent your body from forming angiotensin', 'Active'),
(6, 'Cozaan', 5.00, 'ARBs block the effects of angiotensin on your heart.', 'Active'),
(7, 'Lovenox', 59.00, 'may prescribe an anticoagulant to prevent heart attack, stroke, or other serious health problems', 'Active'),
(8, 'Abemaciclib', 278.00, 'drug for the treatment of advanced or metastatic breast cancers.', 'Active'),
(9, 'Cyclophosphamide', 231.00, ' to treat lymphoma, multiple myeloma, leukemia, ovarian cancer, breast cancer, small cell lung cancer', 'Active'),
(10, 'Captopril', 92.00, 'used alone or in combination with other medications to treat high blood pressure and heart failure.', 'Active'),
(11, 'Enalapril', 18.00, 'to treat high blood pressure, diabetic kidney disease, and heart failure', 'Active'),
(12, 'Ramipril', 31.00, 'to treat high blood pressure, diabetic kidney disease', 'Active'),
(13, 'Hydroxyurea', 55.00, 'used in sickle-cell disease, essential thrombocythemia, chronic myelogenous leukemia and cervical cancer', 'Active'),
(14, 'Phenprocoumon', 258.00, 'Used for prevention of thrombosis', 'Active'),
(15, 'Losartan', 30.00, 'Losartan is an angiotensin II receptor blocker (ARB). It works by blocking a substance in the body that causes blood vessels to tighten. As a result, losartan relaxes the blood vessels. A lower blood pressure will increase the supply of the blood and oxygen to the heart.', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientid` int(10) NOT NULL,
  `patientname` varchar(50) NOT NULL,
  `admissiondate` date NOT NULL,
  `admissiontime` time NOT NULL,
  `address` varchar(250) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `city` varchar(25) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  `loginid` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patientid`, `patientname`, `admissiondate`, `admissiontime`, `address`, `mobileno`, `city`, `pincode`, `loginid`, `password`, `bloodgroup`, `gender`, `dob`, `status`) VALUES
(1, 'Johnny', '2019-06-15', '18:47:22', 'Dhanmondi', '2125798361', 'Dhaka', '1207', 'admin', '123456789', 'O+', 'MALE', '1990-01-01', 'Active'),
(3, 'Christine Moore', '2021-06-24', '14:38:04', '4327 Â Pride Avenue', '7012225690', 'Elmhurst', '63520', 'christine', 'password', 'A-', 'Female', '1992-02-12', 'Active'),
(4, 'Demoname', '2021-06-24', '15:26:32', 'demo address', '7474747474', 'demo city', '65432', 'demo', 'password', 'AB+', 'Male', '1995-02-02', 'Active'),
(5, 'Thomas Walters', '2021-06-24', '18:44:22', '1723  Cinnamon Lane', '7023658800', 'San Antonio', '67543', 'thomas', 'password', 'O-', 'Female', '1992-03-12', 'Active'),
(6, 'Eryn Carlos', '2021-06-24', '19:34:27', '2649 Wayside Lane', '7012225896', 'San Jose', '89762', 'carlos', 'password', 'A+', 'Female', '1994-03-12', 'Active'),
(7, 'allwin', '2022-10-21', '16:55:52', 'adc', '1234567890', 'BANGALORE CITY', '87654', 'allwin', '1234567890', 'B-', 'Male', '2014-02-21', 'Active'),
(9, 'Brian', '2022-10-26', '15:39:55', '14, Krishnappa Layout, R M V 2nd Stage, R M V', '9845154035', 'Bangalore', '56024', 'brian@gmail.com', 'brain172@', 'B+', 'MALE', '1999-02-27', 'Active'),
(11, 'Dean', '2022-10-27', '20:30:34', 'konnapaana agrahara', '1234567890', 'BANGALORE CITY', '56432', 'dean@gmail.com', 'dean172@', 'O+', 'Male', '2011-02-27', 'Active'),
(12, 'Dean', '2022-11-04', '20:44:29', 'adc', '1234567890', 'BANGALORE CITY', '56124', 'dean@gmail.com', 'dean172@', 'A-', 'Male', '2022-11-04', 'Active'),
(13, 'Dean', '2022-11-04', '20:47:35', 'adc', '1234567890', 'BANGALORE CITY', '56234', 'dean@gmail.com', 'dean172@', 'A+', 'Male', '2022-11-04', 'Active'),
(14, 'john', '2022-11-05', '14:57:29', 'adc', '1234567890', 'BANGALORE CITY', '56262', 'john@gmail.com', 'john172@', 'O+', 'Male', '2022-11-05', 'Active'),
(15, 'Dean', '2022-11-09', '12:33:21', 'adc', '1234567890', 'BANGALORE CITY', '56214', 'dean@gmail.com', 'dean172@', 'AB+', 'Male', '2022-11-03', 'Active'),
(16, 'Dean', '2022-11-09', '19:11:25', 'adc', '1234567890', 'BANGALORE CITY', '56324', 'dean@gmail.com', 'dean172@', 'A+', 'Male', '2022-11-10', 'Active'),
(17, 'armin', '2022-11-13', '20:19:02', 'siganshina', '23434546576868', 'wall maria', '560032', 'armin@gmail.com', 'armin172@', 'B+', 'MALE', '2008-02-13', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `paiddate` date NOT NULL,
  `paidtime` time NOT NULL,
  `paidamount` float(10,2) NOT NULL,
  `status` varchar(10) NOT NULL,
  `cardholder` varchar(50) NOT NULL,
  `cardnumber` int(25) NOT NULL,
  `cvvno` int(5) NOT NULL,
  `expdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentid`, `patientid`, `appointmentid`, `paiddate`, `paidtime`, `paidamount`, `status`, `cardholder`, `cardnumber`, `cvvno`, `expdate`) VALUES
(1, 5, 4, '2021-06-24', '19:26:51', 324.45, 'Active', 'thomas', 2147483647, 543, '2025-06-27'),
(2, 6, 5, '2021-06-24', '19:54:23', 6379.80, 'Active', 'eryn', 2147483647, 513, '2026-09-15'),
(3, 3, 2, '2021-06-24', '19:56:33', 372.75, 'Active', 'christian', 2147483647, 590, '2026-07-07'),
(5, 7, 6, '2022-10-26', '13:06:26', 594.30, 'Active', 'brian', 2147483647, 526, '2026-08-28'),
(13, 9, 8, '2022-10-27', '16:27:35', 774.90, 'Active', 'Brian', 914768647, 514, '2027-06-29'),
(14, 14, 12, '2022-11-05', '11:22:35', 6898.50, 'Active', 'john', 2147483647, 123, '2026-10-05'),
(17, 11, 9, '2022-11-12', '08:46:03', 5063.10, 'Active', 'dean', 2147483647, 134, '2022-11-19'),
(18, 17, 14, '2022-11-13', '15:57:46', 5307.75, 'Active', 'armin', 2147483647, 121, '2024-06-19');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescriptionid` int(10) NOT NULL,
  `treatment_records_id` int(11) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `prescriptiondate` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `appointmentid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescriptionid`, `treatment_records_id`, `doctorid`, `patientid`, `prescriptiondate`, `status`, `appointmentid`) VALUES
(1, 2, 1, 1, '2019-06-17', 'Active', 1),
(2, 3, 5, 5, '2021-06-25', 'Active', 4),
(3, 4, 7, 6, '2021-06-25', 'Active', 5),
(5, 2, 9, 7, '2022-10-25', 'Active', 6),
(6, 1, 10, 9, '2022-10-26', 'Active', 8),
(7, 8, 11, 11, '2022-10-27', 'Active', 9),
(8, 9, 11, 11, '2022-11-05', 'Active', 9),
(9, 10, 11, 11, '0000-00-00', 'Active', 9),
(10, 11, 11, 12, '2022-11-04', 'Active', 10),
(11, 12, 12, 14, '2022-11-05', 'Active', 12),
(12, 13, 13, 17, '2022-11-13', 'Active', 14);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_records`
--

CREATE TABLE `prescription_records` (
  `prescription_record_id` int(10) NOT NULL,
  `prescription_id` int(10) NOT NULL,
  `medicine_name` int(25) NOT NULL,
  `cost` float(10,2) NOT NULL,
  `unit` int(10) NOT NULL,
  `dosage` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescription_records`
--

INSERT INTO `prescription_records` (`prescription_record_id`, `prescription_id`, `medicine_name`, `cost`, `unit`, `dosage`, `status`) VALUES
(1, 1, 1, 3.00, 15, '1-1-1', 'Active'),
(2, 2, 13, 55.00, 1, '0-1-1', 'Active'),
(3, 3, 9, 231.00, 1, '1-0-1', 'Active'),
(5, 5, 2, 14.00, 1, '0-1-1', 'Active'),
(6, 6, 7, 59.00, 1, '0-0-1', 'Active'),
(7, 7, 2, 14.00, 1, '1-0-1', 'Active'),
(8, 7, 1, 3.00, 1, '1-0-1', 'Active'),
(9, 8, 4, 6.00, 1, '1-0-1', 'Active'),
(10, 10, 4, 6.00, 1, '0-0-1', 'Active'),
(11, 11, 9, 231.00, 20, '1-0-1', 'Active'),
(12, 12, 6, 5.00, 1, '1-1-1', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatmentid` int(10) NOT NULL,
  `treatmenttype` varchar(25) NOT NULL,
  `treatment_cost` decimal(10,2) NOT NULL,
  `note` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`treatmentid`, `treatmenttype`, `treatment_cost`, `note`, `status`) VALUES
(20, 'Blood Test', '179.00', 'test checks for levels of 10 different components of every major cell in your blood', 'Active'),
(21, 'Electrocardiogram', '70.00', 'Records the electrical activity of the heart', 'Active'),
(22, 'Echocardiogram', '1750.00', 'Provides an ultrasound picture that shows the structure of the heart chambers and surrounding areas, and it can show how well the heart is working.', 'Active'),
(23, 'Nuclear cardiology', '530.00', 'Nuclear imaging techniques use radioactive materials to study cardiovascular disorders and diseases in a noninvasive way.', 'Active'),
(24, 'Colposcopy', '318.00', 'procedure to visually examine the cervix as well as the vagina and vulva using a colposcope.', 'Active'),
(25, 'Colporrhaphy', '5518.00', 'surgical procedure in humans that repairs a defect in the wall of the vagina.', 'Active'),
(26, 'Spine Surgery', '97560.00', 'This entails opening the operative site with a long incision so the surgeon can view and access the spinal anatomy', 'Active'),
(27, 'Trauma surgery', '25448.00', 'surgical specialty that utilizes both operative and non-operative management to treat traumatic injuries, typically in an acute setting', 'Active'),
(28, 'Diagnostic Tests', '989.00', 'may include MRI, CT, Bone Scan, Ultra sound, blood tests', 'Active'),
(29, 'Chest XRay', '258.00', ' projection radiograph of the chest used to diagnose conditions affecting the chest, its contents, and nearby structures', 'Active'),
(30, 'Ultrasound of the Abdomen', '560.00', 'noninvasive procedure used to assess the organs and structures within the abdomen', 'Active'),
(31, 'Exercise Stress Test', '198.00', 'This test is good for evaluating chest pain to see if your heart is the cause.', 'Active'),
(32, 'Ultrasound of the Pelvis', '520.00', 'noninvasive diagnostic exam that produces images that are used to assess organs and structures within the female pelvis', 'Active'),
(33, 'Chemotherapy and Radiatio', '4850.00', 'Most common types of cancer treatment. They work by destroying these fast-growing cells.', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `treatment_records`
--

CREATE TABLE `treatment_records` (
  `treatment_records_id` int(10) NOT NULL,
  `treatmentid` int(10) NOT NULL,
  `appointmentid` int(10) NOT NULL,
  `patientid` int(10) NOT NULL,
  `doctorid` int(10) NOT NULL,
  `treatment_description` text NOT NULL,
  `uploads` varchar(100) NOT NULL,
  `treatment_date` date NOT NULL,
  `treatment_time` time NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `treatment_records`
--

INSERT INTO `treatment_records` (`treatment_records_id`, `treatmentid`, `appointmentid`, `patientid`, `doctorid`, `treatment_description`, `uploads`, `treatment_date`, `treatment_time`, `status`) VALUES
(1, 20, 1, 1, 1, 'Fever \r\ntake paracitamol', '1746614148', '2019-06-15', '17:00:00', 'Active'),
(2, 20, 2, 3, 2, 'Demo Treatment Description...', '20245sample_image.jpg', '2021-06-24', '18:24:00', 'Active'),
(3, 20, 4, 5, 5, 'to study the morphology of blood and blood-forming tissues', '853sample_image.jpg', '2021-06-24', '16:40:00', 'Active'),
(4, 33, 5, 6, 7, 'based on small cell lung cancer', '25208sample_image.jpg', '2021-06-24', '15:22:00', 'Active'),
(8, 20, 6, 7, 9, '1-0-1', '653225947BingImageOfTheDay.jpg', '2022-10-19', '16:34:00', 'Active'),
(9, 20, 2, 3, 9, 'adc', '1668656245', '2022-10-20', '18:09:00', 'Active'),
(10, 20, 8, 9, 10, 'Take this regularly', '1004288666female-medicine-doctor-hand-give-prescription-to-patient-hold-clipboard-pad-closeup-panace', '2022-10-26', '20:05:00', 'Active'),
(11, 20, 9, 11, 11, '1-0-1', '56035656', '2022-10-27', '20:43:00', 'Active'),
(12, 22, 12, 14, 12, '1-0-1', '776358096', '2022-11-05', '16:46:00', 'Active'),
(13, 33, 14, 17, 13, '1-0-1', '1651131617medical-prescription-ocr.webp', '2022-11-13', '20:23:00', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`),
  ADD UNIQUE KEY `adminname` (`adminname`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentid`),
  ADD KEY `doctorid` (`doctorid`),
  ADD KEY `patientid` (`patientid`),
  ADD KEY `departmentid` (`departmentid`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billingid`),
  ADD KEY `patientid` (`patientid`),
  ADD KEY `appointmentid` (`appointmentid`);

--
-- Indexes for table `billing_records`
--
ALTER TABLE `billing_records`
  ADD PRIMARY KEY (`billingservice_id`),
  ADD KEY `billingid` (`billingid`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorid`),
  ADD KEY `departmentid` (`departmentid`);

--
-- Indexes for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  ADD PRIMARY KEY (`doctor_timings_id`),
  ADD KEY `doctor_timings_ibfk_1` (`doctorid`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicineid`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientid`),
  ADD KEY `loginid` (`loginid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentid`),
  ADD KEY `patientid` (`patientid`),
  ADD KEY `appointmentid` (`appointmentid`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescriptionid`),
  ADD KEY `doctorid` (`doctorid`),
  ADD KEY `patientid` (`patientid`),
  ADD KEY `prescription_ibfk_3` (`treatment_records_id`),
  ADD KEY `prescription_ibfk_4` (`appointmentid`);

--
-- Indexes for table `prescription_records`
--
ALTER TABLE `prescription_records`
  ADD PRIMARY KEY (`prescription_record_id`),
  ADD KEY `prescription_id` (`prescription_id`),
  ADD KEY `medicine_name` (`medicine_name`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatmentid`);

--
-- Indexes for table `treatment_records`
--
ALTER TABLE `treatment_records`
  ADD PRIMARY KEY (`treatment_records_id`),
  ADD KEY `doctorid` (`doctorid`),
  ADD KEY `patientid` (`patientid`),
  ADD KEY `treatmentid` (`treatmentid`),
  ADD KEY `appointmentid` (`appointmentid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `billingid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `billing_records`
--
ALTER TABLE `billing_records`
  MODIFY `billingservice_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  MODIFY `doctor_timings_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicineid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescriptionid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `prescription_records`
--
ALTER TABLE `prescription_records`
  MODIFY `prescription_record_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatmentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `treatment_records`
--
ALTER TABLE `treatment_records`
  MODIFY `treatment_records_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `billing_ibfk_2` FOREIGN KEY (`appointmentid`) REFERENCES `appointment` (`appointmentid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `billing_records`
--
ALTER TABLE `billing_records`
  ADD CONSTRAINT `billing_records_ibfk_1` FOREIGN KEY (`billingid`) REFERENCES `billing` (`billingid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`departmentid`) REFERENCES `department` (`departmentid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor_timings`
--
ALTER TABLE `doctor_timings`
  ADD CONSTRAINT `doctor_timings_ibfk_1` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`appointmentid`) REFERENCES `appointment` (`appointmentid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescription_ibfk_2` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescription_ibfk_3` FOREIGN KEY (`treatment_records_id`) REFERENCES `treatment_records` (`treatment_records_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescription_ibfk_4` FOREIGN KEY (`appointmentid`) REFERENCES `appointment` (`appointmentid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescription_records`
--
ALTER TABLE `prescription_records`
  ADD CONSTRAINT `prescription_records_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescription` (`prescriptionid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescription_records_ibfk_2` FOREIGN KEY (`medicine_name`) REFERENCES `medicine` (`medicineid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `treatment_records`
--
ALTER TABLE `treatment_records`
  ADD CONSTRAINT `treatment_records_ibfk_1` FOREIGN KEY (`doctorid`) REFERENCES `doctor` (`doctorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treatment_records_ibfk_2` FOREIGN KEY (`patientid`) REFERENCES `patient` (`patientid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treatment_records_ibfk_3` FOREIGN KEY (`treatmentid`) REFERENCES `treatment` (`treatmentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `treatment_records_ibfk_4` FOREIGN KEY (`appointmentid`) REFERENCES `appointment` (`appointmentid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
