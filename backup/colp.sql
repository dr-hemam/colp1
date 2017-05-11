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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraintanalysis`
--

LOCK TABLES `constraintanalysis` WRITE;
/*!40000 ALTER TABLE `constraintanalysis` DISABLE KEYS */;
INSERT INTO `constraintanalysis` VALUES (1,1,1,1,1,NULL);
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
INSERT INTO `constraintanalysis_details` VALUES (1,1,1,1,1,1),(1,1,2,1,1,1),(1,1,3,1,1,1),(1,1,4,1,1,1),(1,1,5,1,1,1),(1,1,6,1,1,1),(1,1,7,1,1,1),(1,1,8,1,1,1),(1,1,9,1,1,1),(1,1,10,1,1,1),(1,1,11,1,1,1),(1,2,1,1,1,1),(1,2,2,1,1,1),(1,2,3,1,1,1),(1,2,4,1,1,1),(1,2,5,1,1,1),(1,2,6,1,1,1),(1,2,7,1,1,1),(1,2,8,1,1,1),(1,2,9,1,1,1),(1,2,10,1,1,1),(1,2,11,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraints`
--

LOCK TABLES `constraints` WRITE;
/*!40000 ALTER TABLE `constraints` DISABLE KEYS */;
INSERT INTO `constraints` VALUES (1,'Consents',1,1),(2,'Community Engagement',1,1),(3,'Contract',1,1),(4,'Compensation Event',1,1),(5,'Design',1,1),(6,'Land Access',1,1),(7,'Method Statement',1,1),(8,'Resource',1,1),(9,'Equipment',1,1),(10,'Space',1,1),(11,'Prerequisite work',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookaheads`
--

LOCK TABLES `lookaheads` WRITE;
/*!40000 ALTER TABLE `lookaheads` DISABLE KEYS */;
INSERT INTO `lookaheads` VALUES (1,1,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookaheads_details`
--

LOCK TABLES `lookaheads_details` WRITE;
/*!40000 ALTER TABLE `lookaheads_details` DISABLE KEYS */;
INSERT INTO `lookaheads_details` VALUES (1,1,'Task C1-10','Task C1-10','2016-11-17 00:00:00','2016-11-20 00:00:00',1),(2,1,'Task C1-20','Task C1-20','2016-11-18 00:00:00','2016-11-21 00:00:00',1);
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
INSERT INTO `organisations` VALUES (1,'FUS','Fusion','Fusion is a joint venture between Morgan Sindal, BAM Nutall and Ferrovial',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'1EW03','Central Enabling Works Contract',1,'Enabling works for HS2\'s central section','2016-11-17 00:00:00','2017-11-16 00:00:00',1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportingcycles`
--

LOCK TABLES `reportingcycles` WRITE;
/*!40000 ALTER TABLE `reportingcycles` DISABLE KEYS */;
INSERT INTO `reportingcycles` VALUES (1,'Weekly','Weekly','week',1,'0',NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportingdates`
--

LOCK TABLES `reportingdates` WRITE;
/*!40000 ALTER TABLE `reportingdates` DISABLE KEYS */;
INSERT INTO `reportingdates` VALUES (1,'2016-11-17 00:00:00',1,1,0),(2,'2016-11-24 00:00:00',1,1,0),(3,'2016-12-01 00:00:00',1,1,0),(4,'2016-12-08 00:00:00',1,1,0),(5,'2016-12-15 00:00:00',1,1,0),(6,'2016-12-22 00:00:00',1,1,0),(7,'2016-12-29 00:00:00',1,1,0),(8,'2017-01-05 00:00:00',1,1,0),(9,'2017-01-12 00:00:00',1,1,0),(10,'2017-01-19 00:00:00',1,1,0),(11,'2017-01-26 00:00:00',1,1,0),(12,'2017-02-02 00:00:00',1,1,0),(13,'2017-02-09 00:00:00',1,1,0),(14,'2017-02-16 00:00:00',1,1,0),(15,'2017-02-23 00:00:00',1,1,0),(16,'2017-03-02 00:00:00',1,1,0),(17,'2017-03-09 00:00:00',1,1,0),(18,'2017-03-16 00:00:00',1,1,0),(19,'2017-03-23 00:00:00',1,1,0),(20,'2017-03-30 00:00:00',1,1,0),(21,'2017-04-06 00:00:00',1,1,0),(22,'2017-04-13 00:00:00',1,1,0),(23,'2017-04-20 00:00:00',1,1,0),(24,'2017-04-27 00:00:00',1,1,0),(25,'2017-05-04 00:00:00',1,1,0),(26,'2017-05-11 00:00:00',1,1,0),(27,'2017-05-18 00:00:00',1,1,0),(28,'2017-05-25 00:00:00',1,1,0),(29,'2017-06-01 00:00:00',1,1,0),(30,'2017-06-08 00:00:00',1,1,0),(31,'2017-06-15 00:00:00',1,1,0),(32,'2017-06-22 00:00:00',1,1,0),(33,'2017-06-29 00:00:00',1,1,0),(34,'2017-07-06 00:00:00',1,1,0),(35,'2017-07-13 00:00:00',1,1,0),(36,'2017-07-20 00:00:00',1,1,0),(37,'2017-07-27 00:00:00',1,1,0),(38,'2017-08-03 00:00:00',1,1,0),(39,'2017-08-10 00:00:00',1,1,0),(40,'2017-08-17 00:00:00',1,1,0),(41,'2017-08-24 00:00:00',1,1,0),(42,'2017-08-31 00:00:00',1,1,0),(43,'2017-09-07 00:00:00',1,1,0),(44,'2017-09-14 00:00:00',1,1,0),(45,'2017-09-21 00:00:00',1,1,0),(46,'2017-09-28 00:00:00',1,1,0),(47,'2017-10-05 00:00:00',1,1,0),(48,'2017-10-12 00:00:00',1,1,0),(49,'2017-10-19 00:00:00',1,1,0),(50,'2017-10-26 00:00:00',1,1,0),(51,'2017-11-02 00:00:00',1,1,0),(52,'2017-11-09 00:00:00',1,1,0),(53,'2017-11-16 00:00:00',1,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Project Manager',1,NULL,1);
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
INSERT INTO `user_project` VALUES (1,1,1);
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
INSERT INTO `users` VALUES (1,'Hassan','Emam','hassan.emam@hotmail.com','hassan','$2a$12$UfqXLs0gHouGmyq/rMDAPOGfJQN5QECR.QmbhHi1FIFpcTkV5CgrK',1,1);
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
INSERT INTO `wwp_details` VALUES (1,1,1,1,1,1,0,0,0,0,1,1,1,NULL),(1,2,1,0,0,1,1,1,0,0,1,1,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wwps`
--

LOCK TABLES `wwps` WRITE;
/*!40000 ALTER TABLE `wwps` DISABLE KEYS */;
INSERT INTO `wwps` VALUES (1,1,1,1,1,1,1);
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

-- Dump completed on 2017-05-11  7:44:23
