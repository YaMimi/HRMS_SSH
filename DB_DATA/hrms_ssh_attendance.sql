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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `AttendanceOid` int(11) NOT NULL AUTO_INCREMENT,
  `AttendanceDate` date NOT NULL,
  `AttendanceOnTime` time DEFAULT NULL,
  `AttendanceOffTime` time DEFAULT NULL,
  `AttendanceState` int(11) NOT NULL DEFAULT '1',
  `AttendanceWorkerOid` int(11) NOT NULL,
  PRIMARY KEY (`AttendanceOid`),
  UNIQUE KEY `AttendanceOid_UNIQUE` (`AttendanceOid`),
  KEY `fk_Attendance_Worker1_idx` (`AttendanceWorkerOid`),
  CONSTRAINT `fk_Attendance_Worker1` FOREIGN KEY (`AttendanceWorkerOid`) REFERENCES `worker` (`WorkerOid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'2015-06-08','09:02:00','18:30:00',1,1),(2,'2015-06-09','09:10:00','18:20:00',1,1),(3,'2015-06-10','08:12:00','18:32:00',1,1),(5,'2015-06-12','08:30:00','17:55:00',1,1),(6,'2015-06-13','09:00:00','18:06:00',1,1),(9,'2015-06-11','09:15:05','09:15:17',1,1),(12,'2015-06-13','12:20:48','12:21:04',1,2),(13,'2015-06-13','12:21:26','12:22:12',1,3),(15,'2015-06-17','23:37:39','23:40:24',1,1),(21,'2015-06-20','08:52:52','08:54:19',3,1),(31,'2015-06-18','10:53:56','10:55:27',1,1),(36,'2015-06-18','11:12:05','11:15:07',1,2),(37,'2015-06-19','11:21:35','11:22:13',3,1),(40,'2015-06-26','06:23:38','18:24:23',1,1),(55,'2015-06-18','17:22:42','17:22:53',1,3);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-25 13:40:28
