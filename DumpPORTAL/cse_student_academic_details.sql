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
-- Table structure for table `student_academic_details`
--

DROP TABLE IF EXISTS `student_academic_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_academic_details` (
  `rollno` varchar(20) NOT NULL,
  `tenscl` varchar(140) DEFAULT NULL,
  `tenmrks` varchar(10) DEFAULT NULL,
  `tenboard` varchar(40) DEFAULT NULL,
  `tenmed` varchar(15) DEFAULT NULL,
  `tenyop` varchar(25) DEFAULT NULL,
  `twlscl` varchar(140) DEFAULT NULL,
  `twlmrks` varchar(10) DEFAULT NULL,
  `twlboard` varchar(40) DEFAULT NULL,
  `twlmed` varchar(15) DEFAULT NULL,
  `twlyop` varchar(10) DEFAULT NULL,
  `dipcoll` varchar(140) DEFAULT NULL,
  `dipmrks` varchar(10) DEFAULT NULL,
  `dipboard` varchar(20) DEFAULT NULL,
  `dipmed` varchar(10) DEFAULT NULL,
  `dipyop` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rollno`),
  CONSTRAINT `stud_acad` FOREIGN KEY (`rollno`) REFERENCES `login`.`student_login_details` (`rollno`) ON DELETE NO ACTION ON UPDATE CASCADE
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

-- Dump completed on 2017-11-03 12:58:16
