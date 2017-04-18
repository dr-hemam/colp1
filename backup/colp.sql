-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: colp
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
INSERT INTO `alembic_version` VALUES ('b16f95274846');
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
  `is_active` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_constraintanalysis_projid_reportid_section` (`project_id`,`reportingdate_id`,`section_id`),
  KEY `reportingdate_id` (`reportingdate_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `constraintanalysis_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `constraintanalysis_ibfk_2` FOREIGN KEY (`reportingdate_id`) REFERENCES `reportingdates` (`id`),
  CONSTRAINT `constraintanalysis_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraintanalysis`
--

LOCK TABLES `constraintanalysis` WRITE;
/*!40000 ALTER TABLE `constraintanalysis` DISABLE KEYS */;
INSERT INTO `constraintanalysis` VALUES (1,1,1,1,NULL,1),(2,1,1,1,NULL,2);
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
  KEY `constraint_id` (`constraint_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `constraintanalysis_details_ibfk_1` FOREIGN KEY (`constraint_id`) REFERENCES `constraints` (`id`),
  CONSTRAINT `constraintanalysis_details_ibfk_2` FOREIGN KEY (`constraintanalysis_id`) REFERENCES `constraintanalysis` (`id`),
  CONSTRAINT `constraintanalysis_details_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `lookaheads_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraintanalysis_details`
--

LOCK TABLES `constraintanalysis_details` WRITE;
/*!40000 ALTER TABLE `constraintanalysis_details` DISABLE KEYS */;
INSERT INTO `constraintanalysis_details` VALUES (1,17,1,1,1,1),(1,17,2,1,1,1),(1,17,3,1,1,1),(1,17,4,1,1,1),(1,17,6,1,1,1),(1,17,7,1,1,1),(1,17,8,1,1,1),(1,18,1,1,1,1),(1,18,2,1,1,1),(1,18,3,1,1,1),(1,18,4,1,1,1),(1,18,6,1,1,1),(1,18,7,1,1,1),(1,18,8,1,1,1),(2,19,1,1,1,1),(2,19,2,1,1,1),(2,19,3,0,1,1),(2,19,4,0,1,1),(2,19,6,0,1,1),(2,19,7,0,1,1),(2,19,8,0,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraints`
--

LOCK TABLES `constraints` WRITE;
/*!40000 ALTER TABLE `constraints` DISABLE KEYS */;
INSERT INTO `constraints` VALUES (1,'Community Engagement',1,1),(2,'Design',1,1),(3,'Land Access',1,1),(4,'Method Statement',1,1),(5,'Method Statement',1,0),(6,'Resource',1,1),(7,'Equipment',1,1),(8,'Prerequisite work',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delay_reasons`
--

LOCK TABLES `delay_reasons` WRITE;
/*!40000 ALTER TABLE `delay_reasons` DISABLE KEYS */;
INSERT INTO `delay_reasons` VALUES (1,'Change in priority instructed by Client or PM',1,1);
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
  `is_active` tinyint(1) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_1` (`project_id`,`reportingdate_id`,`section_id`),
  KEY `reportingdate_id` (`reportingdate_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `lookaheads_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `lookaheads_ibfk_2` FOREIGN KEY (`reportingdate_id`) REFERENCES `reportingdates` (`id`),
  CONSTRAINT `lookaheads_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookaheads`
--

LOCK TABLES `lookaheads` WRITE;
/*!40000 ALTER TABLE `lookaheads` DISABLE KEYS */;
INSERT INTO `lookaheads` VALUES (7,1,1,1,1),(8,1,1,1,2),(9,1,1,1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookaheads_details`
--

LOCK TABLES `lookaheads_details` WRITE;
/*!40000 ALTER TABLE `lookaheads_details` DISABLE KEYS */;
INSERT INTO `lookaheads_details` VALUES (17,7,'10','Task 10','2016-11-18 00:00:00','2016-11-20 00:00:00',1),(18,7,'20','Task 20','2016-11-22 00:00:00','2016-11-26 00:00:00',1),(19,8,'30','Task 30','2016-11-20 00:00:00','2016-11-24 00:00:00',1),(20,9,'50','Task 50','2016-12-22 00:00:00','2016-12-27 00:00:00',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisations`
--

LOCK TABLES `organisations` WRITE;
/*!40000 ALTER TABLE `organisations` DISABLE KEYS */;
INSERT INTO `organisations` VALUES (1,'FUS','Fusion','Fusion JV',1);
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
  KEY `cycle_id` (`cycle_id`),
  KEY `org_id` (`org_id`),
  KEY `owner` (`owner`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`cycle_id`) REFERENCES `reportingcycles` (`id`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`org_id`) REFERENCES `organisations` (`id`),
  CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`owner`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'1EW03','Central Enabling Works Package',1,'Enabling works package CMO core services','2016-11-17 00:00:00','2017-11-16 00:00:00',1,1,1),(2,'GOL','Gold Line Metro',1,'Doha underground metro project','2015-02-14 00:00:00','2019-07-31 00:00:00',1,1,1),(5,'GOL1','Gold Line project',1,'Doha underground metro project','2015-02-14 00:00:00','2018-07-31 00:00:00',1,1,1),(6,'QCC','Doha Convention Center and Tower',1,'Doha convention center and tower project','2009-02-10 00:00:00','2008-12-24 00:00:00',1,1,1),(7,'DXB','Dubai Insternational Airport',1,'Dubai international airport expansion','2005-01-10 00:00:00','2007-02-13 00:00:00',1,1,1);
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
  `is_active` tinyint(1) DEFAULT NULL,
  `organisation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `reportingcycles_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportingcycles`
--

LOCK TABLES `reportingcycles` WRITE;
/*!40000 ALTER TABLE `reportingcycles` DISABLE KEYS */;
INSERT INTO `reportingcycles` VALUES (1,'Weekly','Weekly','week',1,'0',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=582 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportingdates`
--

LOCK TABLES `reportingdates` WRITE;
/*!40000 ALTER TABLE `reportingdates` DISABLE KEYS */;
INSERT INTO `reportingdates` VALUES (1,'2016-11-17 00:00:00',1,1,0),(2,'2016-11-24 00:00:00',1,1,0),(3,'2016-12-01 00:00:00',1,1,0),(4,'2016-12-08 00:00:00',1,1,0),(5,'2016-12-15 00:00:00',1,1,0),(6,'2016-12-22 00:00:00',1,1,0),(7,'2016-12-29 00:00:00',1,1,0),(8,'2017-01-05 00:00:00',1,1,0),(9,'2017-01-12 00:00:00',1,1,0),(10,'2017-01-19 00:00:00',1,1,0),(11,'2017-01-26 00:00:00',1,1,0),(12,'2017-02-02 00:00:00',1,1,0),(13,'2017-02-09 00:00:00',1,1,0),(14,'2017-02-16 00:00:00',1,1,0),(15,'2017-02-23 00:00:00',1,1,0),(16,'2017-03-02 00:00:00',1,1,0),(17,'2017-03-09 00:00:00',1,1,0),(18,'2017-03-16 00:00:00',1,1,0),(19,'2017-03-23 00:00:00',1,1,0),(20,'2017-03-30 00:00:00',1,1,0),(21,'2017-04-06 00:00:00',1,1,0),(22,'2017-04-13 00:00:00',1,1,0),(23,'2017-04-20 00:00:00',1,1,0),(24,'2017-04-27 00:00:00',1,1,0),(25,'2017-05-04 00:00:00',1,1,0),(26,'2017-05-11 00:00:00',1,1,0),(27,'2017-05-18 00:00:00',1,1,0),(28,'2017-05-25 00:00:00',1,1,0),(29,'2017-06-01 00:00:00',1,1,0),(30,'2017-06-08 00:00:00',1,1,0),(31,'2017-06-15 00:00:00',1,1,0),(32,'2017-06-22 00:00:00',1,1,0),(33,'2017-06-29 00:00:00',1,1,0),(34,'2017-07-06 00:00:00',1,1,0),(35,'2017-07-13 00:00:00',1,1,0),(36,'2017-07-20 00:00:00',1,1,0),(37,'2017-07-27 00:00:00',1,1,0),(38,'2017-08-03 00:00:00',1,1,0),(39,'2017-08-10 00:00:00',1,1,0),(40,'2017-08-17 00:00:00',1,1,0),(41,'2017-08-24 00:00:00',1,1,0),(42,'2017-08-31 00:00:00',1,1,0),(43,'2017-09-07 00:00:00',1,1,0),(44,'2017-09-14 00:00:00',1,1,0),(45,'2017-09-21 00:00:00',1,1,0),(46,'2017-09-28 00:00:00',1,1,0),(47,'2017-10-05 00:00:00',1,1,0),(48,'2017-10-12 00:00:00',1,1,0),(49,'2017-10-19 00:00:00',1,1,0),(50,'2017-10-26 00:00:00',1,1,0),(51,'2017-11-02 00:00:00',1,1,0),(52,'2017-11-09 00:00:00',1,1,0),(53,'2017-11-16 00:00:00',1,1,0),(54,'2015-02-14 00:00:00',2,1,0),(55,'2015-02-21 00:00:00',2,1,0),(56,'2015-02-28 00:00:00',2,1,0),(57,'2015-03-07 00:00:00',2,1,0),(58,'2015-03-14 00:00:00',2,1,0),(59,'2015-03-21 00:00:00',2,1,0),(60,'2015-03-28 00:00:00',2,1,0),(61,'2015-04-04 00:00:00',2,1,0),(62,'2015-04-11 00:00:00',2,1,0),(63,'2015-04-18 00:00:00',2,1,0),(64,'2015-04-25 00:00:00',2,1,0),(65,'2015-05-02 00:00:00',2,1,0),(66,'2015-05-09 00:00:00',2,1,0),(67,'2015-05-16 00:00:00',2,1,0),(68,'2015-05-23 00:00:00',2,1,0),(69,'2015-05-30 00:00:00',2,1,0),(70,'2015-06-06 00:00:00',2,1,0),(71,'2015-06-13 00:00:00',2,1,0),(72,'2015-06-20 00:00:00',2,1,0),(73,'2015-06-27 00:00:00',2,1,0),(74,'2015-07-04 00:00:00',2,1,0),(75,'2015-07-11 00:00:00',2,1,0),(76,'2015-07-18 00:00:00',2,1,0),(77,'2015-07-25 00:00:00',2,1,0),(78,'2015-08-01 00:00:00',2,1,0),(79,'2015-08-08 00:00:00',2,1,0),(80,'2015-08-15 00:00:00',2,1,0),(81,'2015-08-22 00:00:00',2,1,0),(82,'2015-08-29 00:00:00',2,1,0),(83,'2015-09-05 00:00:00',2,1,0),(84,'2015-09-12 00:00:00',2,1,0),(85,'2015-09-19 00:00:00',2,1,0),(86,'2015-09-26 00:00:00',2,1,0),(87,'2015-10-03 00:00:00',2,1,0),(88,'2015-10-10 00:00:00',2,1,0),(89,'2015-10-17 00:00:00',2,1,0),(90,'2015-10-24 00:00:00',2,1,0),(91,'2015-10-31 00:00:00',2,1,0),(92,'2015-11-07 00:00:00',2,1,0),(93,'2015-11-14 00:00:00',2,1,0),(94,'2015-11-21 00:00:00',2,1,0),(95,'2015-11-28 00:00:00',2,1,0),(96,'2015-12-05 00:00:00',2,1,0),(97,'2015-12-12 00:00:00',2,1,0),(98,'2015-12-19 00:00:00',2,1,0),(99,'2015-12-26 00:00:00',2,1,0),(100,'2016-01-02 00:00:00',2,1,0),(101,'2016-01-09 00:00:00',2,1,0),(102,'2016-01-16 00:00:00',2,1,0),(103,'2016-01-23 00:00:00',2,1,0),(104,'2016-01-30 00:00:00',2,1,0),(105,'2016-02-06 00:00:00',2,1,0),(106,'2016-02-13 00:00:00',2,1,0),(107,'2016-02-20 00:00:00',2,1,0),(108,'2016-02-27 00:00:00',2,1,0),(109,'2016-03-05 00:00:00',2,1,0),(110,'2016-03-12 00:00:00',2,1,0),(111,'2016-03-19 00:00:00',2,1,0),(112,'2016-03-26 00:00:00',2,1,0),(113,'2016-04-02 00:00:00',2,1,0),(114,'2016-04-09 00:00:00',2,1,0),(115,'2016-04-16 00:00:00',2,1,0),(116,'2016-04-23 00:00:00',2,1,0),(117,'2016-04-30 00:00:00',2,1,0),(118,'2016-05-07 00:00:00',2,1,0),(119,'2016-05-14 00:00:00',2,1,0),(120,'2016-05-21 00:00:00',2,1,0),(121,'2016-05-28 00:00:00',2,1,0),(122,'2016-06-04 00:00:00',2,1,0),(123,'2016-06-11 00:00:00',2,1,0),(124,'2016-06-18 00:00:00',2,1,0),(125,'2016-06-25 00:00:00',2,1,0),(126,'2016-07-02 00:00:00',2,1,0),(127,'2016-07-09 00:00:00',2,1,0),(128,'2016-07-16 00:00:00',2,1,0),(129,'2016-07-23 00:00:00',2,1,0),(130,'2016-07-30 00:00:00',2,1,0),(131,'2016-08-06 00:00:00',2,1,0),(132,'2016-08-13 00:00:00',2,1,0),(133,'2016-08-20 00:00:00',2,1,0),(134,'2016-08-27 00:00:00',2,1,0),(135,'2016-09-03 00:00:00',2,1,0),(136,'2016-09-10 00:00:00',2,1,0),(137,'2016-09-17 00:00:00',2,1,0),(138,'2016-09-24 00:00:00',2,1,0),(139,'2016-10-01 00:00:00',2,1,0),(140,'2016-10-08 00:00:00',2,1,0),(141,'2016-10-15 00:00:00',2,1,0),(142,'2016-10-22 00:00:00',2,1,0),(143,'2016-10-29 00:00:00',2,1,0),(144,'2016-11-05 00:00:00',2,1,0),(145,'2016-11-12 00:00:00',2,1,0),(146,'2016-11-19 00:00:00',2,1,0),(147,'2016-11-26 00:00:00',2,1,0),(148,'2016-12-03 00:00:00',2,1,0),(149,'2016-12-10 00:00:00',2,1,0),(150,'2016-12-17 00:00:00',2,1,0),(151,'2016-12-24 00:00:00',2,1,0),(152,'2016-12-31 00:00:00',2,1,0),(153,'2017-01-07 00:00:00',2,1,0),(154,'2017-01-14 00:00:00',2,1,0),(155,'2017-01-21 00:00:00',2,1,0),(156,'2017-01-28 00:00:00',2,1,0),(157,'2017-02-04 00:00:00',2,1,0),(158,'2017-02-11 00:00:00',2,1,0),(159,'2017-02-18 00:00:00',2,1,0),(160,'2017-02-25 00:00:00',2,1,0),(161,'2017-03-04 00:00:00',2,1,0),(162,'2017-03-11 00:00:00',2,1,0),(163,'2017-03-18 00:00:00',2,1,0),(164,'2017-03-25 00:00:00',2,1,0),(165,'2017-04-01 00:00:00',2,1,0),(166,'2017-04-08 00:00:00',2,1,0),(167,'2017-04-15 00:00:00',2,1,0),(168,'2017-04-22 00:00:00',2,1,0),(169,'2017-04-29 00:00:00',2,1,0),(170,'2017-05-06 00:00:00',2,1,0),(171,'2017-05-13 00:00:00',2,1,0),(172,'2017-05-20 00:00:00',2,1,0),(173,'2017-05-27 00:00:00',2,1,0),(174,'2017-06-03 00:00:00',2,1,0),(175,'2017-06-10 00:00:00',2,1,0),(176,'2017-06-17 00:00:00',2,1,0),(177,'2017-06-24 00:00:00',2,1,0),(178,'2017-07-01 00:00:00',2,1,0),(179,'2017-07-08 00:00:00',2,1,0),(180,'2017-07-15 00:00:00',2,1,0),(181,'2017-07-22 00:00:00',2,1,0),(182,'2017-07-29 00:00:00',2,1,0),(183,'2017-08-05 00:00:00',2,1,0),(184,'2017-08-12 00:00:00',2,1,0),(185,'2017-08-19 00:00:00',2,1,0),(186,'2017-08-26 00:00:00',2,1,0),(187,'2017-09-02 00:00:00',2,1,0),(188,'2017-09-09 00:00:00',2,1,0),(189,'2017-09-16 00:00:00',2,1,0),(190,'2017-09-23 00:00:00',2,1,0),(191,'2017-09-30 00:00:00',2,1,0),(192,'2017-10-07 00:00:00',2,1,0),(193,'2017-10-14 00:00:00',2,1,0),(194,'2017-10-21 00:00:00',2,1,0),(195,'2017-10-28 00:00:00',2,1,0),(196,'2017-11-04 00:00:00',2,1,0),(197,'2017-11-11 00:00:00',2,1,0),(198,'2017-11-18 00:00:00',2,1,0),(199,'2017-11-25 00:00:00',2,1,0),(200,'2017-12-02 00:00:00',2,1,0),(201,'2017-12-09 00:00:00',2,1,0),(202,'2017-12-16 00:00:00',2,1,0),(203,'2017-12-23 00:00:00',2,1,0),(204,'2017-12-30 00:00:00',2,1,0),(205,'2018-01-06 00:00:00',2,1,0),(206,'2018-01-13 00:00:00',2,1,0),(207,'2018-01-20 00:00:00',2,1,0),(208,'2018-01-27 00:00:00',2,1,0),(209,'2018-02-03 00:00:00',2,1,0),(210,'2018-02-10 00:00:00',2,1,0),(211,'2018-02-17 00:00:00',2,1,0),(212,'2018-02-24 00:00:00',2,1,0),(213,'2018-03-03 00:00:00',2,1,0),(214,'2018-03-10 00:00:00',2,1,0),(215,'2018-03-17 00:00:00',2,1,0),(216,'2018-03-24 00:00:00',2,1,0),(217,'2018-03-31 00:00:00',2,1,0),(218,'2018-04-07 00:00:00',2,1,0),(219,'2018-04-14 00:00:00',2,1,0),(220,'2018-04-21 00:00:00',2,1,0),(221,'2018-04-28 00:00:00',2,1,0),(222,'2018-05-05 00:00:00',2,1,0),(223,'2018-05-12 00:00:00',2,1,0),(224,'2018-05-19 00:00:00',2,1,0),(225,'2018-05-26 00:00:00',2,1,0),(226,'2018-06-02 00:00:00',2,1,0),(227,'2018-06-09 00:00:00',2,1,0),(228,'2018-06-16 00:00:00',2,1,0),(229,'2018-06-23 00:00:00',2,1,0),(230,'2018-06-30 00:00:00',2,1,0),(231,'2018-07-07 00:00:00',2,1,0),(232,'2018-07-14 00:00:00',2,1,0),(233,'2018-07-21 00:00:00',2,1,0),(234,'2018-07-28 00:00:00',2,1,0),(235,'2018-08-04 00:00:00',2,1,0),(236,'2018-08-11 00:00:00',2,1,0),(237,'2018-08-18 00:00:00',2,1,0),(238,'2018-08-25 00:00:00',2,1,0),(239,'2018-09-01 00:00:00',2,1,0),(240,'2018-09-08 00:00:00',2,1,0),(241,'2018-09-15 00:00:00',2,1,0),(242,'2018-09-22 00:00:00',2,1,0),(243,'2018-09-29 00:00:00',2,1,0),(244,'2018-10-06 00:00:00',2,1,0),(245,'2018-10-13 00:00:00',2,1,0),(246,'2018-10-20 00:00:00',2,1,0),(247,'2018-10-27 00:00:00',2,1,0),(248,'2018-11-03 00:00:00',2,1,0),(249,'2018-11-10 00:00:00',2,1,0),(250,'2018-11-17 00:00:00',2,1,0),(251,'2018-11-24 00:00:00',2,1,0),(252,'2018-12-01 00:00:00',2,1,0),(253,'2018-12-08 00:00:00',2,1,0),(254,'2018-12-15 00:00:00',2,1,0),(255,'2018-12-22 00:00:00',2,1,0),(256,'2018-12-29 00:00:00',2,1,0),(257,'2019-01-05 00:00:00',2,1,0),(258,'2019-01-12 00:00:00',2,1,0),(259,'2019-01-19 00:00:00',2,1,0),(260,'2019-01-26 00:00:00',2,1,0),(261,'2019-02-02 00:00:00',2,1,0),(262,'2019-02-09 00:00:00',2,1,0),(263,'2019-02-16 00:00:00',2,1,0),(264,'2019-02-23 00:00:00',2,1,0),(265,'2019-03-02 00:00:00',2,1,0),(266,'2019-03-09 00:00:00',2,1,0),(267,'2019-03-16 00:00:00',2,1,0),(268,'2019-03-23 00:00:00',2,1,0),(269,'2019-03-30 00:00:00',2,1,0),(270,'2019-04-06 00:00:00',2,1,0),(271,'2019-04-13 00:00:00',2,1,0),(272,'2019-04-20 00:00:00',2,1,0),(273,'2019-04-27 00:00:00',2,1,0),(274,'2019-05-04 00:00:00',2,1,0),(275,'2019-05-11 00:00:00',2,1,0),(276,'2019-05-18 00:00:00',2,1,0),(277,'2019-05-25 00:00:00',2,1,0),(278,'2019-06-01 00:00:00',2,1,0),(279,'2019-06-08 00:00:00',2,1,0),(280,'2019-06-15 00:00:00',2,1,0),(281,'2019-06-22 00:00:00',2,1,0),(282,'2019-06-29 00:00:00',2,1,0),(283,'2019-07-06 00:00:00',2,1,0),(284,'2019-07-13 00:00:00',2,1,0),(285,'2019-07-20 00:00:00',2,1,0),(286,'2019-07-27 00:00:00',2,1,0),(287,'2019-08-03 00:00:00',2,1,0),(288,'2015-02-14 00:00:00',5,1,0),(289,'2015-02-21 00:00:00',5,1,0),(290,'2015-02-28 00:00:00',5,1,0),(291,'2015-03-07 00:00:00',5,1,0),(292,'2015-03-14 00:00:00',5,1,0),(293,'2015-03-21 00:00:00',5,1,0),(294,'2015-03-28 00:00:00',5,1,0),(295,'2015-04-04 00:00:00',5,1,0),(296,'2015-04-11 00:00:00',5,1,0),(297,'2015-04-18 00:00:00',5,1,0),(298,'2015-04-25 00:00:00',5,1,0),(299,'2015-05-02 00:00:00',5,1,0),(300,'2015-05-09 00:00:00',5,1,0),(301,'2015-05-16 00:00:00',5,1,0),(302,'2015-05-23 00:00:00',5,1,0),(303,'2015-05-30 00:00:00',5,1,0),(304,'2015-06-06 00:00:00',5,1,0),(305,'2015-06-13 00:00:00',5,1,0),(306,'2015-06-20 00:00:00',5,1,0),(307,'2015-06-27 00:00:00',5,1,0),(308,'2015-07-04 00:00:00',5,1,0),(309,'2015-07-11 00:00:00',5,1,0),(310,'2015-07-18 00:00:00',5,1,0),(311,'2015-07-25 00:00:00',5,1,0),(312,'2015-08-01 00:00:00',5,1,0),(313,'2015-08-08 00:00:00',5,1,0),(314,'2015-08-15 00:00:00',5,1,0),(315,'2015-08-22 00:00:00',5,1,0),(316,'2015-08-29 00:00:00',5,1,0),(317,'2015-09-05 00:00:00',5,1,0),(318,'2015-09-12 00:00:00',5,1,0),(319,'2015-09-19 00:00:00',5,1,0),(320,'2015-09-26 00:00:00',5,1,0),(321,'2015-10-03 00:00:00',5,1,0),(322,'2015-10-10 00:00:00',5,1,0),(323,'2015-10-17 00:00:00',5,1,0),(324,'2015-10-24 00:00:00',5,1,0),(325,'2015-10-31 00:00:00',5,1,0),(326,'2015-11-07 00:00:00',5,1,0),(327,'2015-11-14 00:00:00',5,1,0),(328,'2015-11-21 00:00:00',5,1,0),(329,'2015-11-28 00:00:00',5,1,0),(330,'2015-12-05 00:00:00',5,1,0),(331,'2015-12-12 00:00:00',5,1,0),(332,'2015-12-19 00:00:00',5,1,0),(333,'2015-12-26 00:00:00',5,1,0),(334,'2016-01-02 00:00:00',5,1,0),(335,'2016-01-09 00:00:00',5,1,0),(336,'2016-01-16 00:00:00',5,1,0),(337,'2016-01-23 00:00:00',5,1,0),(338,'2016-01-30 00:00:00',5,1,0),(339,'2016-02-06 00:00:00',5,1,0),(340,'2016-02-13 00:00:00',5,1,0),(341,'2016-02-20 00:00:00',5,1,0),(342,'2016-02-27 00:00:00',5,1,0),(343,'2016-03-05 00:00:00',5,1,0),(344,'2016-03-12 00:00:00',5,1,0),(345,'2016-03-19 00:00:00',5,1,0),(346,'2016-03-26 00:00:00',5,1,0),(347,'2016-04-02 00:00:00',5,1,0),(348,'2016-04-09 00:00:00',5,1,0),(349,'2016-04-16 00:00:00',5,1,0),(350,'2016-04-23 00:00:00',5,1,0),(351,'2016-04-30 00:00:00',5,1,0),(352,'2016-05-07 00:00:00',5,1,0),(353,'2016-05-14 00:00:00',5,1,0),(354,'2016-05-21 00:00:00',5,1,0),(355,'2016-05-28 00:00:00',5,1,0),(356,'2016-06-04 00:00:00',5,1,0),(357,'2016-06-11 00:00:00',5,1,0),(358,'2016-06-18 00:00:00',5,1,0),(359,'2016-06-25 00:00:00',5,1,0),(360,'2016-07-02 00:00:00',5,1,0),(361,'2016-07-09 00:00:00',5,1,0),(362,'2016-07-16 00:00:00',5,1,0),(363,'2016-07-23 00:00:00',5,1,0),(364,'2016-07-30 00:00:00',5,1,0),(365,'2016-08-06 00:00:00',5,1,0),(366,'2016-08-13 00:00:00',5,1,0),(367,'2016-08-20 00:00:00',5,1,0),(368,'2016-08-27 00:00:00',5,1,0),(369,'2016-09-03 00:00:00',5,1,0),(370,'2016-09-10 00:00:00',5,1,0),(371,'2016-09-17 00:00:00',5,1,0),(372,'2016-09-24 00:00:00',5,1,0),(373,'2016-10-01 00:00:00',5,1,0),(374,'2016-10-08 00:00:00',5,1,0),(375,'2016-10-15 00:00:00',5,1,0),(376,'2016-10-22 00:00:00',5,1,0),(377,'2016-10-29 00:00:00',5,1,0),(378,'2016-11-05 00:00:00',5,1,0),(379,'2016-11-12 00:00:00',5,1,0),(380,'2016-11-19 00:00:00',5,1,0),(381,'2016-11-26 00:00:00',5,1,0),(382,'2016-12-03 00:00:00',5,1,0),(383,'2016-12-10 00:00:00',5,1,0),(384,'2016-12-17 00:00:00',5,1,0),(385,'2016-12-24 00:00:00',5,1,0),(386,'2016-12-31 00:00:00',5,1,0),(387,'2017-01-07 00:00:00',5,1,0),(388,'2017-01-14 00:00:00',5,1,0),(389,'2017-01-21 00:00:00',5,1,0),(390,'2017-01-28 00:00:00',5,1,0),(391,'2017-02-04 00:00:00',5,1,0),(392,'2017-02-11 00:00:00',5,1,0),(393,'2017-02-18 00:00:00',5,1,0),(394,'2017-02-25 00:00:00',5,1,0),(395,'2017-03-04 00:00:00',5,1,0),(396,'2017-03-11 00:00:00',5,1,0),(397,'2017-03-18 00:00:00',5,1,0),(398,'2017-03-25 00:00:00',5,1,0),(399,'2017-04-01 00:00:00',5,1,0),(400,'2017-04-08 00:00:00',5,1,0),(401,'2017-04-15 00:00:00',5,1,0),(402,'2017-04-22 00:00:00',5,1,0),(403,'2017-04-29 00:00:00',5,1,0),(404,'2017-05-06 00:00:00',5,1,0),(405,'2017-05-13 00:00:00',5,1,0),(406,'2017-05-20 00:00:00',5,1,0),(407,'2017-05-27 00:00:00',5,1,0),(408,'2017-06-03 00:00:00',5,1,0),(409,'2017-06-10 00:00:00',5,1,0),(410,'2017-06-17 00:00:00',5,1,0),(411,'2017-06-24 00:00:00',5,1,0),(412,'2017-07-01 00:00:00',5,1,0),(413,'2017-07-08 00:00:00',5,1,0),(414,'2017-07-15 00:00:00',5,1,0),(415,'2017-07-22 00:00:00',5,1,0),(416,'2017-07-29 00:00:00',5,1,0),(417,'2017-08-05 00:00:00',5,1,0),(418,'2017-08-12 00:00:00',5,1,0),(419,'2017-08-19 00:00:00',5,1,0),(420,'2017-08-26 00:00:00',5,1,0),(421,'2017-09-02 00:00:00',5,1,0),(422,'2017-09-09 00:00:00',5,1,0),(423,'2017-09-16 00:00:00',5,1,0),(424,'2017-09-23 00:00:00',5,1,0),(425,'2017-09-30 00:00:00',5,1,0),(426,'2017-10-07 00:00:00',5,1,0),(427,'2017-10-14 00:00:00',5,1,0),(428,'2017-10-21 00:00:00',5,1,0),(429,'2017-10-28 00:00:00',5,1,0),(430,'2017-11-04 00:00:00',5,1,0),(431,'2017-11-11 00:00:00',5,1,0),(432,'2017-11-18 00:00:00',5,1,0),(433,'2017-11-25 00:00:00',5,1,0),(434,'2017-12-02 00:00:00',5,1,0),(435,'2017-12-09 00:00:00',5,1,0),(436,'2017-12-16 00:00:00',5,1,0),(437,'2017-12-23 00:00:00',5,1,0),(438,'2017-12-30 00:00:00',5,1,0),(439,'2018-01-06 00:00:00',5,1,0),(440,'2018-01-13 00:00:00',5,1,0),(441,'2018-01-20 00:00:00',5,1,0),(442,'2018-01-27 00:00:00',5,1,0),(443,'2018-02-03 00:00:00',5,1,0),(444,'2018-02-10 00:00:00',5,1,0),(445,'2018-02-17 00:00:00',5,1,0),(446,'2018-02-24 00:00:00',5,1,0),(447,'2018-03-03 00:00:00',5,1,0),(448,'2018-03-10 00:00:00',5,1,0),(449,'2018-03-17 00:00:00',5,1,0),(450,'2018-03-24 00:00:00',5,1,0),(451,'2018-03-31 00:00:00',5,1,0),(452,'2018-04-07 00:00:00',5,1,0),(453,'2018-04-14 00:00:00',5,1,0),(454,'2018-04-21 00:00:00',5,1,0),(455,'2018-04-28 00:00:00',5,1,0),(456,'2018-05-05 00:00:00',5,1,0),(457,'2018-05-12 00:00:00',5,1,0),(458,'2018-05-19 00:00:00',5,1,0),(459,'2018-05-26 00:00:00',5,1,0),(460,'2018-06-02 00:00:00',5,1,0),(461,'2018-06-09 00:00:00',5,1,0),(462,'2018-06-16 00:00:00',5,1,0),(463,'2018-06-23 00:00:00',5,1,0),(464,'2018-06-30 00:00:00',5,1,0),(465,'2018-07-07 00:00:00',5,1,0),(466,'2018-07-14 00:00:00',5,1,0),(467,'2018-07-21 00:00:00',5,1,0),(468,'2018-07-28 00:00:00',5,1,0),(469,'2018-08-04 00:00:00',5,1,0),(470,'2009-02-10 00:00:00',6,1,0),(471,'2005-01-10 00:00:00',7,1,0),(472,'2005-01-17 00:00:00',7,1,0),(473,'2005-01-24 00:00:00',7,1,0),(474,'2005-01-31 00:00:00',7,1,0),(475,'2005-02-07 00:00:00',7,1,0),(476,'2005-02-14 00:00:00',7,1,0),(477,'2005-02-21 00:00:00',7,1,0),(478,'2005-02-28 00:00:00',7,1,0),(479,'2005-03-07 00:00:00',7,1,0),(480,'2005-03-14 00:00:00',7,1,0),(481,'2005-03-21 00:00:00',7,1,0),(482,'2005-03-28 00:00:00',7,1,0),(483,'2005-04-04 00:00:00',7,1,0),(484,'2005-04-11 00:00:00',7,1,0),(485,'2005-04-18 00:00:00',7,1,0),(486,'2005-04-25 00:00:00',7,1,0),(487,'2005-05-02 00:00:00',7,1,0),(488,'2005-05-09 00:00:00',7,1,0),(489,'2005-05-16 00:00:00',7,1,0),(490,'2005-05-23 00:00:00',7,1,0),(491,'2005-05-30 00:00:00',7,1,0),(492,'2005-06-06 00:00:00',7,1,0),(493,'2005-06-13 00:00:00',7,1,0),(494,'2005-06-20 00:00:00',7,1,0),(495,'2005-06-27 00:00:00',7,1,0),(496,'2005-07-04 00:00:00',7,1,0),(497,'2005-07-11 00:00:00',7,1,0),(498,'2005-07-18 00:00:00',7,1,0),(499,'2005-07-25 00:00:00',7,1,0),(500,'2005-08-01 00:00:00',7,1,0),(501,'2005-08-08 00:00:00',7,1,0),(502,'2005-08-15 00:00:00',7,1,0),(503,'2005-08-22 00:00:00',7,1,0),(504,'2005-08-29 00:00:00',7,1,0),(505,'2005-09-05 00:00:00',7,1,0),(506,'2005-09-12 00:00:00',7,1,0),(507,'2005-09-19 00:00:00',7,1,0),(508,'2005-09-26 00:00:00',7,1,0),(509,'2005-10-03 00:00:00',7,1,0),(510,'2005-10-10 00:00:00',7,1,0),(511,'2005-10-17 00:00:00',7,1,0),(512,'2005-10-24 00:00:00',7,1,0),(513,'2005-10-31 00:00:00',7,1,0),(514,'2005-11-07 00:00:00',7,1,0),(515,'2005-11-14 00:00:00',7,1,0),(516,'2005-11-21 00:00:00',7,1,0),(517,'2005-11-28 00:00:00',7,1,0),(518,'2005-12-05 00:00:00',7,1,0),(519,'2005-12-12 00:00:00',7,1,0),(520,'2005-12-19 00:00:00',7,1,0),(521,'2005-12-26 00:00:00',7,1,0),(522,'2006-01-02 00:00:00',7,1,0),(523,'2006-01-09 00:00:00',7,1,0),(524,'2006-01-16 00:00:00',7,1,0),(525,'2006-01-23 00:00:00',7,1,0),(526,'2006-01-30 00:00:00',7,1,0),(527,'2006-02-06 00:00:00',7,1,0),(528,'2006-02-13 00:00:00',7,1,0),(529,'2006-02-20 00:00:00',7,1,0),(530,'2006-02-27 00:00:00',7,1,0),(531,'2006-03-06 00:00:00',7,1,0),(532,'2006-03-13 00:00:00',7,1,0),(533,'2006-03-20 00:00:00',7,1,0),(534,'2006-03-27 00:00:00',7,1,0),(535,'2006-04-03 00:00:00',7,1,0),(536,'2006-04-10 00:00:00',7,1,0),(537,'2006-04-17 00:00:00',7,1,0),(538,'2006-04-24 00:00:00',7,1,0),(539,'2006-05-01 00:00:00',7,1,0),(540,'2006-05-08 00:00:00',7,1,0),(541,'2006-05-15 00:00:00',7,1,0),(542,'2006-05-22 00:00:00',7,1,0),(543,'2006-05-29 00:00:00',7,1,0),(544,'2006-06-05 00:00:00',7,1,0),(545,'2006-06-12 00:00:00',7,1,0),(546,'2006-06-19 00:00:00',7,1,0),(547,'2006-06-26 00:00:00',7,1,0),(548,'2006-07-03 00:00:00',7,1,0),(549,'2006-07-10 00:00:00',7,1,0),(550,'2006-07-17 00:00:00',7,1,0),(551,'2006-07-24 00:00:00',7,1,0),(552,'2006-07-31 00:00:00',7,1,0),(553,'2006-08-07 00:00:00',7,1,0),(554,'2006-08-14 00:00:00',7,1,0),(555,'2006-08-21 00:00:00',7,1,0),(556,'2006-08-28 00:00:00',7,1,0),(557,'2006-09-04 00:00:00',7,1,0),(558,'2006-09-11 00:00:00',7,1,0),(559,'2006-09-18 00:00:00',7,1,0),(560,'2006-09-25 00:00:00',7,1,0),(561,'2006-10-02 00:00:00',7,1,0),(562,'2006-10-09 00:00:00',7,1,0),(563,'2006-10-16 00:00:00',7,1,0),(564,'2006-10-23 00:00:00',7,1,0),(565,'2006-10-30 00:00:00',7,1,0),(566,'2006-11-06 00:00:00',7,1,0),(567,'2006-11-13 00:00:00',7,1,0),(568,'2006-11-20 00:00:00',7,1,0),(569,'2006-11-27 00:00:00',7,1,0),(570,'2006-12-04 00:00:00',7,1,0),(571,'2006-12-11 00:00:00',7,1,0),(572,'2006-12-18 00:00:00',7,1,0),(573,'2006-12-25 00:00:00',7,1,0),(574,'2007-01-01 00:00:00',7,1,0),(575,'2007-01-08 00:00:00',7,1,0),(576,'2007-01-15 00:00:00',7,1,0),(577,'2007-01-22 00:00:00',7,1,0),(578,'2007-01-29 00:00:00',7,1,0),(579,'2007-02-05 00:00:00',7,1,0),(580,'2007-02-12 00:00:00',7,1,0),(581,'2007-02-19 00:00:00',7,1,0);
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
  KEY `manager_id` (`manager_id`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Engineer',1,NULL,1),(2,'Jnr Engineer',1,1,1),(3,'Project Controls Manager',1,NULL,1),(4,'Planner',1,3,1);
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
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'C1','Section C1',1,1),(2,'C2','Section C2',1,1),(3,'C3','Section C3',1,1);
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
INSERT INTO `user_project` VALUES (1,1,1),(2,1,1),(6,1,1);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Hassan','Emam','hassan@hotmail.com','hassan','$2a$12$DqLE1urFhbIsyfvLuNjtWu.tzaohp7a0pKccgCsrgqw0ShzHRfCeO',1,1);
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
  `mon` tinyint(1) DEFAULT NULL,
  `tue` tinyint(1) DEFAULT NULL,
  `wed` tinyint(1) DEFAULT NULL,
  `thu` tinyint(1) DEFAULT NULL,
  `fri` tinyint(1) DEFAULT NULL,
  `sat` tinyint(1) DEFAULT NULL,
  `sun` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`wwp_id`,`task_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `wwp_details_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `lookaheads_details` (`id`),
  CONSTRAINT `wwp_details_ibfk_2` FOREIGN KEY (`wwp_id`) REFERENCES `wwps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wwp_details`
--

LOCK TABLES `wwp_details` WRITE;
/*!40000 ALTER TABLE `wwp_details` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wwps`
--

LOCK TABLES `wwps` WRITE;
/*!40000 ALTER TABLE `wwps` DISABLE KEYS */;
INSERT INTO `wwps` VALUES (1,1,1,1,NULL,1,0),(8,1,2,1,NULL,1,0),(9,1,3,1,NULL,1,0),(11,1,4,1,NULL,1,0);
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

-- Dump completed on 2017-04-17 18:42:31
