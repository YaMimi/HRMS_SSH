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
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker` (
  `WorkerOid` int(11) NOT NULL AUTO_INCREMENT,
  `WorkerNo` varchar(45) NOT NULL,
  `WorkerName` varchar(45) NOT NULL,
  `WorkerSex` varchar(2) NOT NULL,
  `WorkerDepart` int(11) NOT NULL,
  `WorkerPermission` int(11) NOT NULL,
  `WorkerEntryDate` date NOT NULL,
  `WorkerId` varchar(45) NOT NULL,
  `WorkerBirthDate` date NOT NULL,
  `WorkerBirthPlace` varchar(45) NOT NULL,
  `WorkerAddress` varchar(45) NOT NULL,
  `WorkerBloodType` varchar(45) NOT NULL,
  `WorkerPolitical` varchar(45) NOT NULL,
  `WorkerNationality` varchar(45) NOT NULL,
  `WorkerEthnic` varchar(45) NOT NULL,
  `WorkerEducation` varchar(45) NOT NULL,
  `WorkerPhone` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `WorkerUnreadMessage` int(11) DEFAULT '0',
  PRIMARY KEY (`WorkerOid`),
  UNIQUE KEY `WorkerOid_UNIQUE` (`WorkerOid`),
  UNIQUE KEY `WorkerNo_UNIQUE` (`WorkerNo`),
  KEY `fk_Worker_Department1_idx` (`WorkerDepart`),
  CONSTRAINT `fk_Worker_Department1` FOREIGN KEY (`WorkerDepart`) REFERENCES `department` (`DepartmentOid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'201201001','王尼玛','女',1,4,'2012-01-01','1215613156','1978-09-07','广东深圳','陕西省','AB','群众','中国','汉族','本科','13800138000','123456',0),(2,'201201002','张全蛋','男',1,1,'2012-01-02','1215613153','1989-06-15','广东深圳','福建省','O','团员','中国','汉族','专科','10086100086','123456',0),(3,'201201003','王蜜桃','男',2,3,'2012-01-03','1235848684','1990-05-20','广东深圳','广东省','A','群众','中国','汉族','本科','10000100000','123456',3);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-16 10:55:08
