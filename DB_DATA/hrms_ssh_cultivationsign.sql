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
-- Table structure for table `cultivationsign`
--

DROP TABLE IF EXISTS `cultivationsign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cultivationsign` (
  `CultivationSignOid` int(11) NOT NULL AUTO_INCREMENT,
  `CultivationSignCultivationOid` int(11) NOT NULL,
  `CultivationSignWorkerOid` int(11) NOT NULL,
  `CultivationSignResult` int(11) DEFAULT NULL,
  PRIMARY KEY (`CultivationSignOid`),
  UNIQUE KEY `CultivationSignOid_UNIQUE` (`CultivationSignOid`),
  KEY `fk_CultivationSign_Cultivation_idx` (`CultivationSignCultivationOid`),
  KEY `fk_CultivationSign_Woker1_idx` (`CultivationSignWorkerOid`),
  CONSTRAINT `fk_CultivationSign_Cultivation` FOREIGN KEY (`CultivationSignCultivationOid`) REFERENCES `cultivation` (`CultivationOid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CultivationSign_Woker1` FOREIGN KEY (`CultivationSignWorkerOid`) REFERENCES `worker` (`WorkerOid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cultivationsign`
--

LOCK TABLES `cultivationsign` WRITE;
/*!40000 ALTER TABLE `cultivationsign` DISABLE KEYS */;
INSERT INTO `cultivationsign` VALUES (1,1,2,1),(2,2,2,1);
/*!40000 ALTER TABLE `cultivationsign` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-17  0:39:51
