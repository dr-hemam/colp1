-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: evms
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Current Database: `evms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `evms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `evms`;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('3eb84df9f87b');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_account_types`
--

DROP TABLE IF EXISTS `control_account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_account_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `earns` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_account_types`
--

LOCK TABLES `control_account_types` WRITE;
/*!40000 ALTER TABLE `control_account_types` DISABLE KEYS */;
INSERT INTO `control_account_types` VALUES (1,'WRK','Work',1);
/*!40000 ALTER TABLE `control_account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlaccounts`
--

DROP TABLE IF EXISTS `controlaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlaccounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `budget` float DEFAULT NULL,
  `PMB_start` date DEFAULT NULL,
  `PMB_finish` date DEFAULT NULL,
  `PMU_start` date DEFAULT NULL,
  `PMU_finish` date DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `AccountType` int(11) DEFAULT NULL,
  `curve_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AccountType` (`AccountType`),
  KEY `curve_id` (`curve_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `controlaccounts_ibfk_1` FOREIGN KEY (`AccountType`) REFERENCES `control_account_types` (`id`),
  CONSTRAINT `controlaccounts_ibfk_2` FOREIGN KEY (`curve_id`) REFERENCES `spread_profile` (`id`),
  CONSTRAINT `controlaccounts_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlaccounts`
--

LOCK TABLES `controlaccounts` WRITE;
/*!40000 ALTER TABLE `controlaccounts` DISABLE KEYS */;
INSERT INTO `controlaccounts` VALUES (1,'CT.C614.S02001.02000','CMO Core Services',21700000,'2016-11-17','2017-11-16','2016-11-17','2017-11-16',NULL,1,1,1);
/*!40000 ALTER TABLE `controlaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_accounts`
--

DROP TABLE IF EXISTS `cost_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `ControlAccount` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `ControlAccount` (`ControlAccount`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `cost_accounts_ibfk_1` FOREIGN KEY (`ControlAccount`) REFERENCES `controlaccounts` (`id`),
  CONSTRAINT `cost_accounts_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `cost_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_accounts`
--

LOCK TABLES `cost_accounts` WRITE;
/*!40000 ALTER TABLE `cost_accounts` DISABLE KEYS */;
INSERT INTO `cost_accounts` VALUES (1,'CMOCore','CMO Timesheets',1,NULL);
/*!40000 ALTER TABLE `cost_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisations`
--

DROP TABLE IF EXISTS `organisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organisations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `description` text,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisations`
--

LOCK TABLES `organisations` WRITE;
/*!40000 ALTER TABLE `organisations` DISABLE KEYS */;
INSERT INTO `organisations` VALUES (1,'FUS','Fusion','Fusion is a joint venture between three major contrators thus; Morgan Sindal, BAM, and Ferovial with support from Logikal',1),(3,'FUS1','Fusion','Fusion is a joint venture between three major contrators thus; Morgan Sindal, BAM, and Ferovial',1),(4,'FUS2','Fusion','Fusion is a joint venture between three major contrators thus; Morgan Sindal, BAM, and Ferovial',1),(6,'FUS4','Fusion 4','Trial version to add organisation',1);
/*!40000 ALTER TABLE `organisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `description` text,
  `start` datetime DEFAULT NULL,
  `finish` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `cycle_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `owner` (`owner`),
  KEY `cycle_id` (`cycle_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`id`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`cycle_id`) REFERENCES `reportingcycles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'EW013','Enabling Works Contract',1,'Enabling works contract for HS2 project','2016-11-17 00:00:00','2017-11-16 00:00:00',1,1);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportingcycles`
--

DROP TABLE IF EXISTS `reportingcycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportingcycles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `cycle_type` text,
  `cycle_value` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportingcycles`
--

LOCK TABLES `reportingcycles` WRITE;
/*!40000 ALTER TABLE `reportingcycles` DISABLE KEYS */;
INSERT INTO `reportingcycles` VALUES (1,'01','4 Weeks Cycle','week',4,1);
/*!40000 ALTER TABLE `reportingcycles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(80) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin',1,1,1,1,1),(2,'Admin',1,1,1,1,1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spread_profile`
--

DROP TABLE IF EXISTS `spread_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spread_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `period1` varchar(3) DEFAULT NULL,
  `period2` varchar(3) DEFAULT NULL,
  `period3` varchar(3) DEFAULT NULL,
  `period4` varchar(3) DEFAULT NULL,
  `period5` varchar(3) DEFAULT NULL,
  `period6` varchar(3) DEFAULT NULL,
  `period7` varchar(3) DEFAULT NULL,
  `period8` varchar(3) DEFAULT NULL,
  `period9` varchar(3) DEFAULT NULL,
  `period10` varchar(3) DEFAULT NULL,
  `period11` varchar(3) DEFAULT NULL,
  `period12` varchar(3) DEFAULT NULL,
  `period13` varchar(3) DEFAULT NULL,
  `period14` varchar(3) DEFAULT NULL,
  `period15` varchar(3) DEFAULT NULL,
  `period16` varchar(3) DEFAULT NULL,
  `period17` varchar(3) DEFAULT NULL,
  `period18` varchar(3) DEFAULT NULL,
  `period19` varchar(3) DEFAULT NULL,
  `period20` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spread_profile`
--

LOCK TABLES `spread_profile` WRITE;
/*!40000 ALTER TABLE `spread_profile` DISABLE KEYS */;
INSERT INTO `spread_profile` VALUES (1,'LN','Linear','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5','5');
/*!40000 ALTER TABLE `spread_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(80) DEFAULT NULL,
  `lastname` varchar(80) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `Organisation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `Organisation` (`Organisation`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Organisation`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Hassan','Emam','hassan.emam@hotmail.com','hemam','$2a$12$NyvN./KDv.f9MkF/fSvu/u2iTKC7lWy0pUfYicllZ8gYgOEL8ayLy',1,NULL),(3,'Hassan','Emam','dr.hemam@yahoo.co.uk','hassan','$2a$12$JEZ2cRC1EZYqXY18lu.uLuelYZBUlzsEuhxytagFcfEnPYhE76Xam',1,NULL),(4,'Hassan','Emam','hemam@yahoo.com','hemam81','$2a$12$uj0sBJG2/91LVUOHTULUjehuFkFeOZaf4kvpk9uZz/yP7dMFKFfZW',1,NULL),(5,'Hassan','Emam','hassan@emam.me','hemam1981','$2a$12$vySIbygqbxO7ep18UMOt/e1rkSxkR6EYqLWbb.a4AjAwXsMMUybiG',1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-18 14:10:06
