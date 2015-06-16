CREATE DATABASE  IF NOT EXISTS `hrms_ssh` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hrms_ssh`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hrms_ssh
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
-- Table structure for table `cultivation`
--

DROP TABLE IF EXISTS `cultivation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cultivation` (
  `CultivationOid` int(11) NOT NULL AUTO_INCREMENT,
  `CultivationProject` varchar(45) NOT NULL,
  `CultivationType` varchar(45) NOT NULL,
  `CultivationInstruction` varchar(145) NOT NULL,
  `CultivationLocation` varchar(45) NOT NULL,
  `CultivationBeginDate` date NOT NULL,
  `CultivationEndDate` date NOT NULL,
  `CultivationChargerWorkerOid` int(11) NOT NULL,
  PRIMARY KEY (`CultivationOid`),
  UNIQUE KEY `CultivationOid_UNIQUE` (`CultivationOid`),
  KEY `fk_Cultivation_Woker1_idx` (`CultivationChargerWorkerOid`),
  CONSTRAINT `fk_Cultivation_Woker1` FOREIGN KEY (`CultivationChargerWorkerOid`) REFERENCES `worker` (`WorkerOid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultivation`
--

LOCK TABLES `cultivation` WRITE;
/*!40000 ALTER TABLE `cultivation` DISABLE KEYS */;
INSERT INTO `cultivation` VALUES (1,'Java基础编程','编程培训','学会JAR，方便你我他！','会议2室','2015-05-12','2015-06-12',1),(2,'C#基础编程','编程培训','我只过1%的生活！','会议2室','2015-06-12','2015-06-23',1);
/*!40000 ALTER TABLE `cultivation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-16 11:38:25
