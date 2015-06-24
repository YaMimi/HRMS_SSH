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
-- Table structure for table `vacation`
--

DROP TABLE IF EXISTS `vacation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacation` (
  `VacationOid` int(11) NOT NULL AUTO_INCREMENT,
  `VacationStartDate` date NOT NULL,
  `VacationEndDate` date NOT NULL,
  `VacationType` varchar(45) NOT NULL,
  `VacationReason` varchar(45) NOT NULL,
  `VacationResult` int(11) NOT NULL DEFAULT '0',
  `VacationWorkerOid` int(11) NOT NULL,
  PRIMARY KEY (`VacationOid`),
  UNIQUE KEY `VacationOid_UNIQUE` (`VacationOid`),
  KEY `fk_Vacation_Worker1_idx` (`VacationWorkerOid`),
  CONSTRAINT `fk_Vacation_Worker1` FOREIGN KEY (`VacationWorkerOid`) REFERENCES `worker` (`WorkerOid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacation`
--

LOCK TABLES `vacation` WRITE;
/*!40000 ALTER TABLE `vacation` DISABLE KEYS */;
INSERT INTO `vacation` VALUES (1,'2015-06-15','2015-06-15','病假','被锤子手机锤到手',0,2),(2,'2015-06-19','2015-06-19','事假','和李小花约会',1,2),(3,'2015-06-22','2015-06-26','丧假','我舅舅过世了',2,2),(4,'2015-06-25','2015-06-25','病假','asdfasdf',1,2),(5,'2015-06-30','2015-06-30','工伤假','sdfasdfasfasdf',2,2);
/*!40000 ALTER TABLE `vacation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-24 17:43:34
