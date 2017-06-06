-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (armv7l)
--
-- Host: localhost    Database: colp
-- ------------------------------------------------------
-- Server version	5.5.54-0+deb8u1

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
-- Current Database: `colp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `colp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `colp`;

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
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constraintanalysis`
--

DROP TABLE IF EXISTS `constraintanalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constraintanalysis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `reportingdate_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_constraintanalysis_projid_reportid_section` (`project_id`,`reportingdate_id`,`section_id`),
  KEY `reportingdate_id` (`reportingdate_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `constraintanalysis_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `constraintanalysis_ibfk_2` FOREIGN KEY (`reportingdate_id`) REFERENCES `reportingdates` (`id`),
  CONSTRAINT `constraintanalysis_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraintanalysis`
--

LOCK TABLES `constraintanalysis` WRITE;
/*!40000 ALTER TABLE `constraintanalysis` DISABLE KEYS */;
INSERT INTO `constraintanalysis` VALUES (1,1,1,1,1,NULL),(2,1,1,2,1,NULL),(3,1,2,1,1,NULL),(4,1,3,1,1,NULL);
/*!40000 ALTER TABLE `constraintanalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constraintanalysis_details`
--

DROP TABLE IF EXISTS `constraintanalysis_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constraintanalysis_details` (
  `constraintanalysis_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `constraint_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `can_do` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`constraintanalysis_id`,`task_id`,`constraint_id`),
  KEY `task_id` (`task_id`),
  KEY `constraint_id` (`constraint_id`),
  CONSTRAINT `constraintanalysis_details_ibfk_1` FOREIGN KEY (`constraintanalysis_id`) REFERENCES `constraintanalysis` (`id`),
  CONSTRAINT `constraintanalysis_details_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `lookaheads_details` (`id`),
  CONSTRAINT `constraintanalysis_details_ibfk_3` FOREIGN KEY (`constraint_id`) REFERENCES `constraints` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraintanalysis_details`
--

LOCK TABLES `constraintanalysis_details` WRITE;
/*!40000 ALTER TABLE `constraintanalysis_details` DISABLE KEYS */;
INSERT INTO `constraintanalysis_details` VALUES (1,1,1,1,1,1),(1,1,2,1,1,1),(1,1,3,1,1,1),(1,1,4,1,1,1),(1,1,5,1,1,1),(1,1,6,1,1,1),(1,1,7,1,1,1),(1,1,8,1,1,1),(1,1,9,1,1,1),(1,1,10,1,1,1),(1,1,11,1,1,1),(1,2,1,1,1,1),(1,2,2,1,1,1),(1,2,3,1,1,1),(1,2,4,1,1,1),(1,2,5,1,1,1),(1,2,6,1,1,1),(1,2,7,1,1,1),(1,2,8,1,1,1),(1,2,9,1,1,1),(1,2,10,1,1,1),(1,2,11,1,1,1),(2,3,1,1,1,1),(2,3,2,1,1,1),(2,3,3,1,1,1),(2,3,4,1,1,1),(2,3,5,0,1,1),(2,3,6,0,1,1),(2,3,7,0,1,1),(2,3,8,0,1,1),(2,3,9,0,1,1),(2,3,10,0,1,1),(2,3,11,0,1,1),(2,4,1,1,1,1),(2,4,2,1,1,1),(2,4,3,1,1,1),(2,4,4,1,1,1),(2,4,5,0,1,1),(2,4,6,0,1,1),(2,4,7,1,1,1),(2,4,8,0,1,1),(2,4,9,1,1,1),(2,4,10,0,1,1),(2,4,11,0,1,1),(3,5,1,1,1,1),(3,5,2,1,1,1),(3,5,3,1,1,1),(3,5,4,1,1,1),(3,5,5,1,1,1),(3,5,6,1,1,1),(3,5,7,1,1,1),(3,5,8,1,1,1),(3,5,9,1,1,1),(3,5,10,1,1,1),(3,5,11,1,1,1),(3,6,1,1,1,1),(3,6,2,1,1,1),(3,6,3,1,1,1),(3,6,4,1,1,1),(3,6,5,1,1,1),(3,6,6,1,1,1),(3,6,7,1,1,1),(3,6,8,1,1,1),(3,6,9,1,1,1),(3,6,10,1,1,1),(3,6,11,1,1,1),(4,7,1,1,1,1),(4,7,2,0,1,1),(4,7,3,1,1,1),(4,7,4,0,1,1),(4,7,5,1,1,1),(4,7,6,0,1,1),(4,7,7,0,1,1),(4,7,8,0,1,1),(4,7,9,0,1,1),(4,7,10,0,1,1),(4,7,11,0,1,1),(4,8,1,1,1,1),(4,8,2,0,1,1),(4,8,3,1,1,1),(4,8,4,0,1,1),(4,8,5,1,1,1),(4,8,6,0,1,1),(4,8,7,0,1,1),(4,8,8,0,1,1),(4,8,9,0,1,1),(4,8,10,0,1,1),(4,8,11,0,1,1),(4,9,1,1,1,1),(4,9,2,0,1,1),(4,9,3,1,1,1),(4,9,4,0,1,1),(4,9,5,1,1,1),(4,9,6,0,1,1),(4,9,7,0,1,1),(4,9,8,0,1,1),(4,9,9,0,1,1),(4,9,10,0,1,1),(4,9,11,0,1,1);
/*!40000 ALTER TABLE `constraintanalysis_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constraints`
--

DROP TABLE IF EXISTS `constraints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constraints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `constraints_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraints`
--

LOCK TABLES `constraints` WRITE;
/*!40000 ALTER TABLE `constraints` DISABLE KEYS */;
INSERT INTO `constraints` VALUES (1,'Consents',1,1),(2,'Community Engagement',1,1),(3,'Contract',1,1),(4,'Compensation Event',1,1),(5,'Design',1,1),(6,'Land Access',1,1),(7,'Method Statement',1,1),(8,'Resource',1,1),(9,'Equipment',1,1),(10,'Space',1,1),(11,'Prerequisite work',1,1),(12,'Other',1,1);
/*!40000 ALTER TABLE `constraints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delay_reasons`
--

DROP TABLE IF EXISTS `delay_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delay_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `delay_reasons_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delay_reasons`
--

LOCK TABLES `delay_reasons` WRITE;
/*!40000 ALTER TABLE `delay_reasons` DISABLE KEYS */;
INSERT INTO `delay_reasons` VALUES (1,'Change in priority instructed by Client or PM',1,1),(2,'Defects requiring rework',1,1),(3,'Interface with other packages',1,1),(4,'Lack of human resource',1,1),(5,'Late materials',1,1),(6,'Defective materials',1,1),(7,'Late information',1,1),(8,'Incomplete information',1,1),(9,'Make ready items not in place',1,1),(10,'Outside influence',1,1),(11,'Over/under estimation of what could be achieved',1,1),(12,'Prerequisite activity not recognised be responsible party',1,1),(13,'Weather',1,1),(14,'Other',1,1);
/*!40000 ALTER TABLE `delay_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookaheads`
--

DROP TABLE IF EXISTS `lookaheads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookaheads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `reportingdate_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_1` (`project_id`,`reportingdate_id`,`section_id`),
  KEY `reportingdate_id` (`reportingdate_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `lookaheads_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `lookaheads_ibfk_2` FOREIGN KEY (`reportingdate_id`) REFERENCES `reportingdates` (`id`),
  CONSTRAINT `lookaheads_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookaheads`
--

LOCK TABLES `lookaheads` WRITE;
/*!40000 ALTER TABLE `lookaheads` DISABLE KEYS */;
INSERT INTO `lookaheads` VALUES (1,1,1,1,1),(2,1,1,2,1),(3,1,2,1,1),(4,1,3,1,1);
/*!40000 ALTER TABLE `lookaheads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookaheads_details`
--

DROP TABLE IF EXISTS `lookaheads_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookaheads_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lookahead_id` int(11) DEFAULT NULL,
  `task_code` varchar(80) DEFAULT NULL,
  `task_name` varchar(80) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `finish` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_1_lookahead_details_lookahead_id_task_code` (`lookahead_id`,`task_code`),
  CONSTRAINT `lookaheads_details_ibfk_1` FOREIGN KEY (`lookahead_id`) REFERENCES `lookaheads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookaheads_details`
--

LOCK TABLES `lookaheads_details` WRITE;
/*!40000 ALTER TABLE `lookaheads_details` DISABLE KEYS */;
INSERT INTO `lookaheads_details` VALUES (1,1,'Task C1-10','Task C1-10','2016-11-17 00:00:00','2016-11-20 00:00:00',1),(2,1,'Task C1-20','Task C1-20','2016-11-18 00:00:00','2016-11-21 00:00:00',1),(3,2,'Task C2-10','Task C2-10','2016-11-17 00:00:00','2016-11-18 00:00:00',1),(4,2,'Task C2-20','Task C2-20','2016-11-18 00:00:00','2016-11-20 00:00:00',1),(5,3,'Task 24-1','Task 24-1','2016-11-25 00:00:00','2016-11-26 00:00:00',1),(6,3,'Task 24-2','Task 24-2','2016-11-26 00:00:00','2016-11-28 00:00:00',1),(7,4,'Task 1-12-1','Task 1-12-1','2017-12-01 00:00:00','2017-12-03 00:00:00',1),(8,4,'Task 1-12-2','Task 1-12-2','2017-12-01 00:00:00','2017-12-03 00:00:00',1),(9,4,'Task 1-12-3','Task 1-12-3','2017-12-02 00:00:00','2017-12-03 00:00:00',1);
/*!40000 ALTER TABLE `lookaheads_details` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisations`
--

LOCK TABLES `organisations` WRITE;
/*!40000 ALTER TABLE `organisations` DISABLE KEYS */;
INSERT INTO `organisations` VALUES (1,'FUS','Fusion','Fusion is a joint venture between Morgan Sindal, BAM Nutall and Ferrovial',1),(2,'Egis','Egis Rail','Egis Rail Account for Sherif Mahmoud',1),(3,'hochtief','HOCHTIEF','HOCHTIEF - construction, civil engineering and building. HOCHTIEF is one of the World\'s leading construction groups.',1),(4,'PES','PES.','PES Company',1),(5,'CONO','ConOccult Management','ConOccult Sample Organisation for Training',1),(6,'BSUni','Ball State University','Ball State University',1),(7,'AAL','Abdelaal Est','Abdelaal Est',1),(8,'C1-1','C1 project','hhh',1),(9,'1XFEm','1XFEm','1XFEm',1);
/*!40000 ALTER TABLE `organisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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
  `cycle_id` int(11) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `owner` (`owner`),
  KEY `cycle_id` (`cycle_id`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`id`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`cycle_id`) REFERENCES `reportingcycles` (`id`),
  CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`org_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'1EW03','Central Enabling Works Contract',1,'Enabling works for HS2\'s central section','2016-11-17 00:00:00','2017-11-16 00:00:00',1,1,1),(2,'MWCC','Main Works Contract N1',1,'Main civil works contract for HS2 northern section 2','2017-07-17 00:00:00','2020-07-17 00:00:00',1,1,1),(3,'SMP-1','Sample Project 1',7,'Sample project for demonstration only','2017-06-01 00:00:00','2018-05-30 00:00:00',1,5,1),(4,'AAL','Project 2',7,'Project 2','2017-06-15 00:00:00','2019-12-15 00:00:00',1,5,1);
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
  `week_start` text,
  `organisation_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `reportingcycles_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportingcycles`
--

LOCK TABLES `reportingcycles` WRITE;
/*!40000 ALTER TABLE `reportingcycles` DISABLE KEYS */;
INSERT INTO `reportingcycles` VALUES (1,'Weekly','Weekly','week',1,'0',1,1),(2,'Mnth1','Monthly','month',1,'0',1,1),(3,'conoweeklt','weekly','week',1,'0',5,1);
/*!40000 ALTER TABLE `reportingcycles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportingdates`
--

DROP TABLE IF EXISTS `reportingdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportingdates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rdate` datetime DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `reportingdates_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=397 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportingdates`
--

LOCK TABLES `reportingdates` WRITE;
/*!40000 ALTER TABLE `reportingdates` DISABLE KEYS */;
INSERT INTO `reportingdates` VALUES (1,'2016-11-17 00:00:00',1,1,0),(2,'2016-11-24 00:00:00',1,1,0),(3,'2016-12-01 00:00:00',1,1,0),(4,'2016-12-08 00:00:00',1,1,0),(5,'2016-12-15 00:00:00',1,1,0),(6,'2016-12-22 00:00:00',1,1,0),(7,'2016-12-29 00:00:00',1,1,0),(8,'2017-01-05 00:00:00',1,1,0),(9,'2017-01-12 00:00:00',1,1,0),(10,'2017-01-19 00:00:00',1,1,0),(11,'2017-01-26 00:00:00',1,1,0),(12,'2017-02-02 00:00:00',1,1,0),(13,'2017-02-09 00:00:00',1,1,0),(14,'2017-02-16 00:00:00',1,1,0),(15,'2017-02-23 00:00:00',1,1,0),(16,'2017-03-02 00:00:00',1,1,0),(17,'2017-03-09 00:00:00',1,1,0),(18,'2017-03-16 00:00:00',1,1,0),(19,'2017-03-23 00:00:00',1,1,0),(20,'2017-03-30 00:00:00',1,1,0),(21,'2017-04-06 00:00:00',1,1,0),(22,'2017-04-13 00:00:00',1,1,0),(23,'2017-04-20 00:00:00',1,1,0),(24,'2017-04-27 00:00:00',1,1,0),(25,'2017-05-04 00:00:00',1,1,0),(26,'2017-05-11 00:00:00',1,1,0),(27,'2017-05-18 00:00:00',1,1,0),(28,'2017-05-25 00:00:00',1,1,0),(29,'2017-06-01 00:00:00',1,1,0),(30,'2017-06-08 00:00:00',1,1,0),(31,'2017-06-15 00:00:00',1,1,0),(32,'2017-06-22 00:00:00',1,1,0),(33,'2017-06-29 00:00:00',1,1,0),(34,'2017-07-06 00:00:00',1,1,0),(35,'2017-07-13 00:00:00',1,1,0),(36,'2017-07-20 00:00:00',1,1,0),(37,'2017-07-27 00:00:00',1,1,0),(38,'2017-08-03 00:00:00',1,1,0),(39,'2017-08-10 00:00:00',1,1,0),(40,'2017-08-17 00:00:00',1,1,0),(41,'2017-08-24 00:00:00',1,1,0),(42,'2017-08-31 00:00:00',1,1,0),(43,'2017-09-07 00:00:00',1,1,0),(44,'2017-09-14 00:00:00',1,1,0),(45,'2017-09-21 00:00:00',1,1,0),(46,'2017-09-28 00:00:00',1,1,0),(47,'2017-10-05 00:00:00',1,1,0),(48,'2017-10-12 00:00:00',1,1,0),(49,'2017-10-19 00:00:00',1,1,0),(50,'2017-10-26 00:00:00',1,1,0),(51,'2017-11-02 00:00:00',1,1,0),(52,'2017-11-09 00:00:00',1,1,0),(53,'2017-11-16 00:00:00',1,1,0),(54,'2017-07-17 00:00:00',2,1,0),(55,'2017-07-24 00:00:00',2,1,0),(56,'2017-07-31 00:00:00',2,1,0),(57,'2017-08-07 00:00:00',2,1,0),(58,'2017-08-14 00:00:00',2,1,0),(59,'2017-08-21 00:00:00',2,1,0),(60,'2017-08-28 00:00:00',2,1,0),(61,'2017-09-04 00:00:00',2,1,0),(62,'2017-09-11 00:00:00',2,1,0),(63,'2017-09-18 00:00:00',2,1,0),(64,'2017-09-25 00:00:00',2,1,0),(65,'2017-10-02 00:00:00',2,1,0),(66,'2017-10-09 00:00:00',2,1,0),(67,'2017-10-16 00:00:00',2,1,0),(68,'2017-10-23 00:00:00',2,1,0),(69,'2017-10-30 00:00:00',2,1,0),(70,'2017-11-06 00:00:00',2,1,0),(71,'2017-11-13 00:00:00',2,1,0),(72,'2017-11-20 00:00:00',2,1,0),(73,'2017-11-27 00:00:00',2,1,0),(74,'2017-12-04 00:00:00',2,1,0),(75,'2017-12-11 00:00:00',2,1,0),(76,'2017-12-18 00:00:00',2,1,0),(77,'2017-12-25 00:00:00',2,1,0),(78,'2018-01-01 00:00:00',2,1,0),(79,'2018-01-08 00:00:00',2,1,0),(80,'2018-01-15 00:00:00',2,1,0),(81,'2018-01-22 00:00:00',2,1,0),(82,'2018-01-29 00:00:00',2,1,0),(83,'2018-02-05 00:00:00',2,1,0),(84,'2018-02-12 00:00:00',2,1,0),(85,'2018-02-19 00:00:00',2,1,0),(86,'2018-02-26 00:00:00',2,1,0),(87,'2018-03-05 00:00:00',2,1,0),(88,'2018-03-12 00:00:00',2,1,0),(89,'2018-03-19 00:00:00',2,1,0),(90,'2018-03-26 00:00:00',2,1,0),(91,'2018-04-02 00:00:00',2,1,0),(92,'2018-04-09 00:00:00',2,1,0),(93,'2018-04-16 00:00:00',2,1,0),(94,'2018-04-23 00:00:00',2,1,0),(95,'2018-04-30 00:00:00',2,1,0),(96,'2018-05-07 00:00:00',2,1,0),(97,'2018-05-14 00:00:00',2,1,0),(98,'2018-05-21 00:00:00',2,1,0),(99,'2018-05-28 00:00:00',2,1,0),(100,'2018-06-04 00:00:00',2,1,0),(101,'2018-06-11 00:00:00',2,1,0),(102,'2018-06-18 00:00:00',2,1,0),(103,'2018-06-25 00:00:00',2,1,0),(104,'2018-07-02 00:00:00',2,1,0),(105,'2018-07-09 00:00:00',2,1,0),(106,'2018-07-16 00:00:00',2,1,0),(107,'2018-07-23 00:00:00',2,1,0),(108,'2018-07-30 00:00:00',2,1,0),(109,'2018-08-06 00:00:00',2,1,0),(110,'2018-08-13 00:00:00',2,1,0),(111,'2018-08-20 00:00:00',2,1,0),(112,'2018-08-27 00:00:00',2,1,0),(113,'2018-09-03 00:00:00',2,1,0),(114,'2018-09-10 00:00:00',2,1,0),(115,'2018-09-17 00:00:00',2,1,0),(116,'2018-09-24 00:00:00',2,1,0),(117,'2018-10-01 00:00:00',2,1,0),(118,'2018-10-08 00:00:00',2,1,0),(119,'2018-10-15 00:00:00',2,1,0),(120,'2018-10-22 00:00:00',2,1,0),(121,'2018-10-29 00:00:00',2,1,0),(122,'2018-11-05 00:00:00',2,1,0),(123,'2018-11-12 00:00:00',2,1,0),(124,'2018-11-19 00:00:00',2,1,0),(125,'2018-11-26 00:00:00',2,1,0),(126,'2018-12-03 00:00:00',2,1,0),(127,'2018-12-10 00:00:00',2,1,0),(128,'2018-12-17 00:00:00',2,1,0),(129,'2018-12-24 00:00:00',2,1,0),(130,'2018-12-31 00:00:00',2,1,0),(131,'2019-01-07 00:00:00',2,1,0),(132,'2019-01-14 00:00:00',2,1,0),(133,'2019-01-21 00:00:00',2,1,0),(134,'2019-01-28 00:00:00',2,1,0),(135,'2019-02-04 00:00:00',2,1,0),(136,'2019-02-11 00:00:00',2,1,0),(137,'2019-02-18 00:00:00',2,1,0),(138,'2019-02-25 00:00:00',2,1,0),(139,'2019-03-04 00:00:00',2,1,0),(140,'2019-03-11 00:00:00',2,1,0),(141,'2019-03-18 00:00:00',2,1,0),(142,'2019-03-25 00:00:00',2,1,0),(143,'2019-04-01 00:00:00',2,1,0),(144,'2019-04-08 00:00:00',2,1,0),(145,'2019-04-15 00:00:00',2,1,0),(146,'2019-04-22 00:00:00',2,1,0),(147,'2019-04-29 00:00:00',2,1,0),(148,'2019-05-06 00:00:00',2,1,0),(149,'2019-05-13 00:00:00',2,1,0),(150,'2019-05-20 00:00:00',2,1,0),(151,'2019-05-27 00:00:00',2,1,0),(152,'2019-06-03 00:00:00',2,1,0),(153,'2019-06-10 00:00:00',2,1,0),(154,'2019-06-17 00:00:00',2,1,0),(155,'2019-06-24 00:00:00',2,1,0),(156,'2019-07-01 00:00:00',2,1,0),(157,'2019-07-08 00:00:00',2,1,0),(158,'2019-07-15 00:00:00',2,1,0),(159,'2019-07-22 00:00:00',2,1,0),(160,'2019-07-29 00:00:00',2,1,0),(161,'2019-08-05 00:00:00',2,1,0),(162,'2019-08-12 00:00:00',2,1,0),(163,'2019-08-19 00:00:00',2,1,0),(164,'2019-08-26 00:00:00',2,1,0),(165,'2019-09-02 00:00:00',2,1,0),(166,'2019-09-09 00:00:00',2,1,0),(167,'2019-09-16 00:00:00',2,1,0),(168,'2019-09-23 00:00:00',2,1,0),(169,'2019-09-30 00:00:00',2,1,0),(170,'2019-10-07 00:00:00',2,1,0),(171,'2019-10-14 00:00:00',2,1,0),(172,'2019-10-21 00:00:00',2,1,0),(173,'2019-10-28 00:00:00',2,1,0),(174,'2019-11-04 00:00:00',2,1,0),(175,'2019-11-11 00:00:00',2,1,0),(176,'2019-11-18 00:00:00',2,1,0),(177,'2019-11-25 00:00:00',2,1,0),(178,'2019-12-02 00:00:00',2,1,0),(179,'2019-12-09 00:00:00',2,1,0),(180,'2019-12-16 00:00:00',2,1,0),(181,'2019-12-23 00:00:00',2,1,0),(182,'2019-12-30 00:00:00',2,1,0),(183,'2020-01-06 00:00:00',2,1,0),(184,'2020-01-13 00:00:00',2,1,0),(185,'2020-01-20 00:00:00',2,1,0),(186,'2020-01-27 00:00:00',2,1,0),(187,'2020-02-03 00:00:00',2,1,0),(188,'2020-02-10 00:00:00',2,1,0),(189,'2020-02-17 00:00:00',2,1,0),(190,'2020-02-24 00:00:00',2,1,0),(191,'2020-03-02 00:00:00',2,1,0),(192,'2020-03-09 00:00:00',2,1,0),(193,'2020-03-16 00:00:00',2,1,0),(194,'2020-03-23 00:00:00',2,1,0),(195,'2020-03-30 00:00:00',2,1,0),(196,'2020-04-06 00:00:00',2,1,0),(197,'2020-04-13 00:00:00',2,1,0),(198,'2020-04-20 00:00:00',2,1,0),(199,'2020-04-27 00:00:00',2,1,0),(200,'2020-05-04 00:00:00',2,1,0),(201,'2020-05-11 00:00:00',2,1,0),(202,'2020-05-18 00:00:00',2,1,0),(203,'2020-05-25 00:00:00',2,1,0),(204,'2020-06-01 00:00:00',2,1,0),(205,'2020-06-08 00:00:00',2,1,0),(206,'2020-06-15 00:00:00',2,1,0),(207,'2020-06-22 00:00:00',2,1,0),(208,'2020-06-29 00:00:00',2,1,0),(209,'2020-07-06 00:00:00',2,1,0),(210,'2020-07-13 00:00:00',2,1,0),(211,'2020-07-20 00:00:00',2,1,0),(212,'2017-06-01 00:00:00',3,1,0),(213,'2017-06-08 00:00:00',3,1,0),(214,'2017-06-15 00:00:00',3,1,0),(215,'2017-06-22 00:00:00',3,1,0),(216,'2017-06-29 00:00:00',3,1,0),(217,'2017-07-06 00:00:00',3,1,0),(218,'2017-07-13 00:00:00',3,1,0),(219,'2017-07-20 00:00:00',3,1,0),(220,'2017-07-27 00:00:00',3,1,0),(221,'2017-08-03 00:00:00',3,1,0),(222,'2017-08-10 00:00:00',3,1,0),(223,'2017-08-17 00:00:00',3,1,0),(224,'2017-08-24 00:00:00',3,1,0),(225,'2017-08-31 00:00:00',3,1,0),(226,'2017-09-07 00:00:00',3,1,0),(227,'2017-09-14 00:00:00',3,1,0),(228,'2017-09-21 00:00:00',3,1,0),(229,'2017-09-28 00:00:00',3,1,0),(230,'2017-10-05 00:00:00',3,1,0),(231,'2017-10-12 00:00:00',3,1,0),(232,'2017-10-19 00:00:00',3,1,0),(233,'2017-10-26 00:00:00',3,1,0),(234,'2017-11-02 00:00:00',3,1,0),(235,'2017-11-09 00:00:00',3,1,0),(236,'2017-11-16 00:00:00',3,1,0),(237,'2017-11-23 00:00:00',3,1,0),(238,'2017-11-30 00:00:00',3,1,0),(239,'2017-12-07 00:00:00',3,1,0),(240,'2017-12-14 00:00:00',3,1,0),(241,'2017-12-21 00:00:00',3,1,0),(242,'2017-12-28 00:00:00',3,1,0),(243,'2018-01-04 00:00:00',3,1,0),(244,'2018-01-11 00:00:00',3,1,0),(245,'2018-01-18 00:00:00',3,1,0),(246,'2018-01-25 00:00:00',3,1,0),(247,'2018-02-01 00:00:00',3,1,0),(248,'2018-02-08 00:00:00',3,1,0),(249,'2018-02-15 00:00:00',3,1,0),(250,'2018-02-22 00:00:00',3,1,0),(251,'2018-03-01 00:00:00',3,1,0),(252,'2018-03-08 00:00:00',3,1,0),(253,'2018-03-15 00:00:00',3,1,0),(254,'2018-03-22 00:00:00',3,1,0),(255,'2018-03-29 00:00:00',3,1,0),(256,'2018-04-05 00:00:00',3,1,0),(257,'2018-04-12 00:00:00',3,1,0),(258,'2018-04-19 00:00:00',3,1,0),(259,'2018-04-26 00:00:00',3,1,0),(260,'2018-05-03 00:00:00',3,1,0),(261,'2018-05-10 00:00:00',3,1,0),(262,'2018-05-17 00:00:00',3,1,0),(263,'2018-05-24 00:00:00',3,1,0),(264,'2018-05-31 00:00:00',3,1,0),(265,'2017-06-15 00:00:00',4,1,0),(266,'2017-06-22 00:00:00',4,1,0),(267,'2017-06-29 00:00:00',4,1,0),(268,'2017-07-06 00:00:00',4,1,0),(269,'2017-07-13 00:00:00',4,1,0),(270,'2017-07-20 00:00:00',4,1,0),(271,'2017-07-27 00:00:00',4,1,0),(272,'2017-08-03 00:00:00',4,1,0),(273,'2017-08-10 00:00:00',4,1,0),(274,'2017-08-17 00:00:00',4,1,0),(275,'2017-08-24 00:00:00',4,1,0),(276,'2017-08-31 00:00:00',4,1,0),(277,'2017-09-07 00:00:00',4,1,0),(278,'2017-09-14 00:00:00',4,1,0),(279,'2017-09-21 00:00:00',4,1,0),(280,'2017-09-28 00:00:00',4,1,0),(281,'2017-10-05 00:00:00',4,1,0),(282,'2017-10-12 00:00:00',4,1,0),(283,'2017-10-19 00:00:00',4,1,0),(284,'2017-10-26 00:00:00',4,1,0),(285,'2017-11-02 00:00:00',4,1,0),(286,'2017-11-09 00:00:00',4,1,0),(287,'2017-11-16 00:00:00',4,1,0),(288,'2017-11-23 00:00:00',4,1,0),(289,'2017-11-30 00:00:00',4,1,0),(290,'2017-12-07 00:00:00',4,1,0),(291,'2017-12-14 00:00:00',4,1,0),(292,'2017-12-21 00:00:00',4,1,0),(293,'2017-12-28 00:00:00',4,1,0),(294,'2018-01-04 00:00:00',4,1,0),(295,'2018-01-11 00:00:00',4,1,0),(296,'2018-01-18 00:00:00',4,1,0),(297,'2018-01-25 00:00:00',4,1,0),(298,'2018-02-01 00:00:00',4,1,0),(299,'2018-02-08 00:00:00',4,1,0),(300,'2018-02-15 00:00:00',4,1,0),(301,'2018-02-22 00:00:00',4,1,0),(302,'2018-03-01 00:00:00',4,1,0),(303,'2018-03-08 00:00:00',4,1,0),(304,'2018-03-15 00:00:00',4,1,0),(305,'2018-03-22 00:00:00',4,1,0),(306,'2018-03-29 00:00:00',4,1,0),(307,'2018-04-05 00:00:00',4,1,0),(308,'2018-04-12 00:00:00',4,1,0),(309,'2018-04-19 00:00:00',4,1,0),(310,'2018-04-26 00:00:00',4,1,0),(311,'2018-05-03 00:00:00',4,1,0),(312,'2018-05-10 00:00:00',4,1,0),(313,'2018-05-17 00:00:00',4,1,0),(314,'2018-05-24 00:00:00',4,1,0),(315,'2018-05-31 00:00:00',4,1,0),(316,'2018-06-07 00:00:00',4,1,0),(317,'2018-06-14 00:00:00',4,1,0),(318,'2018-06-21 00:00:00',4,1,0),(319,'2018-06-28 00:00:00',4,1,0),(320,'2018-07-05 00:00:00',4,1,0),(321,'2018-07-12 00:00:00',4,1,0),(322,'2018-07-19 00:00:00',4,1,0),(323,'2018-07-26 00:00:00',4,1,0),(324,'2018-08-02 00:00:00',4,1,0),(325,'2018-08-09 00:00:00',4,1,0),(326,'2018-08-16 00:00:00',4,1,0),(327,'2018-08-23 00:00:00',4,1,0),(328,'2018-08-30 00:00:00',4,1,0),(329,'2018-09-06 00:00:00',4,1,0),(330,'2018-09-13 00:00:00',4,1,0),(331,'2018-09-20 00:00:00',4,1,0),(332,'2018-09-27 00:00:00',4,1,0),(333,'2018-10-04 00:00:00',4,1,0),(334,'2018-10-11 00:00:00',4,1,0),(335,'2018-10-18 00:00:00',4,1,0),(336,'2018-10-25 00:00:00',4,1,0),(337,'2018-11-01 00:00:00',4,1,0),(338,'2018-11-08 00:00:00',4,1,0),(339,'2018-11-15 00:00:00',4,1,0),(340,'2018-11-22 00:00:00',4,1,0),(341,'2018-11-29 00:00:00',4,1,0),(342,'2018-12-06 00:00:00',4,1,0),(343,'2018-12-13 00:00:00',4,1,0),(344,'2018-12-20 00:00:00',4,1,0),(345,'2018-12-27 00:00:00',4,1,0),(346,'2019-01-03 00:00:00',4,1,0),(347,'2019-01-10 00:00:00',4,1,0),(348,'2019-01-17 00:00:00',4,1,0),(349,'2019-01-24 00:00:00',4,1,0),(350,'2019-01-31 00:00:00',4,1,0),(351,'2019-02-07 00:00:00',4,1,0),(352,'2019-02-14 00:00:00',4,1,0),(353,'2019-02-21 00:00:00',4,1,0),(354,'2019-02-28 00:00:00',4,1,0),(355,'2019-03-07 00:00:00',4,1,0),(356,'2019-03-14 00:00:00',4,1,0),(357,'2019-03-21 00:00:00',4,1,0),(358,'2019-03-28 00:00:00',4,1,0),(359,'2019-04-04 00:00:00',4,1,0),(360,'2019-04-11 00:00:00',4,1,0),(361,'2019-04-18 00:00:00',4,1,0),(362,'2019-04-25 00:00:00',4,1,0),(363,'2019-05-02 00:00:00',4,1,0),(364,'2019-05-09 00:00:00',4,1,0),(365,'2019-05-16 00:00:00',4,1,0),(366,'2019-05-23 00:00:00',4,1,0),(367,'2019-05-30 00:00:00',4,1,0),(368,'2019-06-06 00:00:00',4,1,0),(369,'2019-06-13 00:00:00',4,1,0),(370,'2019-06-20 00:00:00',4,1,0),(371,'2019-06-27 00:00:00',4,1,0),(372,'2019-07-04 00:00:00',4,1,0),(373,'2019-07-11 00:00:00',4,1,0),(374,'2019-07-18 00:00:00',4,1,0),(375,'2019-07-25 00:00:00',4,1,0),(376,'2019-08-01 00:00:00',4,1,0),(377,'2019-08-08 00:00:00',4,1,0),(378,'2019-08-15 00:00:00',4,1,0),(379,'2019-08-22 00:00:00',4,1,0),(380,'2019-08-29 00:00:00',4,1,0),(381,'2019-09-05 00:00:00',4,1,0),(382,'2019-09-12 00:00:00',4,1,0),(383,'2019-09-19 00:00:00',4,1,0),(384,'2019-09-26 00:00:00',4,1,0),(385,'2019-10-03 00:00:00',4,1,0),(386,'2019-10-10 00:00:00',4,1,0),(387,'2019-10-17 00:00:00',4,1,0),(388,'2019-10-24 00:00:00',4,1,0),(389,'2019-10-31 00:00:00',4,1,0),(390,'2019-11-07 00:00:00',4,1,0),(391,'2019-11-14 00:00:00',4,1,0),(392,'2019-11-21 00:00:00',4,1,0),(393,'2019-11-28 00:00:00',4,1,0),(394,'2019-12-05 00:00:00',4,1,0),(395,'2019-12-12 00:00:00',4,1,0),(396,'2019-12-19 00:00:00',4,1,0);
/*!40000 ALTER TABLE `reportingdates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `organisation_id` (`organisation_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`),
  CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Project Manager',1,NULL,1),(2,'Project Engineer',1,1,1),(3,'Project Manager',5,NULL,1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(80) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `project_id` (`project_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `sections_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'C01','Section C1',1,NULL,1),(2,'C02','Section C2',1,NULL,1),(3,'C03','Section C3',1,NULL,1);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_project`
--

DROP TABLE IF EXISTS `user_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_project` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`project_id`,`user_id`),
  UNIQUE KEY `uix_1` (`project_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_project_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `user_project_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_project`
--

LOCK TABLES `user_project` WRITE;
/*!40000 ALTER TABLE `user_project` DISABLE KEYS */;
INSERT INTO `user_project` VALUES (1,1,1,NULL),(1,2,1,NULL),(2,3,1,1),(3,7,3,1),(4,7,3,1);
/*!40000 ALTER TABLE `user_project` ENABLE KEYS */;
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
  `organisation_id` int(11) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `confirmed_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Hassan','Emam','hassan.emam@hotmail.com','hassan','$2a$12$UfqXLs0gHouGmyq/rMDAPOGfJQN5QECR.QmbhHi1FIFpcTkV5CgrK',1,1,1,0,NULL),(2,'Emam','Emam','emam@hotmail.com','Emam','$2a$12$ja2Upqbyioxp/Vx/GI6jK.datHdrmXdEDAYnN9T5kXjiiRV00ngRa',1,0,1,0,NULL),(3,'Mohsen','Ammar','dr.hemam@hotmail.com','mammar','$2a$12$wxlRaIZZcuaxWi4JKQiT/eereBKW6G6lPUYTBNWDyyHe29c8d.GGa',1,0,0,0,NULL),(4,'Sherif','Mahmoud','smahmoud@live.com','smahmoud','$2a$12$L83OltI8a8/plhf8GQqSFOl/2OtOpLPVeyVbIUQBNhLrbTfWz7UMG',2,1,1,0,NULL),(5,'David','Nash','davidnash.email@gmail.com','dnash','$2a$12$MEGCpHeu46Uacfy8LN2A7e3z51UpJZLuiLf/bomiNIs187GwtrQT.',3,1,1,0,NULL),(6,'Ahmed','Al Senousy','Alsenosy15@gmail.com','ahmedalsenosy','$2a$12$OOrtR196AyUpFmpqs6/IoeIFCNWZTXQKi14hKuDo9UDw99m1lOIfa',4,1,1,0,NULL),(7,'Hassan','Emam','hassan@emam.me','h.emam','$2a$12$yv2K1EwHUiGssUnotS4iQO6g3qIJE6fvctkEwU0VGcuvzIx3o7gMq',5,1,1,0,NULL),(8,'Sherif','Attallah','sherif111@hotmail.com','sherifattallah','$2a$12$qKi0TCMCKzwdR305lQDPMOegs5eb5h.xf4QqGNBU8CSJDKoWM6akO',6,1,1,0,NULL),(9,'Mohamed','Abdelaal','md_mike@hotmail.com','mido','$2a$12$HCLQ1Iijx8TiYjjuHPO9KuUiN5zsHBkN/6lIDwTZkcR5nR.qvuEBq',7,1,1,0,NULL),(10,'hhhh','hhhhhh','hemam@logikalprojects.com','khabini81','$2a$12$6RnvjPnNbuXL4RCn/I5PGuNz6ibZiQz4YtrHfNrGY7PyRX6uQ0spy',8,1,1,0,NULL),(11,'Allien','Mars','alien@emam.me','alien@emam.me','$2a$12$yimK1ELpUbiReHTuAXkokOePeZ6ogNGJwmDokLd1VRTsVdplR8gKm',9,1,1,0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wwp_details`
--

DROP TABLE IF EXISTS `wwp_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wwp_details` (
  `wwp_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `mon` tinyint(1) DEFAULT NULL,
  `tue` tinyint(1) DEFAULT NULL,
  `wed` tinyint(1) DEFAULT NULL,
  `thu` tinyint(1) DEFAULT NULL,
  `fri` tinyint(1) DEFAULT NULL,
  `sat` tinyint(1) DEFAULT NULL,
  `sun` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `delayreason_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`wwp_id`,`task_id`),
  KEY `task_id` (`task_id`),
  KEY `user_id` (`user_id`),
  KEY `delayreason_id` (`delayreason_id`),
  CONSTRAINT `wwp_details_ibfk_1` FOREIGN KEY (`wwp_id`) REFERENCES `wwps` (`id`),
  CONSTRAINT `wwp_details_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `lookaheads_details` (`id`),
  CONSTRAINT `wwp_details_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `wwp_details_ibfk_4` FOREIGN KEY (`delayreason_id`) REFERENCES `delay_reasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wwp_details`
--

LOCK TABLES `wwp_details` WRITE;
/*!40000 ALTER TABLE `wwp_details` DISABLE KEYS */;
INSERT INTO `wwp_details` VALUES (1,1,1,1,1,1,0,0,0,0,1,1,1,NULL),(1,2,1,0,0,1,1,1,0,0,1,1,1,NULL),(2,3,1,1,1,1,0,0,0,0,1,1,1,NULL),(2,4,1,0,1,1,1,0,0,0,0,1,1,2),(3,5,1,1,1,1,0,0,0,0,1,1,1,NULL),(3,6,1,0,1,1,1,0,0,0,0,1,1,8),(4,7,1,0,0,0,0,0,0,0,1,1,1,NULL),(4,8,2,0,0,0,0,0,0,0,0,1,1,13),(4,9,2,0,0,0,0,0,0,0,1,1,1,NULL);
/*!40000 ALTER TABLE `wwp_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wwps`
--

DROP TABLE IF EXISTS `wwps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wwps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `reportingdate_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `ppc` float DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_wwp_projid_reportid_section` (`project_id`,`reportingdate_id`,`section_id`),
  KEY `reportingdate_id` (`reportingdate_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `wwps_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `wwps_ibfk_2` FOREIGN KEY (`reportingdate_id`) REFERENCES `reportingdates` (`id`),
  CONSTRAINT `wwps_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wwps`
--

LOCK TABLES `wwps` WRITE;
/*!40000 ALTER TABLE `wwps` DISABLE KEYS */;
INSERT INTO `wwps` VALUES (1,1,1,1,1,1,1),(2,1,1,2,0.5,1,1),(3,1,2,1,0.5,1,1),(4,1,3,1,0.666667,1,1);
/*!40000 ALTER TABLE `wwps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-05 15:56:36
