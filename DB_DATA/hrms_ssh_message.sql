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
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `MessageOid` int(11) NOT NULL AUTO_INCREMENT,
  `MessageDate` date NOT NULL,
  `MessageTitle` varchar(45) NOT NULL,
  `MessageContent` varchar(145) NOT NULL,
  `MessageWorkerOid` int(11) NOT NULL,
  PRIMARY KEY (`MessageOid`),
  UNIQUE KEY `MessageOid_UNIQUE` (`MessageOid`),
  KEY `fk_Message_Woker1_idx` (`MessageWorkerOid`),
  CONSTRAINT `fk_Message_Woker1` FOREIGN KEY (`MessageWorkerOid`) REFERENCES `worker` (`WorkerOid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'2015-06-11','系统公告','系统将于6月14号13-16点进行维护，届时将无法登陆。',1),(2,'2015-06-12','系统公告','请未更新员工ID卡的员工带ID卡到技术部进行更新。否则将无法正常使用。',1),(3,'2015-06-12','部门公告','请人事部员工与周四下午3点与会议三室进行周会。',1),(9,'2015-06-13','凤飞飞','阿萨德发',1),(10,'2015-06-13','12345','上山打老虎',1),(11,'2015-06-13','sadfas','asfasdf',1),(12,'2015-06-14','asd','asdasd',1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
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
