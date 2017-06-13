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
INSERT INTO `alembic_version` VALUES ('fe4855cc93a7');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraintanalysis`
--

LOCK TABLES `constraintanalysis` WRITE;
/*!40000 ALTER TABLE `constraintanalysis` DISABLE KEYS */;
INSERT INTO `constraintanalysis` VALUES (1,1,1,1,1,NULL),(2,3,212,4,1,NULL),(3,3,213,4,1,NULL),(4,3,214,4,1,NULL),(5,3,215,4,0,NULL),(6,9,847,13,1,NULL);
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`constraintanalysis_id`,`task_id`,`constraint_id`),
  UNIQUE KEY `uix_cad` (`constraintanalysis_id`,`task_id`,`constraint_id`),
  UNIQUE KEY `id` (`id`),
  KEY `task_id` (`task_id`),
  KEY `constraint_id` (`constraint_id`),
  CONSTRAINT `constraintanalysis_details_ibfk_1` FOREIGN KEY (`constraintanalysis_id`) REFERENCES `constraintanalysis` (`id`),
  CONSTRAINT `constraintanalysis_details_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `lookaheads_details` (`id`),
  CONSTRAINT `constraintanalysis_details_ibfk_3` FOREIGN KEY (`constraint_id`) REFERENCES `constraints` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraintanalysis_details`
--

LOCK TABLES `constraintanalysis_details` WRITE;
/*!40000 ALTER TABLE `constraintanalysis_details` DISABLE KEYS */;
INSERT INTO `constraintanalysis_details` VALUES (1,1,17,1,1,1,1),(2,10,18,1,1,1,2),(2,10,19,1,1,1,3),(2,10,20,0,1,1,4),(2,10,21,0,1,1,5),(2,10,22,0,1,1,6),(3,18,18,1,1,1,7),(3,18,19,1,1,1,8),(3,18,20,1,1,1,9),(3,18,21,1,1,1,10),(3,18,22,1,1,1,11),(3,19,18,1,1,1,12),(3,19,19,1,1,1,13),(3,19,20,1,1,1,14),(3,19,21,1,1,1,15),(3,19,22,1,1,1,16),(4,20,18,1,1,1,22),(4,20,19,1,1,1,23),(4,20,20,1,1,1,24),(4,20,21,0,1,1,25),(4,20,22,0,1,1,26),(4,21,18,1,1,1,17),(4,21,19,1,1,1,18),(4,21,20,1,1,1,19),(4,21,21,1,1,1,20),(4,21,22,1,1,1,21);
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
  `is_active` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_cnst1` (`name`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `constraints_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constraints`
--

LOCK TABLES `constraints` WRITE;
/*!40000 ALTER TABLE `constraints` DISABLE KEYS */;
INSERT INTO `constraints` VALUES (1,'Consents',1,NULL),(2,'Community Engagement',1,NULL),(3,'Contract',1,NULL),(4,'Compensation Event',1,NULL),(5,'Design',1,NULL),(6,'Land Access',1,NULL),(7,'Method Statement',1,NULL),(8,'Resource',1,NULL),(9,'Equipment',1,NULL),(10,'Space',1,NULL),(11,'Prerequisite work',1,NULL),(12,'Other',1,NULL),(13,'Method Statement',1,NULL),(14,'TCC',1,NULL),(15,'PAC',1,NULL),(16,'Enerigiazing',1,NULL),(17,'Design Change',1,1),(18,'Design',1,3),(19,'Method Statement',1,3),(20,'Preceding activities',1,3),(21,'Labourer Availability',1,3),(22,'Material Availability',1,3),(23,'Complete Intermediate East',1,9);
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
  `is_active` tinyint(1) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uix_dr1` (`name`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `delay_reasons_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delay_reasons`
--

LOCK TABLES `delay_reasons` WRITE;
/*!40000 ALTER TABLE `delay_reasons` DISABLE KEYS */;
INSERT INTO `delay_reasons` VALUES (1,'Change in priority instructed by Client or PM',1,1),(2,'Defects requiring rework',1,1),(3,'Interface with other packages',1,1),(4,'Lack of human resource',1,1),(5,'Late materials',1,1),(6,'Defective materials',1,1),(7,'Late information',1,1),(8,'Incomplete information',1,1),(9,'Make ready items not in place',1,1),(10,'Outside influence',1,1),(11,'Over/under estimation of what could be achieved',1,1),(12,'Prerequisite activity not recognised be responsible party',1,1),(13,'Weather',1,1),(14,'Other',1,1),(15,'Design Change',0,1),(16,'Late Design Approval',1,3),(17,'Weather',1,9),(18,'Design / Technical',1,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookaheads`
--

LOCK TABLES `lookaheads` WRITE;
/*!40000 ALTER TABLE `lookaheads` DISABLE KEYS */;
INSERT INTO `lookaheads` VALUES (1,1,1,1,1),(2,1,1,2,1),(3,1,2,1,1),(4,1,3,1,1),(5,3,212,4,1),(6,1,4,1,1),(7,5,397,5,1),(8,6,555,9,1),(9,3,213,4,1),(10,3,214,4,1),(11,9,848,13,0),(12,9,847,13,1),(15,8,819,15,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookaheads_details`
--

LOCK TABLES `lookaheads_details` WRITE;
/*!40000 ALTER TABLE `lookaheads_details` DISABLE KEYS */;
INSERT INTO `lookaheads_details` VALUES (1,1,'Task C1-10','Task C1-10','2016-11-17 00:00:00','2016-11-20 00:00:00',1),(2,1,'Task C1-20','Task C1-20','2016-11-18 00:00:00','2016-11-21 00:00:00',1),(3,2,'Task C2-10','Task C2-10','2016-11-17 00:00:00','2016-11-18 00:00:00',1),(4,2,'Task C2-20','Task C2-20','2016-11-18 00:00:00','2016-11-20 00:00:00',1),(5,3,'Task 24-1','Task 24-1','2016-11-25 00:00:00','2016-11-26 00:00:00',1),(6,3,'Task 24-2','Task 24-2','2016-11-26 00:00:00','2016-11-28 00:00:00',1),(7,4,'Task 1-12-1','Task 1-12-1','2017-12-01 00:00:00','2017-12-03 00:00:00',1),(8,4,'Task 1-12-2','Task 1-12-2','2017-12-01 00:00:00','2017-12-03 00:00:00',1),(9,4,'Task 1-12-3','Task 1-12-3','2017-12-02 00:00:00','2017-12-03 00:00:00',1),(10,5,'10-a','Task 10','2017-06-01 00:00:00','2017-06-10 00:00:00',1),(11,5,'20','Task 20','2017-06-04 00:00:00','2017-06-08 00:00:00',1),(12,6,'myTask','myTasks','2017-06-07 00:00:00','2017-06-10 00:00:00',1),(13,7,'WK_01','Week 1','2014-09-14 00:00:00','2014-09-21 00:00:00',1),(14,7,'','','2014-09-14 00:00:00','2014-09-21 00:00:00',1),(15,8,'AsssAa','','2015-06-09 00:00:00','2017-06-09 00:00:00',1),(16,8,'','','2015-06-09 00:00:00','2017-06-09 00:00:00',1),(17,5,'20-5','Task 20-5','2017-06-04 00:00:00','2017-06-08 00:00:00',1),(18,9,'tt2023t','Excavation','2017-06-15 00:00:00','2017-06-18 00:00:00',1),(19,9,'tt2024t','blinding','2017-06-17 00:00:00','2017-06-19 00:00:00',1),(20,10,'khvki4g31','waterproof','2017-06-15 00:00:00','2017-06-18 00:00:00',1),(21,10,'khbjvjkhv32','protection screed','2017-06-17 00:00:00','2017-06-19 00:00:00',1),(22,11,'1234','Test1','2017-06-24 00:00:00','2017-06-26 00:00:00',0),(23,11,'3134','Test 2','2017-06-29 00:00:00','0000-00-00 00:00:00',0),(26,12,'test','test2','0000-00-00 00:00:00','0000-00-00 00:00:00',1),(27,12,'','','0000-00-00 00:00:00','0000-00-00 00:00:00',1);
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
  UNIQUE KEY `uix_org1` (`code`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisations`
--

LOCK TABLES `organisations` WRITE;
/*!40000 ALTER TABLE `organisations` DISABLE KEYS */;
INSERT INTO `organisations` VALUES (1,'FUS','Fusion','Fusion is a joint venture between Morgan Sindal, BAM Nutall and Ferrovial',1),(3,'hochtief','HOCHTIEF','HOCHTIEF - construction, civil engineering and building. HOCHTIEF is one of the World\'s leading construction groups.',1),(4,'PES','PES.','PES Company',1),(5,'CONO','ConOccult Management','ConOccult Sample Organisation for Training',1),(6,'BSUni','Ball State University','Ball State University',1),(7,'AAL','Abdelaal Est','Abdelaal Est',1),(10,'Egis','Egis Rail','Egis Rail Test Account',1),(11,'iSim','iSimar','isimsar',1),(12,'SALEH','Saleh Mubarak Consulting','Saleh Mubarak Consulting',1),(13,'SIXCO','SixConstruct','SixConstruct is a subsidiary of BESIX',1),(14,'vial ','vial y vives - dsd','vial y vives - dsd',1),(15,'Gnus','Gnus Consultants','Gnus Consultants',1),(16,'turki','Al turki','Al turki',1),(17,'CPVAW','Private User','Private User',1),(18,'Nabina','Nabina','Nabina',1),(19,'LEEDS','LEEDS','LEEDS',1),(20,'COP -MV','COP -MV','COP -MV',1),(21,'QPM','QPM','QPM',1),(22,'Zamil','Zamil Group','Zamil Group',1),(23,'Manens','Manens-Tifs S.P.A','Manens-Tifs S.P.A',1),(24,'jacobs intl','Jacobs intl','jacobs intl',1),(25,'Inertia','Inertia construction','Inertia construction',1),(26,'Siemens','Siemens','Siemens',1),(27,'Archirodon','Archirodon Construction Overseas','Archirodon Construction Overseas',1),(28,'El-Seif','El-Seif','El-Seif',1),(29,'log','Logikal Projects','Logikal Projects provides high standard project controls consultancy.',1),(30,'ALYSJ','ALYSJ JV - Qatar rail','ALYSJ JV - Qatar rail',1),(31,'MSC','MSC','MSC',1),(32,'Tomlinson ','R W Tomlinson ','R W Tomlinson ',1),(33,'DARAH','Dar Al Handasah','Dar Al Handasah',1),(34,'EWN','Ewaan','Ewaan',1),(35,'AECOM','AECOM','AECOM',1),(36,'CES','Civil Engineering Solutions','Civil Engineering Solutions',1),(37,'VfEC','Value for Engineering & Construction','Value for Engineering & Construction',1);
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
  UNIQUE KEY `uix_prj1` (`code`,`org_id`),
  KEY `owner` (`owner`),
  KEY `cycle_id` (`cycle_id`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `users` (`id`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`cycle_id`) REFERENCES `reportingcycles` (`id`),
  CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`org_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'1EW03','Central Enabling Works Contract',1,'Enabling works for HS2\'s central section','2016-11-17 00:00:00','2017-11-16 00:00:00',1,1,1),(2,'MWCC','Main Works Contract N1',1,'Main civil works contract for HS2 northern section 2','2017-07-17 00:00:00','2020-07-17 00:00:00',1,1,1),(3,'SMP-1','Sample Project 1',7,'Sample project for demonstration only','2017-06-01 00:00:00','2018-05-30 00:00:00',1,5,1),(4,'AAL','Project 2',7,'Project 2','2017-06-15 00:00:00','2019-12-15 00:00:00',1,5,1),(5,'60OP-1310','Hunayan',30,'Substation','2014-09-14 00:00:00','2017-09-14 00:00:00',1,26,1),(6,'RP01','RMC',20,'Pipeline','2015-06-09 00:00:00','2019-06-08 00:00:00',1,16,1),(7,'001','Trial Project',42,'an Imaginary Project','2017-06-01 00:00:00','2018-06-01 00:00:00',1,37,1),(9,'C405','Crossrail Paddington',5,'Crossrail Paddington MEP Fitout','2017-05-27 00:00:00','2017-12-30 00:00:00',6,3,1);
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
  UNIQUE KEY `uix_rc1` (`code`,`organisation_id`),
  KEY `organisation_id` (`organisation_id`),
  CONSTRAINT `reportingcycles_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportingcycles`
--

LOCK TABLES `reportingcycles` WRITE;
/*!40000 ALTER TABLE `reportingcycles` DISABLE KEYS */;
INSERT INTO `reportingcycles` VALUES (1,'Weekly','Weekly','week',1,'0',1,1),(2,'Mnth1','Monthly','month',1,'0',1,1),(3,'conoweeklt','weekly','week',1,'0',5,1),(4,'00.WK','2016_Weekly','week',52,'5',26,1),(5,'02-monthly','Monthly Cycle','month',1,'0',5,1),(6,'Skan4W','4 Week Period','week',4,'0',3,1),(7,'PAD1W','Weekly','week',1,'0',3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=856 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportingdates`
--

LOCK TABLES `reportingdates` WRITE;
/*!40000 ALTER TABLE `reportingdates` DISABLE KEYS */;
INSERT INTO `reportingdates` VALUES (1,'2016-11-17 00:00:00',1,1,0),(2,'2016-11-24 00:00:00',1,1,0),(3,'2016-12-01 00:00:00',1,1,0),(4,'2016-12-08 00:00:00',1,1,0),(5,'2016-12-15 00:00:00',1,1,0),(6,'2016-12-22 00:00:00',1,1,0),(7,'2016-12-29 00:00:00',1,1,0),(8,'2017-01-05 00:00:00',1,1,0),(9,'2017-01-12 00:00:00',1,1,0),(10,'2017-01-19 00:00:00',1,1,0),(11,'2017-01-26 00:00:00',1,1,0),(12,'2017-02-02 00:00:00',1,1,0),(13,'2017-02-09 00:00:00',1,1,0),(14,'2017-02-16 00:00:00',1,1,0),(15,'2017-02-23 00:00:00',1,1,0),(16,'2017-03-02 00:00:00',1,1,0),(17,'2017-03-09 00:00:00',1,1,0),(18,'2017-03-16 00:00:00',1,1,0),(19,'2017-03-23 00:00:00',1,1,0),(20,'2017-03-30 00:00:00',1,1,0),(21,'2017-04-06 00:00:00',1,1,0),(22,'2017-04-13 00:00:00',1,1,0),(23,'2017-04-20 00:00:00',1,1,0),(24,'2017-04-27 00:00:00',1,1,0),(25,'2017-05-04 00:00:00',1,1,0),(26,'2017-05-11 00:00:00',1,1,0),(27,'2017-05-18 00:00:00',1,1,0),(28,'2017-05-25 00:00:00',1,1,0),(29,'2017-06-01 00:00:00',1,1,0),(30,'2017-06-08 00:00:00',1,1,0),(31,'2017-06-15 00:00:00',1,1,0),(32,'2017-06-22 00:00:00',1,1,0),(33,'2017-06-29 00:00:00',1,1,0),(34,'2017-07-06 00:00:00',1,1,0),(35,'2017-07-13 00:00:00',1,1,0),(36,'2017-07-20 00:00:00',1,1,0),(37,'2017-07-27 00:00:00',1,1,0),(38,'2017-08-03 00:00:00',1,1,0),(39,'2017-08-10 00:00:00',1,1,0),(40,'2017-08-17 00:00:00',1,1,0),(41,'2017-08-24 00:00:00',1,1,0),(42,'2017-08-31 00:00:00',1,1,0),(43,'2017-09-07 00:00:00',1,1,0),(44,'2017-09-14 00:00:00',1,1,0),(45,'2017-09-21 00:00:00',1,1,0),(46,'2017-09-28 00:00:00',1,1,0),(47,'2017-10-05 00:00:00',1,1,0),(48,'2017-10-12 00:00:00',1,1,0),(49,'2017-10-19 00:00:00',1,1,0),(50,'2017-10-26 00:00:00',1,1,0),(51,'2017-11-02 00:00:00',1,1,0),(52,'2017-11-09 00:00:00',1,1,0),(53,'2017-11-16 00:00:00',1,1,0),(54,'2017-07-17 00:00:00',2,1,0),(55,'2017-07-24 00:00:00',2,1,0),(56,'2017-07-31 00:00:00',2,1,0),(57,'2017-08-07 00:00:00',2,1,0),(58,'2017-08-14 00:00:00',2,1,0),(59,'2017-08-21 00:00:00',2,1,0),(60,'2017-08-28 00:00:00',2,1,0),(61,'2017-09-04 00:00:00',2,1,0),(62,'2017-09-11 00:00:00',2,1,0),(63,'2017-09-18 00:00:00',2,1,0),(64,'2017-09-25 00:00:00',2,1,0),(65,'2017-10-02 00:00:00',2,1,0),(66,'2017-10-09 00:00:00',2,1,0),(67,'2017-10-16 00:00:00',2,1,0),(68,'2017-10-23 00:00:00',2,1,0),(69,'2017-10-30 00:00:00',2,1,0),(70,'2017-11-06 00:00:00',2,1,0),(71,'2017-11-13 00:00:00',2,1,0),(72,'2017-11-20 00:00:00',2,1,0),(73,'2017-11-27 00:00:00',2,1,0),(74,'2017-12-04 00:00:00',2,1,0),(75,'2017-12-11 00:00:00',2,1,0),(76,'2017-12-18 00:00:00',2,1,0),(77,'2017-12-25 00:00:00',2,1,0),(78,'2018-01-01 00:00:00',2,1,0),(79,'2018-01-08 00:00:00',2,1,0),(80,'2018-01-15 00:00:00',2,1,0),(81,'2018-01-22 00:00:00',2,1,0),(82,'2018-01-29 00:00:00',2,1,0),(83,'2018-02-05 00:00:00',2,1,0),(84,'2018-02-12 00:00:00',2,1,0),(85,'2018-02-19 00:00:00',2,1,0),(86,'2018-02-26 00:00:00',2,1,0),(87,'2018-03-05 00:00:00',2,1,0),(88,'2018-03-12 00:00:00',2,1,0),(89,'2018-03-19 00:00:00',2,1,0),(90,'2018-03-26 00:00:00',2,1,0),(91,'2018-04-02 00:00:00',2,1,0),(92,'2018-04-09 00:00:00',2,1,0),(93,'2018-04-16 00:00:00',2,1,0),(94,'2018-04-23 00:00:00',2,1,0),(95,'2018-04-30 00:00:00',2,1,0),(96,'2018-05-07 00:00:00',2,1,0),(97,'2018-05-14 00:00:00',2,1,0),(98,'2018-05-21 00:00:00',2,1,0),(99,'2018-05-28 00:00:00',2,1,0),(100,'2018-06-04 00:00:00',2,1,0),(101,'2018-06-11 00:00:00',2,1,0),(102,'2018-06-18 00:00:00',2,1,0),(103,'2018-06-25 00:00:00',2,1,0),(104,'2018-07-02 00:00:00',2,1,0),(105,'2018-07-09 00:00:00',2,1,0),(106,'2018-07-16 00:00:00',2,1,0),(107,'2018-07-23 00:00:00',2,1,0),(108,'2018-07-30 00:00:00',2,1,0),(109,'2018-08-06 00:00:00',2,1,0),(110,'2018-08-13 00:00:00',2,1,0),(111,'2018-08-20 00:00:00',2,1,0),(112,'2018-08-27 00:00:00',2,1,0),(113,'2018-09-03 00:00:00',2,1,0),(114,'2018-09-10 00:00:00',2,1,0),(115,'2018-09-17 00:00:00',2,1,0),(116,'2018-09-24 00:00:00',2,1,0),(117,'2018-10-01 00:00:00',2,1,0),(118,'2018-10-08 00:00:00',2,1,0),(119,'2018-10-15 00:00:00',2,1,0),(120,'2018-10-22 00:00:00',2,1,0),(121,'2018-10-29 00:00:00',2,1,0),(122,'2018-11-05 00:00:00',2,1,0),(123,'2018-11-12 00:00:00',2,1,0),(124,'2018-11-19 00:00:00',2,1,0),(125,'2018-11-26 00:00:00',2,1,0),(126,'2018-12-03 00:00:00',2,1,0),(127,'2018-12-10 00:00:00',2,1,0),(128,'2018-12-17 00:00:00',2,1,0),(129,'2018-12-24 00:00:00',2,1,0),(130,'2018-12-31 00:00:00',2,1,0),(131,'2019-01-07 00:00:00',2,1,0),(132,'2019-01-14 00:00:00',2,1,0),(133,'2019-01-21 00:00:00',2,1,0),(134,'2019-01-28 00:00:00',2,1,0),(135,'2019-02-04 00:00:00',2,1,0),(136,'2019-02-11 00:00:00',2,1,0),(137,'2019-02-18 00:00:00',2,1,0),(138,'2019-02-25 00:00:00',2,1,0),(139,'2019-03-04 00:00:00',2,1,0),(140,'2019-03-11 00:00:00',2,1,0),(141,'2019-03-18 00:00:00',2,1,0),(142,'2019-03-25 00:00:00',2,1,0),(143,'2019-04-01 00:00:00',2,1,0),(144,'2019-04-08 00:00:00',2,1,0),(145,'2019-04-15 00:00:00',2,1,0),(146,'2019-04-22 00:00:00',2,1,0),(147,'2019-04-29 00:00:00',2,1,0),(148,'2019-05-06 00:00:00',2,1,0),(149,'2019-05-13 00:00:00',2,1,0),(150,'2019-05-20 00:00:00',2,1,0),(151,'2019-05-27 00:00:00',2,1,0),(152,'2019-06-03 00:00:00',2,1,0),(153,'2019-06-10 00:00:00',2,1,0),(154,'2019-06-17 00:00:00',2,1,0),(155,'2019-06-24 00:00:00',2,1,0),(156,'2019-07-01 00:00:00',2,1,0),(157,'2019-07-08 00:00:00',2,1,0),(158,'2019-07-15 00:00:00',2,1,0),(159,'2019-07-22 00:00:00',2,1,0),(160,'2019-07-29 00:00:00',2,1,0),(161,'2019-08-05 00:00:00',2,1,0),(162,'2019-08-12 00:00:00',2,1,0),(163,'2019-08-19 00:00:00',2,1,0),(164,'2019-08-26 00:00:00',2,1,0),(165,'2019-09-02 00:00:00',2,1,0),(166,'2019-09-09 00:00:00',2,1,0),(167,'2019-09-16 00:00:00',2,1,0),(168,'2019-09-23 00:00:00',2,1,0),(169,'2019-09-30 00:00:00',2,1,0),(170,'2019-10-07 00:00:00',2,1,0),(171,'2019-10-14 00:00:00',2,1,0),(172,'2019-10-21 00:00:00',2,1,0),(173,'2019-10-28 00:00:00',2,1,0),(174,'2019-11-04 00:00:00',2,1,0),(175,'2019-11-11 00:00:00',2,1,0),(176,'2019-11-18 00:00:00',2,1,0),(177,'2019-11-25 00:00:00',2,1,0),(178,'2019-12-02 00:00:00',2,1,0),(179,'2019-12-09 00:00:00',2,1,0),(180,'2019-12-16 00:00:00',2,1,0),(181,'2019-12-23 00:00:00',2,1,0),(182,'2019-12-30 00:00:00',2,1,0),(183,'2020-01-06 00:00:00',2,1,0),(184,'2020-01-13 00:00:00',2,1,0),(185,'2020-01-20 00:00:00',2,1,0),(186,'2020-01-27 00:00:00',2,1,0),(187,'2020-02-03 00:00:00',2,1,0),(188,'2020-02-10 00:00:00',2,1,0),(189,'2020-02-17 00:00:00',2,1,0),(190,'2020-02-24 00:00:00',2,1,0),(191,'2020-03-02 00:00:00',2,1,0),(192,'2020-03-09 00:00:00',2,1,0),(193,'2020-03-16 00:00:00',2,1,0),(194,'2020-03-23 00:00:00',2,1,0),(195,'2020-03-30 00:00:00',2,1,0),(196,'2020-04-06 00:00:00',2,1,0),(197,'2020-04-13 00:00:00',2,1,0),(198,'2020-04-20 00:00:00',2,1,0),(199,'2020-04-27 00:00:00',2,1,0),(200,'2020-05-04 00:00:00',2,1,0),(201,'2020-05-11 00:00:00',2,1,0),(202,'2020-05-18 00:00:00',2,1,0),(203,'2020-05-25 00:00:00',2,1,0),(204,'2020-06-01 00:00:00',2,1,0),(205,'2020-06-08 00:00:00',2,1,0),(206,'2020-06-15 00:00:00',2,1,0),(207,'2020-06-22 00:00:00',2,1,0),(208,'2020-06-29 00:00:00',2,1,0),(209,'2020-07-06 00:00:00',2,1,0),(210,'2020-07-13 00:00:00',2,1,0),(211,'2020-07-20 00:00:00',2,1,0),(212,'2017-06-01 00:00:00',3,1,0),(213,'2017-06-08 00:00:00',3,1,0),(214,'2017-06-15 00:00:00',3,1,0),(215,'2017-06-22 00:00:00',3,1,0),(216,'2017-06-29 00:00:00',3,1,0),(217,'2017-07-06 00:00:00',3,1,0),(218,'2017-07-13 00:00:00',3,1,0),(219,'2017-07-20 00:00:00',3,1,0),(220,'2017-07-27 00:00:00',3,1,0),(221,'2017-08-03 00:00:00',3,1,0),(222,'2017-08-10 00:00:00',3,1,0),(223,'2017-08-17 00:00:00',3,1,0),(224,'2017-08-24 00:00:00',3,1,0),(225,'2017-08-31 00:00:00',3,1,0),(226,'2017-09-07 00:00:00',3,1,0),(227,'2017-09-14 00:00:00',3,1,0),(228,'2017-09-21 00:00:00',3,1,0),(229,'2017-09-28 00:00:00',3,1,0),(230,'2017-10-05 00:00:00',3,1,0),(231,'2017-10-12 00:00:00',3,1,0),(232,'2017-10-19 00:00:00',3,1,0),(233,'2017-10-26 00:00:00',3,1,0),(234,'2017-11-02 00:00:00',3,1,0),(235,'2017-11-09 00:00:00',3,1,0),(236,'2017-11-16 00:00:00',3,1,0),(237,'2017-11-23 00:00:00',3,1,0),(238,'2017-11-30 00:00:00',3,1,0),(239,'2017-12-07 00:00:00',3,1,0),(240,'2017-12-14 00:00:00',3,1,0),(241,'2017-12-21 00:00:00',3,1,0),(242,'2017-12-28 00:00:00',3,1,0),(243,'2018-01-04 00:00:00',3,1,0),(244,'2018-01-11 00:00:00',3,1,0),(245,'2018-01-18 00:00:00',3,1,0),(246,'2018-01-25 00:00:00',3,1,0),(247,'2018-02-01 00:00:00',3,1,0),(248,'2018-02-08 00:00:00',3,1,0),(249,'2018-02-15 00:00:00',3,1,0),(250,'2018-02-22 00:00:00',3,1,0),(251,'2018-03-01 00:00:00',3,1,0),(252,'2018-03-08 00:00:00',3,1,0),(253,'2018-03-15 00:00:00',3,1,0),(254,'2018-03-22 00:00:00',3,1,0),(255,'2018-03-29 00:00:00',3,1,0),(256,'2018-04-05 00:00:00',3,1,0),(257,'2018-04-12 00:00:00',3,1,0),(258,'2018-04-19 00:00:00',3,1,0),(259,'2018-04-26 00:00:00',3,1,0),(260,'2018-05-03 00:00:00',3,1,0),(261,'2018-05-10 00:00:00',3,1,0),(262,'2018-05-17 00:00:00',3,1,0),(263,'2018-05-24 00:00:00',3,1,0),(264,'2018-05-31 00:00:00',3,1,0),(265,'2017-06-15 00:00:00',4,1,0),(266,'2017-06-22 00:00:00',4,1,0),(267,'2017-06-29 00:00:00',4,1,0),(268,'2017-07-06 00:00:00',4,1,0),(269,'2017-07-13 00:00:00',4,1,0),(270,'2017-07-20 00:00:00',4,1,0),(271,'2017-07-27 00:00:00',4,1,0),(272,'2017-08-03 00:00:00',4,1,0),(273,'2017-08-10 00:00:00',4,1,0),(274,'2017-08-17 00:00:00',4,1,0),(275,'2017-08-24 00:00:00',4,1,0),(276,'2017-08-31 00:00:00',4,1,0),(277,'2017-09-07 00:00:00',4,1,0),(278,'2017-09-14 00:00:00',4,1,0),(279,'2017-09-21 00:00:00',4,1,0),(280,'2017-09-28 00:00:00',4,1,0),(281,'2017-10-05 00:00:00',4,1,0),(282,'2017-10-12 00:00:00',4,1,0),(283,'2017-10-19 00:00:00',4,1,0),(284,'2017-10-26 00:00:00',4,1,0),(285,'2017-11-02 00:00:00',4,1,0),(286,'2017-11-09 00:00:00',4,1,0),(287,'2017-11-16 00:00:00',4,1,0),(288,'2017-11-23 00:00:00',4,1,0),(289,'2017-11-30 00:00:00',4,1,0),(290,'2017-12-07 00:00:00',4,1,0),(291,'2017-12-14 00:00:00',4,1,0),(292,'2017-12-21 00:00:00',4,1,0),(293,'2017-12-28 00:00:00',4,1,0),(294,'2018-01-04 00:00:00',4,1,0),(295,'2018-01-11 00:00:00',4,1,0),(296,'2018-01-18 00:00:00',4,1,0),(297,'2018-01-25 00:00:00',4,1,0),(298,'2018-02-01 00:00:00',4,1,0),(299,'2018-02-08 00:00:00',4,1,0),(300,'2018-02-15 00:00:00',4,1,0),(301,'2018-02-22 00:00:00',4,1,0),(302,'2018-03-01 00:00:00',4,1,0),(303,'2018-03-08 00:00:00',4,1,0),(304,'2018-03-15 00:00:00',4,1,0),(305,'2018-03-22 00:00:00',4,1,0),(306,'2018-03-29 00:00:00',4,1,0),(307,'2018-04-05 00:00:00',4,1,0),(308,'2018-04-12 00:00:00',4,1,0),(309,'2018-04-19 00:00:00',4,1,0),(310,'2018-04-26 00:00:00',4,1,0),(311,'2018-05-03 00:00:00',4,1,0),(312,'2018-05-10 00:00:00',4,1,0),(313,'2018-05-17 00:00:00',4,1,0),(314,'2018-05-24 00:00:00',4,1,0),(315,'2018-05-31 00:00:00',4,1,0),(316,'2018-06-07 00:00:00',4,1,0),(317,'2018-06-14 00:00:00',4,1,0),(318,'2018-06-21 00:00:00',4,1,0),(319,'2018-06-28 00:00:00',4,1,0),(320,'2018-07-05 00:00:00',4,1,0),(321,'2018-07-12 00:00:00',4,1,0),(322,'2018-07-19 00:00:00',4,1,0),(323,'2018-07-26 00:00:00',4,1,0),(324,'2018-08-02 00:00:00',4,1,0),(325,'2018-08-09 00:00:00',4,1,0),(326,'2018-08-16 00:00:00',4,1,0),(327,'2018-08-23 00:00:00',4,1,0),(328,'2018-08-30 00:00:00',4,1,0),(329,'2018-09-06 00:00:00',4,1,0),(330,'2018-09-13 00:00:00',4,1,0),(331,'2018-09-20 00:00:00',4,1,0),(332,'2018-09-27 00:00:00',4,1,0),(333,'2018-10-04 00:00:00',4,1,0),(334,'2018-10-11 00:00:00',4,1,0),(335,'2018-10-18 00:00:00',4,1,0),(336,'2018-10-25 00:00:00',4,1,0),(337,'2018-11-01 00:00:00',4,1,0),(338,'2018-11-08 00:00:00',4,1,0),(339,'2018-11-15 00:00:00',4,1,0),(340,'2018-11-22 00:00:00',4,1,0),(341,'2018-11-29 00:00:00',4,1,0),(342,'2018-12-06 00:00:00',4,1,0),(343,'2018-12-13 00:00:00',4,1,0),(344,'2018-12-20 00:00:00',4,1,0),(345,'2018-12-27 00:00:00',4,1,0),(346,'2019-01-03 00:00:00',4,1,0),(347,'2019-01-10 00:00:00',4,1,0),(348,'2019-01-17 00:00:00',4,1,0),(349,'2019-01-24 00:00:00',4,1,0),(350,'2019-01-31 00:00:00',4,1,0),(351,'2019-02-07 00:00:00',4,1,0),(352,'2019-02-14 00:00:00',4,1,0),(353,'2019-02-21 00:00:00',4,1,0),(354,'2019-02-28 00:00:00',4,1,0),(355,'2019-03-07 00:00:00',4,1,0),(356,'2019-03-14 00:00:00',4,1,0),(357,'2019-03-21 00:00:00',4,1,0),(358,'2019-03-28 00:00:00',4,1,0),(359,'2019-04-04 00:00:00',4,1,0),(360,'2019-04-11 00:00:00',4,1,0),(361,'2019-04-18 00:00:00',4,1,0),(362,'2019-04-25 00:00:00',4,1,0),(363,'2019-05-02 00:00:00',4,1,0),(364,'2019-05-09 00:00:00',4,1,0),(365,'2019-05-16 00:00:00',4,1,0),(366,'2019-05-23 00:00:00',4,1,0),(367,'2019-05-30 00:00:00',4,1,0),(368,'2019-06-06 00:00:00',4,1,0),(369,'2019-06-13 00:00:00',4,1,0),(370,'2019-06-20 00:00:00',4,1,0),(371,'2019-06-27 00:00:00',4,1,0),(372,'2019-07-04 00:00:00',4,1,0),(373,'2019-07-11 00:00:00',4,1,0),(374,'2019-07-18 00:00:00',4,1,0),(375,'2019-07-25 00:00:00',4,1,0),(376,'2019-08-01 00:00:00',4,1,0),(377,'2019-08-08 00:00:00',4,1,0),(378,'2019-08-15 00:00:00',4,1,0),(379,'2019-08-22 00:00:00',4,1,0),(380,'2019-08-29 00:00:00',4,1,0),(381,'2019-09-05 00:00:00',4,1,0),(382,'2019-09-12 00:00:00',4,1,0),(383,'2019-09-19 00:00:00',4,1,0),(384,'2019-09-26 00:00:00',4,1,0),(385,'2019-10-03 00:00:00',4,1,0),(386,'2019-10-10 00:00:00',4,1,0),(387,'2019-10-17 00:00:00',4,1,0),(388,'2019-10-24 00:00:00',4,1,0),(389,'2019-10-31 00:00:00',4,1,0),(390,'2019-11-07 00:00:00',4,1,0),(391,'2019-11-14 00:00:00',4,1,0),(392,'2019-11-21 00:00:00',4,1,0),(393,'2019-11-28 00:00:00',4,1,0),(394,'2019-12-05 00:00:00',4,1,0),(395,'2019-12-12 00:00:00',4,1,0),(396,'2019-12-19 00:00:00',4,1,0),(397,'2014-09-14 00:00:00',5,1,0),(398,'2014-09-21 00:00:00',5,1,0),(399,'2014-09-28 00:00:00',5,1,0),(400,'2014-10-05 00:00:00',5,1,0),(401,'2014-10-12 00:00:00',5,1,0),(402,'2014-10-19 00:00:00',5,1,0),(403,'2014-10-26 00:00:00',5,1,0),(404,'2014-11-02 00:00:00',5,1,0),(405,'2014-11-09 00:00:00',5,1,0),(406,'2014-11-16 00:00:00',5,1,0),(407,'2014-11-23 00:00:00',5,1,0),(408,'2014-11-30 00:00:00',5,1,0),(409,'2014-12-07 00:00:00',5,1,0),(410,'2014-12-14 00:00:00',5,1,0),(411,'2014-12-21 00:00:00',5,1,0),(412,'2014-12-28 00:00:00',5,1,0),(413,'2015-01-04 00:00:00',5,1,0),(414,'2015-01-11 00:00:00',5,1,0),(415,'2015-01-18 00:00:00',5,1,0),(416,'2015-01-25 00:00:00',5,1,0),(417,'2015-02-01 00:00:00',5,1,0),(418,'2015-02-08 00:00:00',5,1,0),(419,'2015-02-15 00:00:00',5,1,0),(420,'2015-02-22 00:00:00',5,1,0),(421,'2015-03-01 00:00:00',5,1,0),(422,'2015-03-08 00:00:00',5,1,0),(423,'2015-03-15 00:00:00',5,1,0),(424,'2015-03-22 00:00:00',5,1,0),(425,'2015-03-29 00:00:00',5,1,0),(426,'2015-04-05 00:00:00',5,1,0),(427,'2015-04-12 00:00:00',5,1,0),(428,'2015-04-19 00:00:00',5,1,0),(429,'2015-04-26 00:00:00',5,1,0),(430,'2015-05-03 00:00:00',5,1,0),(431,'2015-05-10 00:00:00',5,1,0),(432,'2015-05-17 00:00:00',5,1,0),(433,'2015-05-24 00:00:00',5,1,0),(434,'2015-05-31 00:00:00',5,1,0),(435,'2015-06-07 00:00:00',5,1,0),(436,'2015-06-14 00:00:00',5,1,0),(437,'2015-06-21 00:00:00',5,1,0),(438,'2015-06-28 00:00:00',5,1,0),(439,'2015-07-05 00:00:00',5,1,0),(440,'2015-07-12 00:00:00',5,1,0),(441,'2015-07-19 00:00:00',5,1,0),(442,'2015-07-26 00:00:00',5,1,0),(443,'2015-08-02 00:00:00',5,1,0),(444,'2015-08-09 00:00:00',5,1,0),(445,'2015-08-16 00:00:00',5,1,0),(446,'2015-08-23 00:00:00',5,1,0),(447,'2015-08-30 00:00:00',5,1,0),(448,'2015-09-06 00:00:00',5,1,0),(449,'2015-09-13 00:00:00',5,1,0),(450,'2015-09-20 00:00:00',5,1,0),(451,'2015-09-27 00:00:00',5,1,0),(452,'2015-10-04 00:00:00',5,1,0),(453,'2015-10-11 00:00:00',5,1,0),(454,'2015-10-18 00:00:00',5,1,0),(455,'2015-10-25 00:00:00',5,1,0),(456,'2015-11-01 00:00:00',5,1,0),(457,'2015-11-08 00:00:00',5,1,0),(458,'2015-11-15 00:00:00',5,1,0),(459,'2015-11-22 00:00:00',5,1,0),(460,'2015-11-29 00:00:00',5,1,0),(461,'2015-12-06 00:00:00',5,1,0),(462,'2015-12-13 00:00:00',5,1,0),(463,'2015-12-20 00:00:00',5,1,0),(464,'2015-12-27 00:00:00',5,1,0),(465,'2016-01-03 00:00:00',5,1,0),(466,'2016-01-10 00:00:00',5,1,0),(467,'2016-01-17 00:00:00',5,1,0),(468,'2016-01-24 00:00:00',5,1,0),(469,'2016-01-31 00:00:00',5,1,0),(470,'2016-02-07 00:00:00',5,1,0),(471,'2016-02-14 00:00:00',5,1,0),(472,'2016-02-21 00:00:00',5,1,0),(473,'2016-02-28 00:00:00',5,1,0),(474,'2016-03-06 00:00:00',5,1,0),(475,'2016-03-13 00:00:00',5,1,0),(476,'2016-03-20 00:00:00',5,1,0),(477,'2016-03-27 00:00:00',5,1,0),(478,'2016-04-03 00:00:00',5,1,0),(479,'2016-04-10 00:00:00',5,1,0),(480,'2016-04-17 00:00:00',5,1,0),(481,'2016-04-24 00:00:00',5,1,0),(482,'2016-05-01 00:00:00',5,1,0),(483,'2016-05-08 00:00:00',5,1,0),(484,'2016-05-15 00:00:00',5,1,0),(485,'2016-05-22 00:00:00',5,1,0),(486,'2016-05-29 00:00:00',5,1,0),(487,'2016-06-05 00:00:00',5,1,0),(488,'2016-06-12 00:00:00',5,1,0),(489,'2016-06-19 00:00:00',5,1,0),(490,'2016-06-26 00:00:00',5,1,0),(491,'2016-07-03 00:00:00',5,1,0),(492,'2016-07-10 00:00:00',5,1,0),(493,'2016-07-17 00:00:00',5,1,0),(494,'2016-07-24 00:00:00',5,1,0),(495,'2016-07-31 00:00:00',5,1,0),(496,'2016-08-07 00:00:00',5,1,0),(497,'2016-08-14 00:00:00',5,1,0),(498,'2016-08-21 00:00:00',5,1,0),(499,'2016-08-28 00:00:00',5,1,0),(500,'2016-09-04 00:00:00',5,1,0),(501,'2016-09-11 00:00:00',5,1,0),(502,'2016-09-18 00:00:00',5,1,0),(503,'2016-09-25 00:00:00',5,1,0),(504,'2016-10-02 00:00:00',5,1,0),(505,'2016-10-09 00:00:00',5,1,0),(506,'2016-10-16 00:00:00',5,1,0),(507,'2016-10-23 00:00:00',5,1,0),(508,'2016-10-30 00:00:00',5,1,0),(509,'2016-11-06 00:00:00',5,1,0),(510,'2016-11-13 00:00:00',5,1,0),(511,'2016-11-20 00:00:00',5,1,0),(512,'2016-11-27 00:00:00',5,1,0),(513,'2016-12-04 00:00:00',5,1,0),(514,'2016-12-11 00:00:00',5,1,0),(515,'2016-12-18 00:00:00',5,1,0),(516,'2016-12-25 00:00:00',5,1,0),(517,'2017-01-01 00:00:00',5,1,0),(518,'2017-01-08 00:00:00',5,1,0),(519,'2017-01-15 00:00:00',5,1,0),(520,'2017-01-22 00:00:00',5,1,0),(521,'2017-01-29 00:00:00',5,1,0),(522,'2017-02-05 00:00:00',5,1,0),(523,'2017-02-12 00:00:00',5,1,0),(524,'2017-02-19 00:00:00',5,1,0),(525,'2017-02-26 00:00:00',5,1,0),(526,'2017-03-05 00:00:00',5,1,0),(527,'2017-03-12 00:00:00',5,1,0),(528,'2017-03-19 00:00:00',5,1,0),(529,'2017-03-26 00:00:00',5,1,0),(530,'2017-04-02 00:00:00',5,1,0),(531,'2017-04-09 00:00:00',5,1,0),(532,'2017-04-16 00:00:00',5,1,0),(533,'2017-04-23 00:00:00',5,1,0),(534,'2017-04-30 00:00:00',5,1,0),(535,'2017-05-07 00:00:00',5,1,0),(536,'2017-05-14 00:00:00',5,1,0),(537,'2017-05-21 00:00:00',5,1,0),(538,'2017-05-28 00:00:00',5,1,0),(539,'2017-06-04 00:00:00',5,1,0),(540,'2017-06-11 00:00:00',5,1,0),(541,'2017-06-18 00:00:00',5,1,0),(542,'2017-06-25 00:00:00',5,1,0),(543,'2017-07-02 00:00:00',5,1,0),(544,'2017-07-09 00:00:00',5,1,0),(545,'2017-07-16 00:00:00',5,1,0),(546,'2017-07-23 00:00:00',5,1,0),(547,'2017-07-30 00:00:00',5,1,0),(548,'2017-08-06 00:00:00',5,1,0),(549,'2017-08-13 00:00:00',5,1,0),(550,'2017-08-20 00:00:00',5,1,0),(551,'2017-08-27 00:00:00',5,1,0),(552,'2017-09-03 00:00:00',5,1,0),(553,'2017-09-10 00:00:00',5,1,0),(554,'2017-09-17 00:00:00',5,1,0),(555,'2015-06-09 00:00:00',6,1,0),(556,'2015-06-16 00:00:00',6,1,0),(557,'2015-06-23 00:00:00',6,1,0),(558,'2015-06-30 00:00:00',6,1,0),(559,'2015-07-07 00:00:00',6,1,0),(560,'2015-07-14 00:00:00',6,1,0),(561,'2015-07-21 00:00:00',6,1,0),(562,'2015-07-28 00:00:00',6,1,0),(563,'2015-08-04 00:00:00',6,1,0),(564,'2015-08-11 00:00:00',6,1,0),(565,'2015-08-18 00:00:00',6,1,0),(566,'2015-08-25 00:00:00',6,1,0),(567,'2015-09-01 00:00:00',6,1,0),(568,'2015-09-08 00:00:00',6,1,0),(569,'2015-09-15 00:00:00',6,1,0),(570,'2015-09-22 00:00:00',6,1,0),(571,'2015-09-29 00:00:00',6,1,0),(572,'2015-10-06 00:00:00',6,1,0),(573,'2015-10-13 00:00:00',6,1,0),(574,'2015-10-20 00:00:00',6,1,0),(575,'2015-10-27 00:00:00',6,1,0),(576,'2015-11-03 00:00:00',6,1,0),(577,'2015-11-10 00:00:00',6,1,0),(578,'2015-11-17 00:00:00',6,1,0),(579,'2015-11-24 00:00:00',6,1,0),(580,'2015-12-01 00:00:00',6,1,0),(581,'2015-12-08 00:00:00',6,1,0),(582,'2015-12-15 00:00:00',6,1,0),(583,'2015-12-22 00:00:00',6,1,0),(584,'2015-12-29 00:00:00',6,1,0),(585,'2016-01-05 00:00:00',6,1,0),(586,'2016-01-12 00:00:00',6,1,0),(587,'2016-01-19 00:00:00',6,1,0),(588,'2016-01-26 00:00:00',6,1,0),(589,'2016-02-02 00:00:00',6,1,0),(590,'2016-02-09 00:00:00',6,1,0),(591,'2016-02-16 00:00:00',6,1,0),(592,'2016-02-23 00:00:00',6,1,0),(593,'2016-03-01 00:00:00',6,1,0),(594,'2016-03-08 00:00:00',6,1,0),(595,'2016-03-15 00:00:00',6,1,0),(596,'2016-03-22 00:00:00',6,1,0),(597,'2016-03-29 00:00:00',6,1,0),(598,'2016-04-05 00:00:00',6,1,0),(599,'2016-04-12 00:00:00',6,1,0),(600,'2016-04-19 00:00:00',6,1,0),(601,'2016-04-26 00:00:00',6,1,0),(602,'2016-05-03 00:00:00',6,1,0),(603,'2016-05-10 00:00:00',6,1,0),(604,'2016-05-17 00:00:00',6,1,0),(605,'2016-05-24 00:00:00',6,1,0),(606,'2016-05-31 00:00:00',6,1,0),(607,'2016-06-07 00:00:00',6,1,0),(608,'2016-06-14 00:00:00',6,1,0),(609,'2016-06-21 00:00:00',6,1,0),(610,'2016-06-28 00:00:00',6,1,0),(611,'2016-07-05 00:00:00',6,1,0),(612,'2016-07-12 00:00:00',6,1,0),(613,'2016-07-19 00:00:00',6,1,0),(614,'2016-07-26 00:00:00',6,1,0),(615,'2016-08-02 00:00:00',6,1,0),(616,'2016-08-09 00:00:00',6,1,0),(617,'2016-08-16 00:00:00',6,1,0),(618,'2016-08-23 00:00:00',6,1,0),(619,'2016-08-30 00:00:00',6,1,0),(620,'2016-09-06 00:00:00',6,1,0),(621,'2016-09-13 00:00:00',6,1,0),(622,'2016-09-20 00:00:00',6,1,0),(623,'2016-09-27 00:00:00',6,1,0),(624,'2016-10-04 00:00:00',6,1,0),(625,'2016-10-11 00:00:00',6,1,0),(626,'2016-10-18 00:00:00',6,1,0),(627,'2016-10-25 00:00:00',6,1,0),(628,'2016-11-01 00:00:00',6,1,0),(629,'2016-11-08 00:00:00',6,1,0),(630,'2016-11-15 00:00:00',6,1,0),(631,'2016-11-22 00:00:00',6,1,0),(632,'2016-11-29 00:00:00',6,1,0),(633,'2016-12-06 00:00:00',6,1,0),(634,'2016-12-13 00:00:00',6,1,0),(635,'2016-12-20 00:00:00',6,1,0),(636,'2016-12-27 00:00:00',6,1,0),(637,'2017-01-03 00:00:00',6,1,0),(638,'2017-01-10 00:00:00',6,1,0),(639,'2017-01-17 00:00:00',6,1,0),(640,'2017-01-24 00:00:00',6,1,0),(641,'2017-01-31 00:00:00',6,1,0),(642,'2017-02-07 00:00:00',6,1,0),(643,'2017-02-14 00:00:00',6,1,0),(644,'2017-02-21 00:00:00',6,1,0),(645,'2017-02-28 00:00:00',6,1,0),(646,'2017-03-07 00:00:00',6,1,0),(647,'2017-03-14 00:00:00',6,1,0),(648,'2017-03-21 00:00:00',6,1,0),(649,'2017-03-28 00:00:00',6,1,0),(650,'2017-04-04 00:00:00',6,1,0),(651,'2017-04-11 00:00:00',6,1,0),(652,'2017-04-18 00:00:00',6,1,0),(653,'2017-04-25 00:00:00',6,1,0),(654,'2017-05-02 00:00:00',6,1,0),(655,'2017-05-09 00:00:00',6,1,0),(656,'2017-05-16 00:00:00',6,1,0),(657,'2017-05-23 00:00:00',6,1,0),(658,'2017-05-30 00:00:00',6,1,0),(659,'2017-06-06 00:00:00',6,1,0),(660,'2017-06-13 00:00:00',6,1,0),(661,'2017-06-20 00:00:00',6,1,0),(662,'2017-06-27 00:00:00',6,1,0),(663,'2017-07-04 00:00:00',6,1,0),(664,'2017-07-11 00:00:00',6,1,0),(665,'2017-07-18 00:00:00',6,1,0),(666,'2017-07-25 00:00:00',6,1,0),(667,'2017-08-01 00:00:00',6,1,0),(668,'2017-08-08 00:00:00',6,1,0),(669,'2017-08-15 00:00:00',6,1,0),(670,'2017-08-22 00:00:00',6,1,0),(671,'2017-08-29 00:00:00',6,1,0),(672,'2017-09-05 00:00:00',6,1,0),(673,'2017-09-12 00:00:00',6,1,0),(674,'2017-09-19 00:00:00',6,1,0),(675,'2017-09-26 00:00:00',6,1,0),(676,'2017-10-03 00:00:00',6,1,0),(677,'2017-10-10 00:00:00',6,1,0),(678,'2017-10-17 00:00:00',6,1,0),(679,'2017-10-24 00:00:00',6,1,0),(680,'2017-10-31 00:00:00',6,1,0),(681,'2017-11-07 00:00:00',6,1,0),(682,'2017-11-14 00:00:00',6,1,0),(683,'2017-11-21 00:00:00',6,1,0),(684,'2017-11-28 00:00:00',6,1,0),(685,'2017-12-05 00:00:00',6,1,0),(686,'2017-12-12 00:00:00',6,1,0),(687,'2017-12-19 00:00:00',6,1,0),(688,'2017-12-26 00:00:00',6,1,0),(689,'2018-01-02 00:00:00',6,1,0),(690,'2018-01-09 00:00:00',6,1,0),(691,'2018-01-16 00:00:00',6,1,0),(692,'2018-01-23 00:00:00',6,1,0),(693,'2018-01-30 00:00:00',6,1,0),(694,'2018-02-06 00:00:00',6,1,0),(695,'2018-02-13 00:00:00',6,1,0),(696,'2018-02-20 00:00:00',6,1,0),(697,'2018-02-27 00:00:00',6,1,0),(698,'2018-03-06 00:00:00',6,1,0),(699,'2018-03-13 00:00:00',6,1,0),(700,'2018-03-20 00:00:00',6,1,0),(701,'2018-03-27 00:00:00',6,1,0),(702,'2018-04-03 00:00:00',6,1,0),(703,'2018-04-10 00:00:00',6,1,0),(704,'2018-04-17 00:00:00',6,1,0),(705,'2018-04-24 00:00:00',6,1,0),(706,'2018-05-01 00:00:00',6,1,0),(707,'2018-05-08 00:00:00',6,1,0),(708,'2018-05-15 00:00:00',6,1,0),(709,'2018-05-22 00:00:00',6,1,0),(710,'2018-05-29 00:00:00',6,1,0),(711,'2018-06-05 00:00:00',6,1,0),(712,'2018-06-12 00:00:00',6,1,0),(713,'2018-06-19 00:00:00',6,1,0),(714,'2018-06-26 00:00:00',6,1,0),(715,'2018-07-03 00:00:00',6,1,0),(716,'2018-07-10 00:00:00',6,1,0),(717,'2018-07-17 00:00:00',6,1,0),(718,'2018-07-24 00:00:00',6,1,0),(719,'2018-07-31 00:00:00',6,1,0),(720,'2018-08-07 00:00:00',6,1,0),(721,'2018-08-14 00:00:00',6,1,0),(722,'2018-08-21 00:00:00',6,1,0),(723,'2018-08-28 00:00:00',6,1,0),(724,'2018-09-04 00:00:00',6,1,0),(725,'2018-09-11 00:00:00',6,1,0),(726,'2018-09-18 00:00:00',6,1,0),(727,'2018-09-25 00:00:00',6,1,0),(728,'2018-10-02 00:00:00',6,1,0),(729,'2018-10-09 00:00:00',6,1,0),(730,'2018-10-16 00:00:00',6,1,0),(731,'2018-10-23 00:00:00',6,1,0),(732,'2018-10-30 00:00:00',6,1,0),(733,'2018-11-06 00:00:00',6,1,0),(734,'2018-11-13 00:00:00',6,1,0),(735,'2018-11-20 00:00:00',6,1,0),(736,'2018-11-27 00:00:00',6,1,0),(737,'2018-12-04 00:00:00',6,1,0),(738,'2018-12-11 00:00:00',6,1,0),(739,'2018-12-18 00:00:00',6,1,0),(740,'2018-12-25 00:00:00',6,1,0),(741,'2019-01-01 00:00:00',6,1,0),(742,'2019-01-08 00:00:00',6,1,0),(743,'2019-01-15 00:00:00',6,1,0),(744,'2019-01-22 00:00:00',6,1,0),(745,'2019-01-29 00:00:00',6,1,0),(746,'2019-02-05 00:00:00',6,1,0),(747,'2019-02-12 00:00:00',6,1,0),(748,'2019-02-19 00:00:00',6,1,0),(749,'2019-02-26 00:00:00',6,1,0),(750,'2019-03-05 00:00:00',6,1,0),(751,'2019-03-12 00:00:00',6,1,0),(752,'2019-03-19 00:00:00',6,1,0),(753,'2019-03-26 00:00:00',6,1,0),(754,'2019-04-02 00:00:00',6,1,0),(755,'2019-04-09 00:00:00',6,1,0),(756,'2019-04-16 00:00:00',6,1,0),(757,'2019-04-23 00:00:00',6,1,0),(758,'2019-04-30 00:00:00',6,1,0),(759,'2019-05-07 00:00:00',6,1,0),(760,'2019-05-14 00:00:00',6,1,0),(761,'2019-05-21 00:00:00',6,1,0),(762,'2019-05-28 00:00:00',6,1,0),(763,'2019-06-04 00:00:00',6,1,0),(764,'2019-06-11 00:00:00',6,1,0),(765,'2017-06-01 00:00:00',7,1,0),(766,'2017-06-08 00:00:00',7,1,0),(767,'2017-06-15 00:00:00',7,1,0),(768,'2017-06-22 00:00:00',7,1,0),(769,'2017-06-29 00:00:00',7,1,0),(770,'2017-07-06 00:00:00',7,1,0),(771,'2017-07-13 00:00:00',7,1,0),(772,'2017-07-20 00:00:00',7,1,0),(773,'2017-07-27 00:00:00',7,1,0),(774,'2017-08-03 00:00:00',7,1,0),(775,'2017-08-10 00:00:00',7,1,0),(776,'2017-08-17 00:00:00',7,1,0),(777,'2017-08-24 00:00:00',7,1,0),(778,'2017-08-31 00:00:00',7,1,0),(779,'2017-09-07 00:00:00',7,1,0),(780,'2017-09-14 00:00:00',7,1,0),(781,'2017-09-21 00:00:00',7,1,0),(782,'2017-09-28 00:00:00',7,1,0),(783,'2017-10-05 00:00:00',7,1,0),(784,'2017-10-12 00:00:00',7,1,0),(785,'2017-10-19 00:00:00',7,1,0),(786,'2017-10-26 00:00:00',7,1,0),(787,'2017-11-02 00:00:00',7,1,0),(788,'2017-11-09 00:00:00',7,1,0),(789,'2017-11-16 00:00:00',7,1,0),(790,'2017-11-23 00:00:00',7,1,0),(791,'2017-11-30 00:00:00',7,1,0),(792,'2017-12-07 00:00:00',7,1,0),(793,'2017-12-14 00:00:00',7,1,0),(794,'2017-12-21 00:00:00',7,1,0),(795,'2017-12-28 00:00:00',7,1,0),(796,'2018-01-04 00:00:00',7,1,0),(797,'2018-01-11 00:00:00',7,1,0),(798,'2018-01-18 00:00:00',7,1,0),(799,'2018-01-25 00:00:00',7,1,0),(800,'2018-02-01 00:00:00',7,1,0),(801,'2018-02-08 00:00:00',7,1,0),(802,'2018-02-15 00:00:00',7,1,0),(803,'2018-02-22 00:00:00',7,1,0),(804,'2018-03-01 00:00:00',7,1,0),(805,'2018-03-08 00:00:00',7,1,0),(806,'2018-03-15 00:00:00',7,1,0),(807,'2018-03-22 00:00:00',7,1,0),(808,'2018-03-29 00:00:00',7,1,0),(809,'2018-04-05 00:00:00',7,1,0),(810,'2018-04-12 00:00:00',7,1,0),(811,'2018-04-19 00:00:00',7,1,0),(812,'2018-04-26 00:00:00',7,1,0),(813,'2018-05-03 00:00:00',7,1,0),(814,'2018-05-10 00:00:00',7,1,0),(815,'2018-05-17 00:00:00',7,1,0),(816,'2018-05-24 00:00:00',7,1,0),(817,'2018-05-31 00:00:00',7,1,0),(818,'2018-06-07 00:00:00',7,1,0),(819,'2018-11-17 00:00:00',8,1,0),(820,'2018-12-15 00:00:00',8,1,0),(821,'2019-01-12 00:00:00',8,1,0),(822,'2019-02-09 00:00:00',8,1,0),(823,'2019-03-09 00:00:00',8,1,0),(824,'2019-04-06 00:00:00',8,1,0),(825,'2019-05-04 00:00:00',8,1,0),(826,'2019-06-01 00:00:00',8,1,0),(827,'2019-06-29 00:00:00',8,1,0),(828,'2019-07-27 00:00:00',8,1,0),(829,'2019-08-24 00:00:00',8,1,0),(830,'2019-09-21 00:00:00',8,1,0),(831,'2019-10-19 00:00:00',8,1,0),(832,'2019-11-16 00:00:00',8,1,0),(833,'2019-12-14 00:00:00',8,1,0),(834,'2020-01-11 00:00:00',8,1,0),(835,'2020-02-08 00:00:00',8,1,0),(836,'2020-03-07 00:00:00',8,1,0),(837,'2020-04-04 00:00:00',8,1,0),(838,'2020-05-02 00:00:00',8,1,0),(839,'2020-05-30 00:00:00',8,1,0),(840,'2020-06-27 00:00:00',8,1,0),(841,'2020-07-25 00:00:00',8,1,0),(842,'2020-08-22 00:00:00',8,1,0),(843,'2020-09-19 00:00:00',8,1,0),(844,'2020-10-17 00:00:00',8,1,0),(845,'2020-11-14 00:00:00',8,1,0),(846,'2020-12-12 00:00:00',8,1,0),(847,'2017-05-27 00:00:00',9,1,0),(848,'2017-06-24 00:00:00',9,1,0),(849,'2017-07-22 00:00:00',9,1,0),(850,'2017-08-19 00:00:00',9,1,0),(851,'2017-09-16 00:00:00',9,1,0),(852,'2017-10-14 00:00:00',9,1,0),(853,'2017-11-11 00:00:00',9,1,0),(854,'2017-12-09 00:00:00',9,1,0),(855,'2018-01-06 00:00:00',9,1,0);
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
  UNIQUE KEY `uix_rol1` (`name`,`organisation_id`),
  KEY `organisation_id` (`organisation_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`organisation_id`) REFERENCES `organisations` (`id`),
  CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Project Manager',1,NULL,1),(2,'Project Engineer',1,1,1),(3,'Project Manager',5,NULL,1),(4,'PM',26,NULL,1),(5,'PE',26,4,1),(6,'PL',26,4,1),(7,'TE',26,4,1),(8,'SM',26,4,1),(9,'Project Engineer',5,3,1),(10,'Project Manager',3,NULL,1),(11,'Construction Manager',3,10,1),(12,'Sub Agent',3,11,1),(13,'Planning Manager',3,10,1),(14,'Sub Agent 2',3,11,1);
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
  UNIQUE KEY `uix_sec1` (`code`,`project_id`),
  KEY `project_id` (`project_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `sections_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `sections_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,'C01','Section C1',1,NULL,1),(2,'C02','Section C2',1,NULL,1),(3,'C03','Section C3',1,NULL,1),(4,'A1','Area 1',3,NULL,1),(5,'CV','Civil Work',5,NULL,1),(6,'OA','Hunyan Project',5,NULL,1),(7,'EW','Erection Works',5,6,1),(8,'C1','Section C1',1,NULL,1),(9,'RP01_pp','Station ',6,NULL,1),(11,'A2','Area A2',3,NULL,1),(12,'A2A','Area 2A',3,11,1),(13,'INT','Intermediate Level',9,NULL,1),(14,'CON','Concourse Level',9,NULL,1);
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
INSERT INTO `user_project` VALUES (1,1,1,1),(1,2,1,1),(2,1,1,1),(2,3,1,1),(3,7,3,1),(4,7,3,1),(5,30,4,1),(9,5,13,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Hassan','Emam','hassan.emam@hotmail.com','hassan','$2a$12$UfqXLs0gHouGmyq/rMDAPOGfJQN5QECR.QmbhHi1FIFpcTkV5CgrK',1,1,1,0,NULL),(2,'Emam','Emam','emam@hotmail.com','Emam','$2a$12$ja2Upqbyioxp/Vx/GI6jK.datHdrmXdEDAYnN9T5kXjiiRV00ngRa',1,0,1,0,NULL),(5,'David','Nash','davidnash.email@gmail.com','dnash','$2a$12$MEGCpHeu46Uacfy8LN2A7e3z51UpJZLuiLf/bomiNIs187GwtrQT.',3,1,1,0,NULL),(6,'Ahmed','Al Senousy','Alsenosy15@gmail.com','ahmedalsenosy','$2a$12$OOrtR196AyUpFmpqs6/IoeIFCNWZTXQKi14hKuDo9UDw99m1lOIfa',4,1,1,0,NULL),(7,'Hassan','Emam','hassan@emam.me','h.emam','$2a$12$yv2K1EwHUiGssUnotS4iQO6g3qIJE6fvctkEwU0VGcuvzIx3o7gMq',5,1,1,0,NULL),(8,'Sherif','Attallah','sherif111@hotmail.com','sherifattallah','$2a$12$qKi0TCMCKzwdR305lQDPMOegs5eb5h.xf4QqGNBU8CSJDKoWM6akO',6,1,1,0,NULL),(9,'Mohamed','Abdelaal','md_mike@hotmail.com','mido','$2a$12$HCLQ1Iijx8TiYjjuHPO9KuUiN5zsHBkN/6lIDwTZkcR5nR.qvuEBq',7,1,1,0,NULL),(14,'Sherif','Mahmoud','smahmoud@live.com','smahmoud','$2a$12$lpMMx1VzPIFraRxLC/8fYeUs5gM1Bid.umX/UWLEvnkihgYO2F1oK',10,1,1,0,NULL),(15,'Hassan','Emam','dr.hemam@yahoo.co.uk','khabini','$2a$12$ucZYvdWCLEv5YEoa/2EaiOG/nHgD7dDASnU0pZVzqXZ9XhwoLnEcO',11,1,1,0,NULL),(16,'Saleh','Mubarak','cpmxpert@gmail.com','smubarak','$2a$12$a0Ia.K64SKZfueiQ9.w.GuwePl1OzNYQvjwJRi8kA3etX6Cpg.fpy',12,1,1,0,NULL),(17,'Amr','Megahed','amrsmegahed@gmail.com','asmegahed','$2a$12$828ulGHY.wzi2jbhdlzdBeZeeiUBgi2qto9B.HT9.UplfvTl2KLeO',13,1,1,0,NULL),(18,'Jorge','Cuevas','jcuevas@vyv-dsd.cl','jorgecuevas','$2a$12$/BuZtRirrwezTff.jrB1KO3UOwJRCQJr37eroU6sXFKdg5VSMGiom',14,1,1,0,NULL),(19,'Mohamed','Elkaddah','elkaddah@gmail.com','Elkaddah','$2a$12$JyCtPvsZxdIKBikEJOWI7..GmWgcTig8Y/IzW72pmTYLjOjKmQzra',15,1,1,0,NULL),(20,'Paras','Gandhi','parasmgandhi2005@gmail.com','pmgandhi','$2a$12$1aBmlZelOOZqyS979FEezeiQxaA5RaZewN82igKg.ac8Ql7W4msh.',16,1,1,0,NULL),(21,'Ansen','Wang','ansen.wang@139.com','awang','$2a$12$rY3AvkNQDgLjyMstKz4R0eJ43Cd2VnHGFrlqE7.O2oK1f5DH4bQgi',17,1,1,0,NULL),(22,'Talal','Houkan','engineertalal@gmail.com','engineertalal','$2a$12$ReFbpZdRzAd462beJmuwJeuBNe1wBIGDLGp2Qn4HE.Z3TrPc1S4Le',18,1,1,0,NULL),(23,'Tamer','Ellithy','tamerellithy@gmail.com','tamer_ellithy','$2a$12$pbP5o6Nexk0k1avbNKPMTObuu7tYH/uxckorkyNso.RB8GxfPlzKO',19,1,1,0,NULL),(24,'Yasser','Elewah ','en_yasser75@yahoo.com','yasserelewah ','$2a$12$AE5YtlPMt2on8G2zMMYKpu4ghrqgvBcLl09FAyx2/1y7H7op6YFUu',20,1,1,0,NULL),(25,'Ahmed','Gendy','Ahmed.gendy@live.com','gendy','$2a$12$6SdXXvCIrdrpX.wT3MdJqeEzw8AYHYyCuqki02Xr9xC864LD64EZy',21,1,1,0,NULL),(26,'Khalid','Ghazi','engkhalidghazi@gmail.com','ghazi84','$2a$12$eV8JKL.Q48bQJE1ah30yBuakSFg1fYeN2VcKUSVxhvdFZRNNbFDa2',22,1,1,0,NULL),(27,'Mahmoud','Abuelkhair','mah_asl2010@hotmail.com','mahmoudasal','$2a$12$b/9wqwflcJYxRFUO.Kvkvu64EhWXHgUDLg8GXs9Qsc3MFoniu/e0i',23,1,1,0,NULL),(28,'Khaled','Amarneh','amarneh@hotmail.com','amarneh87','$2a$12$OqnZ.WT8zTOM0SF.b1Z9C.HdioZxfMv4DGhol06tNYk/n5zMSxgAy',24,1,1,0,NULL),(29,'Kareem','Mohamed','Kareem.mohamed@inertiaegypt.com','karimmohmed','$2a$12$Vw9gygKA9ZhICfmix/8pTOZsVG28.9LMTfw7X/ex8NqOZsEDwIoqi',25,1,1,0,NULL),(30,'Ahmed','Sabry','ahmed.elshawesh@gmail.com','ahmed.elshawesh','$2a$12$ulS6I1wTEKtKGDKsL/rCDOp7fCGlwc5W/mUFEmErlAN4q0N82XzRW',26,1,1,0,NULL),(31,'Ahmed ','Fouad','a.fouad@archirodon.net','ahmedfouad','$2a$12$MiKdgdwni2m3d2rZs8UlGuxcg/s1Gi4P/MTgyC.q6Ae3RuTsa8G..',27,1,1,0,NULL),(32,'Mohammed','Abdul Hady','abouahia@hotmail.com','aboyahia','$2a$12$Qb44/h1SCNAcRpRmfHjAKeBYA1K1Zqjds1DTykrDT2rKqfTySI6EC',28,1,1,0,NULL),(33,'Hassan','Emam','hemam@logikalprojects.com','hemam','$2a$12$wYDARmXccu0I1tZc4WMVP.QyH5fLn5sfL9oZrDVBOZ925glLUxps.',29,1,1,0,NULL),(34,'Chris','Burr','cburr@logikalprojects.com','cburr','$2a$12$PCJs81l9srDF8.Buj3fXsOLYQR3O7ctihkGSxr.s3qi2uCXbDO726',29,1,1,0,NULL),(35,'Mohamed','Helmy','eng.m.helmy@live.com','M.helmy','$2a$12$UMt9Rx9wb2kddJlkmaEG5esUUvFe9tjtUTSScI0q13j30yT9opxzm',30,1,1,0,NULL),(36,'Ashraf','Ibrahim','ashrafnabil18@hotmail.com','ashraf','$2a$12$JPoXXOxySZMtdL0TVeQRoOEy6JDeQfZ4lRZYE7657XnBL9NuouMri',31,1,1,0,NULL),(37,'Mohamed','Sobhy','m_shoir@yahoo.com','m_shoir','$2a$12$YdIVg5hKzAJgFwU3lv6V0.Bl1sdeL.uDXIduvQSip6TFWOhJ1i04S',32,1,1,0,NULL),(38,'Sherif','Rouby','sherif_rouby@yahoo.com','srouby','$2a$12$xYojM1.JV.afYhnhz0IjOOedfuCW34uqPhM20LfmMh3ALCot2jOi.',33,1,1,0,NULL),(39,'Hatem','Hejazi','hh33@hw.ac.uk','enghtm','$2a$12$LmwSjsu30pd8CRG6be6Tvu4pzbDT5iJK7jsVj4rroiveZ8/5XY5ly',34,1,1,0,NULL),(40,'Muhammad','Taffazal','Taffazal@gmail.com','Taffazal','$2a$12$45A7jxRhdy9/oTvvAseAROoHJX26tt7QuYwXQ//qTcw5.dRIDncJS',35,1,1,0,NULL),(41,'Rana','Imran','rimrany@gmail.com','rimrany','$2a$12$EG7EohsG.emQpvvS2eKaY.7Eqt.RJa6Cfu.WmAED7rjdgQMEic/8G',36,1,1,0,NULL),(42,'Value','Engineering','Valueforconstruction@gmail.com','mf_12343','$2a$12$8iNqlXZIojIe3/PJAfIMSOgSot59viJvRBAAGsIsGvxTD5cvqcA4i',37,1,1,0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_log`
--

DROP TABLE IF EXISTS `users_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_log`
--

LOCK TABLES `users_log` WRITE;
/*!40000 ALTER TABLE `users_log` DISABLE KEYS */;
INSERT INTO `users_log` VALUES (1,1,'2017-06-07 21:11:27',1,NULL),(2,1,'2017-06-07 21:19:58',0,NULL),(3,7,'2017-06-07 21:20:44',0,NULL),(4,1,'2017-06-07 23:37:20',1,NULL),(5,7,'2017-06-07 23:38:48',1,'127.0.0.1'),(6,1,'2017-06-07 23:39:30',1,'127.0.0.1'),(7,7,'2017-06-07 23:45:12',0,'5.80.230.45'),(8,1,'2017-06-07 23:50:16',1,'213.205.252.58'),(9,1,'2017-06-08 08:02:56',1,'90.152.126.174'),(10,1,'2017-06-08 13:15:06',1,'90.152.126.174'),(11,1,'2017-06-08 17:05:26',1,'5.80.230.45'),(12,21,'2017-06-08 17:08:18',1,'5.80.230.45'),(13,22,'2017-06-08 19:46:05',1,'5.80.230.45'),(14,22,'2017-06-08 19:53:23',1,'37.211.196.159'),(15,1,'2017-06-08 20:39:57',1,'5.80.230.45'),(16,1,'2017-06-08 21:15:03',1,'5.80.230.45'),(17,1,'2017-06-08 21:15:57',1,'5.80.230.45'),(18,24,'2017-06-08 21:45:15',1,'5.80.230.45'),(19,1,'2017-06-08 22:19:36',1,'5.80.230.45'),(20,27,'2017-06-09 00:14:45',1,'5.80.230.45'),(21,27,'2017-06-09 00:19:51',1,'5.80.230.45'),(22,1,'2017-06-09 01:02:03',1,'5.80.230.45'),(23,30,'2017-06-09 01:15:09',1,'31.166.151.83'),(24,1,'2017-06-09 08:09:22',1,'90.152.126.174'),(25,20,'2017-06-09 08:10:08',1,'82.178.178.134'),(26,33,'2017-06-09 08:22:14',1,'90.152.126.174'),(27,34,'2017-06-09 08:23:29',1,'90.152.126.174'),(28,7,'2017-06-09 08:27:53',1,'90.152.126.174'),(29,35,'2017-06-09 09:49:06',1,'37.186.44.22'),(30,26,'2017-06-09 11:39:25',1,'178.80.96.114'),(31,1,'2017-06-09 16:18:00',1,'213.205.252.58'),(32,36,'2017-06-09 16:24:25',0,'5.80.230.45'),(33,36,'2017-06-09 16:24:35',1,'5.80.230.45'),(34,1,'2017-06-09 21:38:37',1,'5.80.230.45'),(35,39,'2017-06-09 21:43:26',1,'188.50.152.133'),(36,36,'2017-06-09 22:53:24',0,'94.204.77.217'),(37,36,'2017-06-09 22:53:50',1,'94.204.77.217'),(38,27,'2017-06-10 03:07:40',1,'95.184.62.165'),(39,27,'2017-06-10 03:08:25',1,'95.184.62.165'),(40,20,'2017-06-10 09:12:22',1,'5.80.230.45'),(41,30,'2017-06-10 09:14:09',1,'5.80.230.45'),(42,1,'2017-06-10 13:22:20',1,'5.80.230.45'),(43,42,'2017-06-10 13:27:41',1,'197.52.224.5'),(44,1,'2017-06-10 14:34:22',1,'5.80.230.45'),(45,7,'2017-06-10 19:08:15',0,'5.80.230.45'),(46,7,'2017-06-10 19:08:23',1,'5.80.230.45'),(47,41,'2017-06-10 19:28:11',1,'184.151.222.131'),(48,1,'2017-06-11 02:49:43',1,'5.80.230.45'),(49,29,'2017-06-11 10:34:49',1,'197.246.71.250'),(50,1,'2017-06-11 21:07:13',1,'151.228.188.64'),(51,1,'2017-06-12 09:16:08',1,'90.152.126.174'),(52,7,'2017-06-12 09:37:56',1,'90.152.126.174'),(53,34,'2017-06-12 10:44:58',1,'212.44.21.196'),(54,1,'2017-06-12 15:05:39',1,'90.152.126.174'),(55,5,'2017-06-12 15:23:09',1,'195.59.159.33'),(56,5,'2017-06-12 15:59:09',1,'90.152.126.174'),(57,5,'2017-06-12 16:20:19',0,'195.59.159.33'),(58,5,'2017-06-12 16:20:36',1,'195.59.159.33'),(59,1,'2017-06-12 16:23:29',1,'90.152.126.174'),(60,5,'2017-06-12 16:41:16',1,'195.59.159.33'),(61,1,'2017-06-12 16:47:27',1,'213.205.252.53'),(62,1,'2017-06-12 17:33:09',1,'5.80.230.45'),(63,1,'2017-06-12 17:46:24',1,'167.114.101.64'),(64,1,'2017-06-12 19:32:52',1,'5.80.230.45'),(65,5,'2017-06-12 19:39:25',1,'5.80.230.45'),(66,1,'2017-06-12 19:52:42',1,'5.80.230.45'),(67,5,'2017-06-12 19:59:07',1,'5.80.230.45'),(68,5,'2017-06-12 20:01:35',1,'5.80.230.45'),(69,1,'2017-06-12 20:10:56',1,'5.80.230.45'),(70,5,'2017-06-12 20:11:10',0,'5.80.230.45'),(71,5,'2017-06-12 20:11:20',1,'5.80.230.45'),(72,1,'2017-06-12 20:12:12',1,'5.80.230.45');
/*!40000 ALTER TABLE `users_log` ENABLE KEYS */;
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
  `id` int(11) NOT NULL,
  PRIMARY KEY (`wwp_id`,`task_id`),
  UNIQUE KEY `uix_wwpd` (`wwp_id`,`task_id`),
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
INSERT INTO `wwp_details` VALUES (1,1,1,1,1,1,0,0,0,0,1,1,1,NULL,0),(1,2,1,0,0,1,1,1,0,0,1,1,1,NULL,0),(2,3,1,1,1,1,0,0,0,0,1,1,1,NULL,0),(2,4,1,0,1,1,1,0,0,0,0,1,1,2,0),(3,5,1,1,1,1,0,0,0,0,1,1,1,NULL,0),(3,6,1,0,1,1,1,0,0,0,0,1,1,8,0),(4,7,1,0,0,0,0,0,0,0,1,1,1,NULL,0),(4,8,2,0,0,0,0,0,0,0,0,1,1,13,0),(4,9,2,0,0,0,0,0,0,0,1,1,1,NULL,0),(5,10,7,1,1,1,0,0,0,0,0,1,1,16,0),(5,11,7,0,1,1,1,1,0,0,1,1,1,NULL,0),(7,18,7,1,1,1,0,0,0,0,1,1,1,NULL,0),(7,19,7,0,0,1,1,0,0,0,0,1,1,16,0),(8,20,7,0,0,1,1,0,0,0,1,1,1,16,0),(8,21,7,1,1,1,0,0,0,0,1,1,1,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wwps`
--

LOCK TABLES `wwps` WRITE;
/*!40000 ALTER TABLE `wwps` DISABLE KEYS */;
INSERT INTO `wwps` VALUES (1,1,1,1,1,1,1),(2,1,1,2,0.5,1,1),(3,1,2,1,0.5,1,1),(4,1,3,1,0.666667,1,1),(5,3,212,4,0.5,1,1),(6,5,397,5,NULL,1,0),(7,3,213,4,0.5,1,1),(8,3,214,4,1,1,1),(9,9,847,13,NULL,1,0);
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

-- Dump completed on 2017-06-12 20:13:54
