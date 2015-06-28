CREATE DATABASE  IF NOT EXISTS `hrms_ssh` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hrms_ssh`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hrms_ssh
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `SalaryOid` int(11) NOT NULL AUTO_INCREMENT,
  `SalaryDate` date NOT NULL,
  `SalaryHourly` float NOT NULL DEFAULT '0',
  `SalaryStandardTime` float NOT NULL DEFAULT '166.4',
  `SalaryActualTime` float NOT NULL DEFAULT '0',
  `SalaryWeekTime` float NOT NULL DEFAULT '0',
  `SalaryWeekendTime` float NOT NULL DEFAULT '0',
  `SalaryHolidayTime` float NOT NULL DEFAULT '0',
  `SalaryAttendanceReward` float NOT NULL DEFAULT '0',
  `SalaryROP` float NOT NULL DEFAULT '0',
  `SalaryTotal` float NOT NULL DEFAULT '0',
  `SalaryWorkerOid` int(11) NOT NULL,
  `SalaryResult` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SalaryOid`),
  UNIQUE KEY `SalaryOid_UNIQUE` (`SalaryOid`),
  KEY `fk_Salary_Worker1_idx` (`SalaryWorkerOid`),
  CONSTRAINT `fk_Salary_Worker1` FOREIGN KEY (`SalaryWorkerOid`) REFERENCES `worker` (`WorkerOid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (2,'2015-06-17',30,166.4,8.13333,4.01667,0.0333333,0.05,0,300,0,1,0),(11,'2015-06-26',15,166.4,4,0,0,0,0,311,0,2,0),(12,'2015-06-18',25,166.4,0,0,0,0,0,0,0,3,0),(14,'2014-05-01',30,166.4,18,4,3,1,0,0,990,1,1);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-25 13:40:27
