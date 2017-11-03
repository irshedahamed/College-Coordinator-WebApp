-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: 182.74.154.218    Database: cse
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `student_personal`
--

DROP TABLE IF EXISTS `student_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_personal` (
  `rollno` varchar(20) NOT NULL DEFAULT '',
  `regno` varchar(20) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `bloodgrp` varchar(10) DEFAULT NULL,
  `batch` varchar(10) DEFAULT NULL,
  `course` varchar(20) DEFAULT NULL,
  `dept` varchar(20) DEFAULT NULL,
  `sec` varchar(15) DEFAULT NULL,
  `mobileno` varchar(15) DEFAULT NULL,
  `mailid` varchar(50) DEFAULT NULL,
  `food` varchar(10) DEFAULT NULL,
  `accomodation` varchar(20) DEFAULT NULL,
  `initial` varchar(10) DEFAULT NULL,
  `model_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rollno`),
  KEY `rollno` (`rollno`),
  KEY `batch_fk_idx` (`batch`),
  CONSTRAINT `batch_fk` FOREIGN KEY (`batch`) REFERENCES `sjitportal`.`regulations` (`batch`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stud_perso_fk` FOREIGN KEY (`rollno`) REFERENCES `login`.`student_login_details` (`rollno`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-03 12:58:28
