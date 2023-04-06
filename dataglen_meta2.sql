-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: dataglen_meta2
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `action_actionfield`
--

DROP TABLE IF EXISTS `action_actionfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `action_actionfield` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `streamDataType` varchar(20) NOT NULL,
  `streamDateTimeFormat` varchar(20) NOT NULL,
  `streamPositionInCSV` int DEFAULT NULL,
  `streamDataUnit` varchar(20) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `source_id` varchar(43) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_actionfield_source_id_name_eae0f5a4_uniq` (`source_id`,`name`),
  UNIQUE KEY `action_actionfield_source_id_streamPositionInCSV_bdaebc83_uniq` (`source_id`,`streamPositionInCSV`),
  CONSTRAINT `action_actionfield_source_id_9e027686_fk_dataglen_` FOREIGN KEY (`source_id`) REFERENCES `dataglen_sensor` (`sourceKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `action_actionfield`
--

LOCK TABLES `action_actionfield` WRITE;
/*!40000 ALTER TABLE `action_actionfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `action_actionfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add site',7,'add_site'),(26,'Can change site',7,'change_site'),(27,'Can delete site',7,'delete_site'),(28,'Can view site',7,'view_site'),(29,'Can add email address',8,'add_emailaddress'),(30,'Can change email address',8,'change_emailaddress'),(31,'Can delete email address',8,'delete_emailaddress'),(32,'Can view email address',8,'view_emailaddress'),(33,'Can add email confirmation',9,'add_emailconfirmation'),(34,'Can change email confirmation',9,'change_emailconfirmation'),(35,'Can delete email confirmation',9,'delete_emailconfirmation'),(36,'Can view email confirmation',9,'view_emailconfirmation'),(37,'Can add social account',10,'add_socialaccount'),(38,'Can change social account',10,'change_socialaccount'),(39,'Can delete social account',10,'delete_socialaccount'),(40,'Can view social account',10,'view_socialaccount'),(41,'Can add social application',11,'add_socialapp'),(42,'Can change social application',11,'change_socialapp'),(43,'Can delete social application',11,'delete_socialapp'),(44,'Can view social application',11,'view_socialapp'),(45,'Can add social application token',12,'add_socialtoken'),(46,'Can change social application token',12,'change_socialtoken'),(47,'Can delete social application token',12,'delete_socialtoken'),(48,'Can view social application token',12,'view_socialtoken'),(49,'Can add organization',13,'add_organization'),(50,'Can change organization',13,'change_organization'),(51,'Can delete organization',13,'delete_organization'),(52,'Can view organization',13,'view_organization'),(53,'Can add organization owner',14,'add_organizationowner'),(54,'Can change organization owner',14,'change_organizationowner'),(55,'Can delete organization owner',14,'delete_organizationowner'),(56,'Can view organization owner',14,'view_organizationowner'),(57,'Can add organization user',15,'add_organizationuser'),(58,'Can change organization user',15,'change_organizationuser'),(59,'Can delete organization user',15,'delete_organizationuser'),(60,'Can view organization user',15,'view_organizationuser'),(61,'Can add organization invitation',16,'add_organizationinvitation'),(62,'Can change organization invitation',16,'change_organizationinvitation'),(63,'Can delete organization invitation',16,'delete_organizationinvitation'),(64,'Can view organization invitation',16,'view_organizationinvitation'),(65,'Can add beta request',17,'add_betarequest'),(66,'Can change beta request',17,'change_betarequest'),(67,'Can delete beta request',17,'delete_betarequest'),(68,'Can view beta request',17,'view_betarequest'),(69,'Can add dashboard',18,'add_dashboard'),(70,'Can change dashboard',18,'change_dashboard'),(71,'Can delete dashboard',18,'delete_dashboard'),(72,'Can view dashboard',18,'view_dashboard'),(73,'Allowed to access client view of this dashboard',18,'client_view'),(74,'Allowed to access employee view of this dashboard',18,'employee_view'),(75,'Allowed to access group view of this dashboard',18,'group_view'),(76,'This employee is allowed to create groups of this dashboard',18,'can_create_groups'),(77,'Can add organization',19,'add_dataglenclient'),(78,'Can change organization',19,'change_dataglenclient'),(79,'Can delete organization',19,'delete_dataglenclient'),(80,'Can view organization',19,'view_dataglenclient'),(81,'Can add organization',20,'add_dataglengroup'),(82,'Can change organization',20,'change_dataglengroup'),(83,'Can delete organization',20,'delete_dataglengroup'),(84,'Can view organization',20,'view_dataglengroup'),(85,'Can add sensor',21,'add_sensor'),(86,'Can change sensor',21,'change_sensor'),(87,'Can delete sensor',21,'delete_sensor'),(88,'Can view sensor',21,'view_sensor'),(89,'Can add sensor group',22,'add_sensorgroup'),(90,'Can change sensor group',22,'change_sensorgroup'),(91,'Can delete sensor group',22,'delete_sensorgroup'),(92,'Can view sensor group',22,'view_sensorgroup'),(93,'Can add field',23,'add_field'),(94,'Can change field',23,'change_field'),(95,'Can delete field',23,'delete_field'),(96,'Can view field',23,'view_field'),(97,'Can add Token',24,'add_token'),(98,'Can change Token',24,'change_token'),(99,'Can delete Token',24,'delete_token'),(100,'Can view Token',24,'view_token'),(101,'Can add token',25,'add_tokenproxy'),(102,'Can change token',25,'change_tokenproxy'),(103,'Can delete token',25,'delete_tokenproxy'),(104,'Can view token',25,'view_tokenproxy'),(105,'Can add comment',26,'add_comment'),(106,'Can change comment',26,'change_comment'),(107,'Can delete comment',26,'delete_comment'),(108,'Can view comment',26,'view_comment'),(109,'Can moderate comments',26,'can_moderate'),(110,'Can add comment flag',27,'add_commentflag'),(111,'Can change comment flag',27,'change_commentflag'),(112,'Can delete comment flag',27,'delete_commentflag'),(113,'Can view comment flag',27,'view_commentflag'),(114,'Can add group object permission',28,'add_groupobjectpermission'),(115,'Can change group object permission',28,'change_groupobjectpermission'),(116,'Can delete group object permission',28,'delete_groupobjectpermission'),(117,'Can view group object permission',28,'view_groupobjectpermission'),(118,'Can add user object permission',29,'add_userobjectpermission'),(119,'Can change user object permission',29,'change_userobjectpermission'),(120,'Can delete user object permission',29,'delete_userobjectpermission'),(121,'Can view user object permission',29,'view_userobjectpermission'),(122,'Can add action field',30,'add_actionfield'),(123,'Can change action field',30,'change_actionfield'),(124,'Can delete action field',30,'delete_actionfield'),(125,'Can view action field',30,'view_actionfield'),(126,'Can add config field',31,'add_configfield'),(127,'Can change config field',31,'change_configfield'),(128,'Can delete config field',31,'delete_configfield'),(129,'Can view config field',31,'view_configfield'),(130,'Can add error field',32,'add_errorfield'),(131,'Can change error field',32,'change_errorfield'),(132,'Can delete error field',32,'delete_errorfield'),(133,'Can view error field',32,'view_errorfield'),(134,'Can add ajb',33,'add_ajb'),(135,'Can change ajb',33,'change_ajb'),(136,'Can delete ajb',33,'delete_ajb'),(137,'Can view ajb',33,'view_ajb'),(138,'Can add energy meter',34,'add_energymeter'),(139,'Can change energy meter',34,'change_energymeter'),(140,'Can delete energy meter',34,'delete_energymeter'),(141,'Can view energy meter',34,'view_energymeter'),(142,'Can add feeder',35,'add_feeder'),(143,'Can change feeder',35,'change_feeder'),(144,'Can delete feeder',35,'delete_feeder'),(145,'Can view feeder',35,'view_feeder'),(146,'Can add gateway source',36,'add_gatewaysource'),(147,'Can change gateway source',36,'change_gatewaysource'),(148,'Can delete gateway source',36,'delete_gatewaysource'),(149,'Can view gateway source',36,'view_gatewaysource'),(150,'Can add independent inverter',37,'add_independentinverter'),(151,'Can change independent inverter',37,'change_independentinverter'),(152,'Can delete independent inverter',37,'delete_independentinverter'),(153,'Can view independent inverter',37,'view_independentinverter'),(154,'Can add inverter',38,'add_inverter'),(155,'Can change inverter',38,'change_inverter'),(156,'Can delete inverter',38,'delete_inverter'),(157,'Can view inverter',38,'view_inverter'),(158,'Can add io sensor field',39,'add_iosensorfield'),(159,'Can change io sensor field',39,'change_iosensorfield'),(160,'Can delete io sensor field',39,'delete_iosensorfield'),(161,'Can view io sensor field',39,'view_iosensorfield'),(162,'Can add mppt',40,'add_mppt'),(163,'Can change mppt',40,'change_mppt'),(164,'Can delete mppt',40,'delete_mppt'),(165,'Can view mppt',40,'view_mppt'),(166,'Can add plant meta source',41,'add_plantmetasource'),(167,'Can change plant meta source',41,'change_plantmetasource'),(168,'Can delete plant meta source',41,'delete_plantmetasource'),(169,'Can view plant meta source',41,'view_plantmetasource'),(170,'Can add solar error field',42,'add_solarerrorfield'),(171,'Can change solar error field',42,'change_solarerrorfield'),(172,'Can delete solar error field',42,'delete_solarerrorfield'),(173,'Can view solar error field',42,'view_solarerrorfield'),(174,'Can add solar field',43,'add_solarfield'),(175,'Can change solar field',43,'change_solarfield'),(176,'Can delete solar field',43,'delete_solarfield'),(177,'Can view solar field',43,'view_solarfield'),(178,'Can add solar group',44,'add_solargroup'),(179,'Can change solar group',44,'change_solargroup'),(180,'Can delete solar group',44,'delete_solargroup'),(181,'Can view solar group',44,'view_solargroup'),(182,'Can add organization',45,'add_solarplant'),(183,'Can change organization',45,'change_solarplant'),(184,'Can delete organization',45,'delete_solarplant'),(185,'Can view organization',45,'view_solarplant'),(186,'Can add weather station',46,'add_weatherstation'),(187,'Can change weather station',46,'change_weatherstation'),(188,'Can delete weather station',46,'delete_weatherstation'),(189,'Can view weather station',46,'view_weatherstation'),(190,'Can add virtual gateway',47,'add_virtualgateway'),(191,'Can change virtual gateway',47,'change_virtualgateway'),(192,'Can delete virtual gateway',47,'delete_virtualgateway'),(193,'Can view virtual gateway',47,'view_virtualgateway'),(194,'Can add transformer',48,'add_transformer'),(195,'Can change transformer',48,'change_transformer'),(196,'Can delete transformer',48,'delete_transformer'),(197,'Can view transformer',48,'view_transformer'),(198,'Can add solar section',49,'add_solarsection'),(199,'Can change solar section',49,'change_solarsection'),(200,'Can delete solar section',49,'delete_solarsection'),(201,'Can view solar section',49,'view_solarsection'),(202,'Can add solar metrics',50,'add_solarmetrics'),(203,'Can change solar metrics',50,'change_solarmetrics'),(204,'Can delete solar metrics',50,'delete_solarmetrics'),(205,'Can view solar metrics',50,'view_solarmetrics'),(206,'Can add plant features enable',51,'add_plantfeaturesenable'),(207,'Can change plant features enable',51,'change_plantfeaturesenable'),(208,'Can delete plant features enable',51,'delete_plantfeaturesenable'),(209,'Can view plant features enable',51,'view_plantfeaturesenable'),(210,'Can add plant contract details',52,'add_plantcontractdetails'),(211,'Can change plant contract details',52,'change_plantcontractdetails'),(212,'Can delete plant contract details',52,'delete_plantcontractdetails'),(213,'Can view plant contract details',52,'view_plantcontractdetails'),(214,'Can add panels string',53,'add_panelsstring'),(215,'Can change panels string',53,'change_panelsstring'),(216,'Can delete panels string',53,'delete_panelsstring'),(217,'Can view panels string',53,'view_panelsstring'),(218,'Can add inverter error codes',54,'add_invertererrorcodes'),(219,'Can change inverter error codes',54,'change_invertererrorcodes'),(220,'Can delete inverter error codes',54,'delete_invertererrorcodes'),(221,'Can view inverter error codes',54,'view_invertererrorcodes'),(222,'Can add client contents enable',55,'add_clientcontentsenable'),(223,'Can change client contents enable',55,'change_clientcontentsenable'),(224,'Can delete client contents enable',55,'delete_clientcontentsenable'),(225,'Can view client contents enable',55,'view_clientcontentsenable'),(226,'Can add cleaning trigger',56,'add_cleaningtrigger'),(227,'Can change cleaning trigger',56,'change_cleaningtrigger'),(228,'Can delete cleaning trigger',56,'delete_cleaningtrigger'),(229,'Can view cleaning trigger',56,'view_cleaningtrigger'),(230,'Can add aggregated independent inverter',57,'add_aggregatedindependentinverter'),(231,'Can change aggregated independent inverter',57,'change_aggregatedindependentinverter'),(232,'Can delete aggregated independent inverter',57,'delete_aggregatedindependentinverter'),(233,'Can view aggregated independent inverter',57,'view_aggregatedindependentinverter'),(234,'Can add transformer status mappings',58,'add_transformerstatusmappings'),(235,'Can change transformer status mappings',58,'change_transformerstatusmappings'),(236,'Can delete transformer status mappings',58,'delete_transformerstatusmappings'),(237,'Can view transformer status mappings',58,'view_transformerstatusmappings'),(238,'Can add pv watt',59,'add_pvwatt'),(239,'Can change pv watt',59,'change_pvwatt'),(240,'Can delete pv watt',59,'delete_pvwatt'),(241,'Can view pv watt',59,'view_pvwatt'),(242,'Can add pv syst info',60,'add_pvsystinfo'),(243,'Can change pv syst info',60,'change_pvsystinfo'),(244,'Can delete pv syst info',60,'delete_pvsystinfo'),(245,'Can view pv syst info',60,'view_pvsystinfo'),(246,'Can add meter status mappings',61,'add_meterstatusmappings'),(247,'Can change meter status mappings',61,'change_meterstatusmappings'),(248,'Can delete meter status mappings',61,'delete_meterstatusmappings'),(249,'Can view meter status mappings',61,'view_meterstatusmappings'),(250,'Can add inverter status mappings',62,'add_inverterstatusmappings'),(251,'Can change inverter status mappings',62,'change_inverterstatusmappings'),(252,'Can delete inverter status mappings',62,'delete_inverterstatusmappings'),(253,'Can view inverter status mappings',62,'view_inverterstatusmappings'),(254,'Can add ajb status mappings',63,'add_ajbstatusmappings'),(255,'Can change ajb status mappings',63,'change_ajbstatusmappings'),(256,'Can delete ajb status mappings',63,'delete_ajbstatusmappings'),(257,'Can view ajb status mappings',63,'view_ajbstatusmappings'),(258,'Can add tag',64,'add_tag'),(259,'Can change tag',64,'change_tag'),(260,'Can delete tag',64,'delete_tag'),(261,'Can view tag',64,'view_tag'),(262,'Can add tagged item',65,'add_taggeditem'),(263,'Can change tagged item',65,'change_taggeditem'),(264,'Can delete tagged item',65,'delete_taggeditem'),(265,'Can view tagged item',65,'view_taggeditem'),(266,'Can add file path',66,'add_filepath'),(267,'Can change file path',66,'change_filepath'),(268,'Can delete file path',66,'delete_filepath'),(269,'Can view file path',66,'view_filepath'),(270,'Can add user configuration',67,'add_userconfiguration'),(271,'Can change user configuration',67,'change_userconfiguration'),(272,'Can delete user configuration',67,'delete_userconfiguration'),(273,'Can view user configuration',67,'view_userconfiguration'),(274,'Can add widget instance',68,'add_widgetinstance'),(275,'Can change widget instance',68,'change_widgetinstance'),(276,'Can delete widget instance',68,'delete_widgetinstance'),(277,'Can view widget instance',68,'view_widgetinstance'),(278,'Can add base event association',69,'add_baseeventassociation'),(279,'Can change base event association',69,'change_baseeventassociation'),(280,'Can delete base event association',69,'delete_baseeventassociation'),(281,'Can view base event association',69,'view_baseeventassociation'),(282,'Can add Custom field',70,'add_customfield'),(283,'Can change Custom field',70,'change_customfield'),(284,'Can delete Custom field',70,'delete_customfield'),(285,'Can view Custom field',70,'view_customfield'),(286,'Can add e-mail template',71,'add_emailtemplate'),(287,'Can change e-mail template',71,'change_emailtemplate'),(288,'Can delete e-mail template',71,'delete_emailtemplate'),(289,'Can view e-mail template',71,'view_emailtemplate'),(290,'Can add Follow-up',72,'add_followup'),(291,'Can change Follow-up',72,'change_followup'),(292,'Can delete Follow-up',72,'delete_followup'),(293,'Can view Follow-up',72,'view_followup'),(294,'Can add Knowledge base category',73,'add_kbcategory'),(295,'Can change Knowledge base category',73,'change_kbcategory'),(296,'Can delete Knowledge base category',73,'delete_kbcategory'),(297,'Can view Knowledge base category',73,'view_kbcategory'),(298,'Can add Queue',74,'add_queue'),(299,'Can change Queue',74,'change_queue'),(300,'Can delete Queue',74,'delete_queue'),(301,'Can view Queue',74,'view_queue'),(302,'Can add Ticket',75,'add_ticket'),(303,'Can change Ticket',75,'change_ticket'),(304,'Can delete Ticket',75,'delete_ticket'),(305,'Can view Ticket',75,'view_ticket'),(306,'Can add User Setting',76,'add_usersettings'),(307,'Can change User Setting',76,'change_usersettings'),(308,'Can delete User Setting',76,'delete_usersettings'),(309,'Can view User Setting',76,'view_usersettings'),(310,'Can add Ticket custom field value',77,'add_ticketcustomfieldvalue'),(311,'Can change Ticket custom field value',77,'change_ticketcustomfieldvalue'),(312,'Can delete Ticket custom field value',77,'delete_ticketcustomfieldvalue'),(313,'Can view Ticket custom field value',77,'view_ticketcustomfieldvalue'),(314,'Can add Ticket change',78,'add_ticketchange'),(315,'Can change Ticket change',78,'change_ticketchange'),(316,'Can delete Ticket change',78,'delete_ticketchange'),(317,'Can view Ticket change',78,'view_ticketchange'),(318,'Can add ticket cc',79,'add_ticketcc'),(319,'Can change ticket cc',79,'change_ticketcc'),(320,'Can delete ticket cc',79,'delete_ticketcc'),(321,'Can view ticket cc',79,'view_ticketcc'),(322,'Can add ticket association',80,'add_ticketassociation'),(323,'Can change ticket association',80,'change_ticketassociation'),(324,'Can delete ticket association',80,'delete_ticketassociation'),(325,'Can view ticket association',80,'view_ticketassociation'),(326,'Can add Saved search',81,'add_savedsearch'),(327,'Can change Saved search',81,'change_savedsearch'),(328,'Can delete Saved search',81,'delete_savedsearch'),(329,'Can view Saved search',81,'view_savedsearch'),(330,'Can add Pre-set reply',82,'add_presetreply'),(331,'Can change Pre-set reply',82,'change_presetreply'),(332,'Can delete Pre-set reply',82,'delete_presetreply'),(333,'Can view Pre-set reply',82,'view_presetreply'),(334,'Can add Knowledge base item',83,'add_kbitem'),(335,'Can change Knowledge base item',83,'change_kbitem'),(336,'Can delete Knowledge base item',83,'delete_kbitem'),(337,'Can view Knowledge base item',83,'view_kbitem'),(338,'Can add Ignored e-mail address',84,'add_ignoreemail'),(339,'Can change Ignored e-mail address',84,'change_ignoreemail'),(340,'Can delete Ignored e-mail address',84,'delete_ignoreemail'),(341,'Can view Ignored e-mail address',84,'view_ignoreemail'),(342,'Can add Escalation exclusion',85,'add_escalationexclusion'),(343,'Can change Escalation exclusion',85,'change_escalationexclusion'),(344,'Can delete Escalation exclusion',85,'delete_escalationexclusion'),(345,'Can view Escalation exclusion',85,'view_escalationexclusion'),(346,'Can add Attachment',86,'add_attachment'),(347,'Can change Attachment',86,'change_attachment'),(348,'Can delete Attachment',86,'delete_attachment'),(349,'Can view Attachment',86,'view_attachment'),(350,'Can add Ticket dependency',87,'add_ticketdependency'),(351,'Can change Ticket dependency',87,'change_ticketdependency'),(352,'Can delete Ticket dependency',87,'delete_ticketdependency'),(353,'Can view Ticket dependency',87,'view_ticketdependency'),(354,'Can add sla definition',88,'add_sladefinition'),(355,'Can change sla definition',88,'change_sladefinition'),(356,'Can delete sla definition',88,'delete_sladefinition'),(357,'Can view sla definition',88,'view_sladefinition'),(358,'Can add analytics association',89,'add_analyticsassociation'),(359,'Can change analytics association',89,'change_analyticsassociation'),(360,'Can delete analytics association',89,'delete_analyticsassociation'),(361,'Can view analytics association',89,'view_analyticsassociation'),(362,'Can add alarm association',90,'add_alarmassociation'),(363,'Can change alarm association',90,'change_alarmassociation'),(364,'Can delete alarm association',90,'delete_alarmassociation'),(365,'Can view alarm association',90,'view_alarmassociation'),(366,'Can add events',91,'add_events'),(367,'Can change events',91,'change_events'),(368,'Can delete events',91,'delete_events'),(369,'Can view events',91,'view_events'),(370,'Can add user event alerts preferences',92,'add_usereventalertspreferences'),(371,'Can change user event alerts preferences',92,'change_usereventalertspreferences'),(372,'Can delete user event alerts preferences',92,'delete_usereventalertspreferences'),(373,'Can view user event alerts preferences',92,'view_usereventalertspreferences'),(374,'Can add events config',93,'add_eventsconfig'),(375,'Can change events config',93,'change_eventsconfig'),(376,'Can delete events config',93,'delete_eventsconfig'),(377,'Can view events config',93,'view_eventsconfig'),(378,'Can add alert management',94,'add_alertmanagement'),(379,'Can change alert management',94,'change_alertmanagement'),(380,'Can delete alert management',94,'delete_alertmanagement'),(381,'Can view alert management',94,'view_alertmanagement'),(382,'Can add valid uid',95,'add_validuid'),(383,'Can change valid uid',95,'change_validuid'),(384,'Can delete valid uid',95,'delete_validuid'),(385,'Can view valid uid',95,'view_validuid'),(386,'Can add invite',96,'add_invite'),(387,'Can change invite',96,'change_invite'),(388,'Can delete invite',96,'delete_invite'),(389,'Can view invite',96,'view_invite'),(390,'Can add license',97,'add_license'),(391,'Can change license',97,'change_license'),(392,'Can delete license',97,'delete_license'),(393,'Can view license',97,'view_license'),(394,'Can add installation',98,'add_installation'),(395,'Can change installation',98,'change_installation'),(396,'Can delete installation',98,'delete_installation'),(397,'Can view installation',98,'view_installation'),(398,'Can add charge controller',99,'add_chargecontroller'),(399,'Can change charge controller',99,'change_chargecontroller'),(400,'Can delete charge controller',99,'delete_chargecontroller'),(401,'Can view charge controller',99,'view_chargecontroller'),(402,'Can add panel set',100,'add_panelset'),(403,'Can change panel set',100,'change_panelset'),(404,'Can delete panel set',100,'delete_panelset'),(405,'Can view panel set',100,'view_panelset'),(406,'Can add connected load',101,'add_connectedload'),(407,'Can change connected load',101,'change_connectedload'),(408,'Can delete connected load',101,'delete_connectedload'),(409,'Can view connected load',101,'view_connectedload'),(410,'Can add battery',102,'add_battery'),(411,'Can change battery',102,'change_battery'),(412,'Can delete battery',102,'delete_battery'),(413,'Can view battery',102,'view_battery'),(414,'Can add cycle',103,'add_cycle'),(415,'Can change cycle',103,'change_cycle'),(416,'Can delete cycle',103,'delete_cycle'),(417,'Can view cycle',103,'view_cycle'),(418,'Can add tasks',104,'add_tasks'),(419,'Can change tasks',104,'change_tasks'),(420,'Can delete tasks',104,'delete_tasks'),(421,'Can view tasks',104,'view_tasks'),(422,'Can add task item',105,'add_taskitem'),(423,'Can change task item',105,'change_taskitem'),(424,'Can delete task item',105,'delete_taskitem'),(425,'Can view task item',105,'view_taskitem'),(426,'Can add task association',106,'add_taskassociation'),(427,'Can change task association',106,'change_taskassociation'),(428,'Can delete task association',106,'delete_taskassociation'),(429,'Can view task association',106,'view_taskassociation'),(430,'Can add preferences',107,'add_preferences'),(431,'Can change preferences',107,'change_preferences'),(432,'Can delete preferences',107,'delete_preferences'),(433,'Can view preferences',107,'view_preferences'),(434,'Can add otp',108,'add_otp'),(435,'Can change otp',108,'change_otp'),(436,'Can delete otp',108,'delete_otp'),(437,'Can view otp',108,'view_otp'),(438,'Can add user role',109,'add_userrole'),(439,'Can change user role',109,'change_userrole'),(440,'Can delete user role',109,'delete_userrole'),(441,'Can view user role',109,'view_userrole'),(442,'Can add user role plants alerts preferences',110,'add_userroleplantsalertspreferences'),(443,'Can change user role plants alerts preferences',110,'change_userroleplantsalertspreferences'),(444,'Can delete user role plants alerts preferences',110,'delete_userroleplantsalertspreferences'),(445,'Can view user role plants alerts preferences',110,'view_userroleplantsalertspreferences'),(446,'Can add alerts category',111,'add_alertscategory'),(447,'Can change alerts category',111,'change_alertscategory'),(448,'Can delete alerts category',111,'delete_alertscategory'),(449,'Can view alerts category',111,'view_alertscategory'),(450,'Can add custom feature',112,'add_customfeature'),(451,'Can change custom feature',112,'change_customfeature'),(452,'Can delete custom feature',112,'delete_customfeature'),(453,'Can view custom feature',112,'view_customfeature'),(454,'Can add feature',113,'add_feature'),(455,'Can change feature',113,'change_feature'),(456,'Can delete feature',113,'delete_feature'),(457,'Can view feature',113,'view_feature'),(458,'Can add feature category',114,'add_featurecategory'),(459,'Can change feature category',114,'change_featurecategory'),(460,'Can delete feature category',114,'delete_featurecategory'),(461,'Can view feature category',114,'view_featurecategory'),(462,'Can add feature order',115,'add_featureorder'),(463,'Can change feature order',115,'change_featureorder'),(464,'Can delete feature order',115,'delete_featureorder'),(465,'Can view feature order',115,'view_featureorder'),(466,'Can add user table widgets config',116,'add_usertablewidgetsconfig'),(467,'Can change user table widgets config',116,'change_usertablewidgetsconfig'),(468,'Can delete user table widgets config',116,'delete_usertablewidgetsconfig'),(469,'Can view user table widgets config',116,'view_usertablewidgetsconfig'),(470,'Can add subscription plan',117,'add_subscriptionplan'),(471,'Can change subscription plan',117,'change_subscriptionplan'),(472,'Can delete subscription plan',117,'delete_subscriptionplan'),(473,'Can view subscription plan',117,'view_subscriptionplan'),(474,'Can add role access',118,'add_roleaccess'),(475,'Can change role access',118,'change_roleaccess'),(476,'Can delete role access',118,'delete_roleaccess'),(477,'Can view role access',118,'view_roleaccess'),(478,'Can add dg client subscription',119,'add_dgclientsubscription'),(479,'Can change dg client subscription',119,'change_dgclientsubscription'),(480,'Can delete dg client subscription',119,'delete_dgclientsubscription'),(481,'Can view dg client subscription',119,'view_dgclientsubscription'),(482,'Can add custom report format',120,'add_customreportformat'),(483,'Can change custom report format',120,'change_customreportformat'),(484,'Can delete custom report format',120,'delete_customreportformat'),(485,'Can view custom report format',120,'view_customreportformat'),(486,'Can add user solar plant widgets config',121,'add_usersolarplantwidgetsconfig'),(487,'Can change user solar plant widgets config',121,'change_usersolarplantwidgetsconfig'),(488,'Can delete user solar plant widgets config',121,'delete_usersolarplantwidgetsconfig'),(489,'Can view user solar plant widgets config',121,'view_usersolarplantwidgetsconfig'),(490,'Can add aggregation function',122,'add_aggregationfunction'),(491,'Can change aggregation function',122,'change_aggregationfunction'),(492,'Can delete aggregation function',122,'delete_aggregationfunction'),(493,'Can view aggregation function',122,'view_aggregationfunction'),(494,'Can add css template',123,'add_csstemplate'),(495,'Can change css template',123,'change_csstemplate'),(496,'Can delete css template',123,'delete_csstemplate'),(497,'Can view css template',123,'view_csstemplate'),(498,'Can add data analysis',124,'add_dataanalysis'),(499,'Can change data analysis',124,'change_dataanalysis'),(500,'Can delete data analysis',124,'delete_dataanalysis'),(501,'Can view data analysis',124,'view_dataanalysis'),(502,'Can add having clause',125,'add_havingclause'),(503,'Can change having clause',125,'change_havingclause'),(504,'Can delete having clause',125,'delete_havingclause'),(505,'Can view having clause',125,'view_havingclause'),(506,'Can add query option',126,'add_queryoption'),(507,'Can change query option',126,'change_queryoption'),(508,'Can delete query option',126,'delete_queryoption'),(509,'Can view query option',126,'view_queryoption'),(510,'Can add data slice',127,'add_dataslice'),(511,'Can change data slice',127,'change_dataslice'),(512,'Can delete data slice',127,'delete_dataslice'),(513,'Can view data slice',127,'view_dataslice'),(514,'Can add analysis dashboard',128,'add_analysisdashboard'),(515,'Can change analysis dashboard',128,'change_analysisdashboard'),(516,'Can delete analysis dashboard',128,'delete_analysisdashboard'),(517,'Can view analysis dashboard',128,'view_analysisdashboard'),(518,'Can add analysis configuration',129,'add_analysisconfiguration'),(519,'Can change analysis configuration',129,'change_analysisconfiguration'),(520,'Can delete analysis configuration',129,'delete_analysisconfiguration'),(521,'Can view analysis configuration',129,'view_analysisconfiguration'),(522,'Can add dg comment',130,'add_dgcomment'),(523,'Can change dg comment',130,'change_dgcomment'),(524,'Can delete dg comment',130,'delete_dgcomment'),(525,'Can view dg comment',130,'view_dgcomment'),(526,'Can add widget',131,'add_widget'),(527,'Can change widget',131,'change_widget'),(528,'Can delete widget',131,'delete_widget'),(529,'Can view widget',131,'view_widget'),(530,'Can add webdyn client',132,'add_webdynclient'),(531,'Can change webdyn client',132,'change_webdynclient'),(532,'Can delete webdyn client',132,'delete_webdynclient'),(533,'Can view webdyn client',132,'view_webdynclient'),(534,'Can add webdyn gateway',133,'add_webdyngateway'),(535,'Can change webdyn gateway',133,'change_webdyngateway'),(536,'Can delete webdyn gateway',133,'delete_webdyngateway'),(537,'Can view webdyn gateway',133,'view_webdyngateway'),(538,'Can add modbus device',134,'add_modbusdevice'),(539,'Can change modbus device',134,'change_modbusdevice'),(540,'Can delete modbus device',134,'delete_modbusdevice'),(541,'Can view modbus device',134,'view_modbusdevice'),(542,'Can add io device',135,'add_iodevice'),(543,'Can change io device',135,'change_iodevice'),(544,'Can delete io device',135,'delete_iodevice'),(545,'Can view io device',135,'view_iodevice'),(546,'Can add inverters device',136,'add_invertersdevice'),(547,'Can change inverters device',136,'change_invertersdevice'),(548,'Can delete inverters device',136,'delete_invertersdevice'),(549,'Can view inverters device',136,'view_invertersdevice');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'!TDr4SIStSK0V3OfBQsljqyAHkMasafxLGRuhDeR9',NULL,0,'AnonymousUser','','','',0,1,'2023-03-22 06:19:58.261012');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('2c090b4e9e002288f82d2e20fdcce0cdc3982c60','2023-03-22 06:19:58.265332',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_configfield`
--

DROP TABLE IF EXISTS `config_configfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_configfield` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `streamDataType` varchar(20) NOT NULL,
  `streamDateTimeFormat` varchar(20) NOT NULL,
  `streamPositionInCSV` int DEFAULT NULL,
  `streamDataUnit` varchar(20) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `source_id` varchar(43) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `config_configfield_source_id_name_bde58235_uniq` (`source_id`,`name`),
  UNIQUE KEY `config_configfield_source_id_streamPositionInCSV_edb21035_uniq` (`source_id`,`streamPositionInCSV`),
  CONSTRAINT `config_configfield_source_id_1ba8c997_fk_dataglen_` FOREIGN KEY (`source_id`) REFERENCES `dataglen_sensor` (`sourceKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_configfield`
--

LOCK TABLES `config_configfield` WRITE;
/*!40000 ALTER TABLE `config_configfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_configfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customwidgets_filepath`
--

DROP TABLE IF EXISTS `customwidgets_filepath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customwidgets_filepath` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `filepath` varchar(1000) NOT NULL,
  `default_x` int NOT NULL,
  `default_y` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customwidgets_filepath`
--

LOCK TABLES `customwidgets_filepath` WRITE;
/*!40000 ALTER TABLE `customwidgets_filepath` DISABLE KEYS */;
/*!40000 ALTER TABLE `customwidgets_filepath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customwidgets_userconfiguration`
--

DROP TABLE IF EXISTS `customwidgets_userconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customwidgets_userconfiguration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `configure` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `customwidgets_userconfiguration_user_id_54ae77c5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customwidgets_userconfiguration`
--

LOCK TABLES `customwidgets_userconfiguration` WRITE;
/*!40000 ALTER TABLE `customwidgets_userconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `customwidgets_userconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customwidgets_widgetinstance`
--

DROP TABLE IF EXISTS `customwidgets_widgetinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customwidgets_widgetinstance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `x` int NOT NULL,
  `y` int NOT NULL,
  `width` int NOT NULL,
  `height` int NOT NULL,
  `name` varchar(1000) NOT NULL,
  `configuration_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customwidgets_widget_configuration_id_17dd922a_fk_customwid` (`configuration_id`),
  CONSTRAINT `customwidgets_widget_configuration_id_17dd922a_fk_customwid` FOREIGN KEY (`configuration_id`) REFERENCES `customwidgets_userconfiguration` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customwidgets_widgetinstance`
--

LOCK TABLES `customwidgets_widgetinstance` WRITE;
/*!40000 ALTER TABLE `customwidgets_widgetinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `customwidgets_widgetinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboards_dashboard`
--

DROP TABLE IF EXISTS `dashboards_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboards_dashboard` (
  `organization_ptr_id` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  `allowGroups` tinyint(1) NOT NULL,
  `ownerViewURL` varchar(50) NOT NULL,
  `employeeViewURL` varchar(50) NOT NULL,
  `groupViewURL` varchar(50) NOT NULL,
  PRIMARY KEY (`organization_ptr_id`),
  CONSTRAINT `dashboards_dashboard_organization_ptr_id_1a55b1e6_fk_organizat` FOREIGN KEY (`organization_ptr_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboards_dashboard`
--

LOCK TABLES `dashboards_dashboard` WRITE;
/*!40000 ALTER TABLE `dashboards_dashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboards_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboards_dataglenclient`
--

DROP TABLE IF EXISTS `dashboards_dataglenclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboards_dataglenclient` (
  `organization_ptr_id` int NOT NULL,
  `clientWebsite` varchar(200) NOT NULL,
  `clientLogo` varchar(200) DEFAULT NULL,
  `clientMobileLogo` varchar(200) DEFAULT NULL,
  `clientDomain` varchar(50) DEFAULT NULL,
  `clientContactAddress` varchar(254) DEFAULT NULL,
  `canCreateGroups` tinyint(1) NOT NULL,
  `webdynClient` tinyint(1) NOT NULL,
  `clientDashboard_id` int NOT NULL,
  PRIMARY KEY (`organization_ptr_id`),
  KEY `dashboards_dataglenc_clientDashboard_id_a11a2c8b_fk_dashboard` (`clientDashboard_id`),
  CONSTRAINT `dashboards_dataglenc_clientDashboard_id_a11a2c8b_fk_dashboard` FOREIGN KEY (`clientDashboard_id`) REFERENCES `dashboards_dashboard` (`organization_ptr_id`),
  CONSTRAINT `dashboards_dataglenc_organization_ptr_id_b2bc7b01_fk_organizat` FOREIGN KEY (`organization_ptr_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboards_dataglenclient`
--

LOCK TABLES `dashboards_dataglenclient` WRITE;
/*!40000 ALTER TABLE `dashboards_dataglenclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboards_dataglenclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboards_dataglengroup`
--

DROP TABLE IF EXISTS `dashboards_dataglengroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboards_dataglengroup` (
  `organization_ptr_id` int NOT NULL,
  `groupLogo` varchar(200) DEFAULT NULL,
  `groupMobileLogo` varchar(200) DEFAULT NULL,
  `groupClient_id` int NOT NULL,
  PRIMARY KEY (`organization_ptr_id`),
  KEY `dashboards_datagleng_groupClient_id_66c83763_fk_dashboard` (`groupClient_id`),
  CONSTRAINT `dashboards_datagleng_groupClient_id_66c83763_fk_dashboard` FOREIGN KEY (`groupClient_id`) REFERENCES `dashboards_dataglenclient` (`organization_ptr_id`),
  CONSTRAINT `dashboards_datagleng_organization_ptr_id_1da38028_fk_organizat` FOREIGN KEY (`organization_ptr_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboards_dataglengroup`
--

LOCK TABLES `dashboards_dataglengroup` WRITE;
/*!40000 ALTER TABLE `dashboards_dataglengroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboards_dataglengroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboards_dataglengroup_groupPermissions`
--

DROP TABLE IF EXISTS `dashboards_dataglengroup_groupPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboards_dataglengroup_groupPermissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dataglengroup_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboards_dataglengroup_dataglengroup_id_permiss_c141dcf3_uniq` (`dataglengroup_id`,`permission_id`),
  KEY `dashboards_datagleng_permission_id_895d4ebd_fk_auth_perm` (`permission_id`),
  CONSTRAINT `dashboards_datagleng_dataglengroup_id_f8c1bd9a_fk_dashboard` FOREIGN KEY (`dataglengroup_id`) REFERENCES `dashboards_dataglengroup` (`organization_ptr_id`),
  CONSTRAINT `dashboards_datagleng_permission_id_895d4ebd_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboards_dataglengroup_groupPermissions`
--

LOCK TABLES `dashboards_dataglengroup_groupPermissions` WRITE;
/*!40000 ALTER TABLE `dashboards_dataglengroup_groupPermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboards_dataglengroup_groupPermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboards_dataglengroup_groupSensors`
--

DROP TABLE IF EXISTS `dashboards_dataglengroup_groupSensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboards_dataglengroup_groupSensors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dataglengroup_id` int NOT NULL,
  `sensor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dashboards_dataglengroup_dataglengroup_id_sensor__07aa85c9_uniq` (`dataglengroup_id`,`sensor_id`),
  KEY `dashboards_datagleng_sensor_id_f72406b3_fk_dataglen_` (`sensor_id`),
  CONSTRAINT `dashboards_datagleng_dataglengroup_id_dc0a6c96_fk_dashboard` FOREIGN KEY (`dataglengroup_id`) REFERENCES `dashboards_dataglengroup` (`organization_ptr_id`),
  CONSTRAINT `dashboards_datagleng_sensor_id_f72406b3_fk_dataglen_` FOREIGN KEY (`sensor_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboards_dataglengroup_groupSensors`
--

LOCK TABLES `dashboards_dataglengroup_groupSensors` WRITE;
/*!40000 ALTER TABLE `dashboards_dataglengroup_groupSensors` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboards_dataglengroup_groupSensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataglen_field`
--

DROP TABLE IF EXISTS `dataglen_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataglen_field` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `streamDataType` varchar(20) NOT NULL,
  `streamDateTimeFormat` varchar(20) NOT NULL,
  `streamPositionInCSV` int DEFAULT NULL,
  `streamDataUnit` varchar(20) DEFAULT NULL,
  `multiplicationFactor` double NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `source_id` varchar(43) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataglen_field_source_id_name_45167325_uniq` (`source_id`,`name`),
  UNIQUE KEY `dataglen_field_source_id_streamPositionInCSV_81171fbd_uniq` (`source_id`,`streamPositionInCSV`),
  CONSTRAINT `dataglen_field_source_id_5adf9401_fk_dataglen_sensor_sourceKey` FOREIGN KEY (`source_id`) REFERENCES `dataglen_sensor` (`sourceKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataglen_field`
--

LOCK TABLES `dataglen_field` WRITE;
/*!40000 ALTER TABLE `dataglen_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataglen_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataglen_sensor`
--

DROP TABLE IF EXISTS `dataglen_sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataglen_sensor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `UID` varchar(128) DEFAULT NULL,
  `dataReportingInterval` int DEFAULT NULL,
  `dataFormat` varchar(10) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `isMonitored` tinyint(1) NOT NULL,
  `timeoutInterval` int NOT NULL,
  `dataTimezone` varchar(100) NOT NULL,
  `sourceMacAddress` varchar(17) DEFAULT NULL,
  `sourceKey` varchar(43) NOT NULL,
  `textMessageWithHTTP200` longtext,
  `textMessageWithError` longtext,
  `csvDataKeyName` varchar(128) DEFAULT NULL,
  `isTemplate` tinyint(1) NOT NULL,
  `templateName` varchar(128) NOT NULL,
  `actuationEnabled` tinyint(1) NOT NULL,
  `manager_email` varchar(254) NOT NULL,
  `manager_name` varchar(128) NOT NULL,
  `manager_phone` varchar(15) NOT NULL,
  `user_id` int NOT NULL,
  `_order` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sourceKey` (`sourceKey`),
  KEY `dataglen_sensor_user_id_74921993_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dataglen_sensor_user_id_74921993_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataglen_sensor`
--

LOCK TABLES `dataglen_sensor` WRITE;
/*!40000 ALTER TABLE `dataglen_sensor` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataglen_sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataglen_sensorgroup`
--

DROP TABLE IF EXISTS `dataglen_sensorgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataglen_sensorgroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `name` varchar(128) NOT NULL,
  `displayName` varchar(128) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dataglen_sensorgroup_user_id_4e5a02f1_fk_auth_user_id` (`user_id`),
  KEY `dataglen_sensorgroup_slug_b371452d` (`slug`),
  CONSTRAINT `dataglen_sensorgroup_user_id_4e5a02f1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataglen_sensorgroup`
--

LOCK TABLES `dataglen_sensorgroup` WRITE;
/*!40000 ALTER TABLE `dataglen_sensorgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataglen_sensorgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataglen_sensorgroup_groupSensors`
--

DROP TABLE IF EXISTS `dataglen_sensorgroup_groupSensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataglen_sensorgroup_groupSensors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sensorgroup_id` bigint NOT NULL,
  `sensor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dataglen_sensorgroup_gro_sensorgroup_id_sensor_id_349e957f_uniq` (`sensorgroup_id`,`sensor_id`),
  KEY `dataglen_sensorgroup_sensor_id_829325a1_fk_dataglen_` (`sensor_id`),
  CONSTRAINT `dataglen_sensorgroup_sensor_id_829325a1_fk_dataglen_` FOREIGN KEY (`sensor_id`) REFERENCES `dataglen_sensor` (`id`),
  CONSTRAINT `dataglen_sensorgroup_sensorgroup_id_34b3eeb9_fk_dataglen_` FOREIGN KEY (`sensorgroup_id`) REFERENCES `dataglen_sensorgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataglen_sensorgroup_groupSensors`
--

LOCK TABLES `dataglen_sensorgroup_groupSensors` WRITE;
/*!40000 ALTER TABLE `dataglen_sensorgroup_groupSensors` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataglen_sensorgroup_groupSensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dganalysis_aggregationfunction`
--

DROP TABLE IF EXISTS `dganalysis_aggregationfunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dganalysis_aggregationfunction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `function_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `aggregations` longtext,
  `aggregation_key` varchar(100) DEFAULT NULL,
  `post_aggregations` longtext,
  `post_aggregation_key` varchar(100) DEFAULT NULL,
  `data_key` varchar(100) NOT NULL,
  `default_column_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `function_id` (`function_id`),
  UNIQUE KEY `dganalysis_aggregationfunction_name_274cec96_uniq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dganalysis_aggregationfunction`
--

LOCK TABLES `dganalysis_aggregationfunction` WRITE;
/*!40000 ALTER TABLE `dganalysis_aggregationfunction` DISABLE KEYS */;
/*!40000 ALTER TABLE `dganalysis_aggregationfunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dganalysis_analysisconfiguration`
--

DROP TABLE IF EXISTS `dganalysis_analysisconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dganalysis_analysisconfiguration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `granularity` varchar(100) DEFAULT NULL,
  `interval` varchar(100) DEFAULT NULL,
  `col` int NOT NULL,
  `row` int NOT NULL,
  `size_x` int NOT NULL,
  `size_y` int NOT NULL,
  `analysis_id` bigint NOT NULL,
  `created_by_id` int NOT NULL,
  `css_id` bigint DEFAULT NULL,
  `dashboard_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `css_id` (`css_id`),
  KEY `dganalysis_analysisc_analysis_id_877f5182_fk_dganalysi` (`analysis_id`),
  KEY `dganalysis_analysisc_created_by_id_30e11387_fk_auth_user` (`created_by_id`),
  KEY `dganalysis_analysisc_dashboard_id_482ae4ee_fk_dganalysi` (`dashboard_id`),
  CONSTRAINT `dganalysis_analysisc_analysis_id_877f5182_fk_dganalysi` FOREIGN KEY (`analysis_id`) REFERENCES `dganalysis_dataanalysis` (`id`),
  CONSTRAINT `dganalysis_analysisc_created_by_id_30e11387_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dganalysis_analysisc_css_id_9442fae7_fk_dganalysi` FOREIGN KEY (`css_id`) REFERENCES `dganalysis_csstemplate` (`id`),
  CONSTRAINT `dganalysis_analysisc_dashboard_id_482ae4ee_fk_dganalysi` FOREIGN KEY (`dashboard_id`) REFERENCES `dganalysis_analysisdashboard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dganalysis_analysisconfiguration`
--

LOCK TABLES `dganalysis_analysisconfiguration` WRITE;
/*!40000 ALTER TABLE `dganalysis_analysisconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `dganalysis_analysisconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dganalysis_analysisconfiguration_plants`
--

DROP TABLE IF EXISTS `dganalysis_analysisconfiguration_plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dganalysis_analysisconfiguration_plants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `analysisconfiguration_id` bigint NOT NULL,
  `solarplant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dganalysis_analysisconfi_analysisconfiguration_id_ff47ba29_uniq` (`analysisconfiguration_id`,`solarplant_id`),
  KEY `dganalysis_analysisc_solarplant_id_4b15462f_fk_solarrms_` (`solarplant_id`),
  CONSTRAINT `dganalysis_analysisc_analysisconfiguratio_7a21dd81_fk_dganalysi` FOREIGN KEY (`analysisconfiguration_id`) REFERENCES `dganalysis_analysisconfiguration` (`id`),
  CONSTRAINT `dganalysis_analysisc_solarplant_id_4b15462f_fk_solarrms_` FOREIGN KEY (`solarplant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dganalysis_analysisconfiguration_plants`
--

LOCK TABLES `dganalysis_analysisconfiguration_plants` WRITE;
/*!40000 ALTER TABLE `dganalysis_analysisconfiguration_plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `dganalysis_analysisconfiguration_plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dganalysis_analysisdashboard`
--

DROP TABLE IF EXISTS `dganalysis_analysisdashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dganalysis_analysisdashboard` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `editable_by_others` tinyint(1) NOT NULL,
  `enabled_for_admins` tinyint(1) NOT NULL,
  `created_by_id` int NOT NULL,
  `css_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `css_id` (`css_id`),
  KEY `dganalysis_analysisd_created_by_id_3f30c73a_fk_auth_user` (`created_by_id`),
  CONSTRAINT `dganalysis_analysisd_created_by_id_3f30c73a_fk_auth_user` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dganalysis_analysisd_css_id_ff0e2ff6_fk_dganalysi` FOREIGN KEY (`css_id`) REFERENCES `dganalysis_csstemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dganalysis_analysisdashboard`
--

LOCK TABLES `dganalysis_analysisdashboard` WRITE;
/*!40000 ALTER TABLE `dganalysis_analysisdashboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `dganalysis_analysisdashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dganalysis_csstemplate`
--

DROP TABLE IF EXISTS `dganalysis_csstemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dganalysis_csstemplate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `css` longtext NOT NULL,
  `viz_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dganalysis_csstemplate`
--

LOCK TABLES `dganalysis_csstemplate` WRITE;
/*!40000 ALTER TABLE `dganalysis_csstemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `dganalysis_csstemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dganalysis_dataanalysis`
--

DROP TABLE IF EXISTS `dganalysis_dataanalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dganalysis_dataanalysis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `system_defined` tinyint(1) NOT NULL,
  `admin_view` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `enable_admin_view` tinyint(1) NOT NULL,
  `enable_client_view` tinyint(1) NOT NULL,
  `operation_text` varchar(5000) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `analysis_unit` varchar(200) DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `dg_client_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dganalysis_dataanalysis_created_by_id_da850ff2_fk_auth_user_id` (`created_by_id`),
  KEY `dganalysis_dataanaly_dg_client_id_8a456514_fk_dashboard` (`dg_client_id`),
  CONSTRAINT `dganalysis_dataanaly_dg_client_id_8a456514_fk_dashboard` FOREIGN KEY (`dg_client_id`) REFERENCES `dashboards_dataglenclient` (`organization_ptr_id`),
  CONSTRAINT `dganalysis_dataanalysis_created_by_id_da850ff2_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dganalysis_dataanalysis`
--

LOCK TABLES `dganalysis_dataanalysis` WRITE;
/*!40000 ALTER TABLE `dganalysis_dataanalysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `dganalysis_dataanalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dganalysis_dataslice`
--

DROP TABLE IF EXISTS `dganalysis_dataslice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dganalysis_dataslice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_source` varchar(100) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `fixed_instantaneous_granularity` tinyint(1) NOT NULL,
  `instantaneous_minutes` int NOT NULL,
  `normalized` tinyint(1) NOT NULL,
  `multiplier` double NOT NULL,
  `irradiation` varchar(100) DEFAULT NULL,
  `granularity_origin` tinyint(1) NOT NULL,
  `ppa_multiplier` tinyint(1) NOT NULL,
  `analysis_id` bigint DEFAULT NULL,
  `css_options_id` bigint NOT NULL,
  `daily_aggregation_id` bigint NOT NULL,
  `instantaneous_aggregation_id` bigint NOT NULL,
  `monthly_aggregation_id` bigint NOT NULL,
  `parent_slice_id` bigint DEFAULT NULL,
  `query_options_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `css_options_id` (`css_options_id`),
  KEY `dganalysis_dataslice_analysis_id_dd1dc71c_fk_dganalysi` (`analysis_id`),
  KEY `dganalysis_dataslice_daily_aggregation_id_87c55e1b_fk_dganalysi` (`daily_aggregation_id`),
  KEY `dganalysis_dataslice_instantaneous_aggreg_7deb1c35_fk_dganalysi` (`instantaneous_aggregation_id`),
  KEY `dganalysis_dataslice_monthly_aggregation__14bd3966_fk_dganalysi` (`monthly_aggregation_id`),
  KEY `dganalysis_dataslice_parent_slice_id_d9c02166_fk_dganalysi` (`parent_slice_id`),
  KEY `dganalysis_dataslice_query_options_id_5565c31e_fk_dganalysi` (`query_options_id`),
  CONSTRAINT `dganalysis_dataslice_analysis_id_dd1dc71c_fk_dganalysi` FOREIGN KEY (`analysis_id`) REFERENCES `dganalysis_dataanalysis` (`id`),
  CONSTRAINT `dganalysis_dataslice_css_options_id_a3bf0d91_fk_dganalysi` FOREIGN KEY (`css_options_id`) REFERENCES `dganalysis_csstemplate` (`id`),
  CONSTRAINT `dganalysis_dataslice_daily_aggregation_id_87c55e1b_fk_dganalysi` FOREIGN KEY (`daily_aggregation_id`) REFERENCES `dganalysis_aggregationfunction` (`id`),
  CONSTRAINT `dganalysis_dataslice_instantaneous_aggreg_7deb1c35_fk_dganalysi` FOREIGN KEY (`instantaneous_aggregation_id`) REFERENCES `dganalysis_aggregationfunction` (`id`),
  CONSTRAINT `dganalysis_dataslice_monthly_aggregation__14bd3966_fk_dganalysi` FOREIGN KEY (`monthly_aggregation_id`) REFERENCES `dganalysis_aggregationfunction` (`id`),
  CONSTRAINT `dganalysis_dataslice_parent_slice_id_d9c02166_fk_dganalysi` FOREIGN KEY (`parent_slice_id`) REFERENCES `dganalysis_dataslice` (`id`),
  CONSTRAINT `dganalysis_dataslice_query_options_id_5565c31e_fk_dganalysi` FOREIGN KEY (`query_options_id`) REFERENCES `dganalysis_queryoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dganalysis_dataslice`
--

LOCK TABLES `dganalysis_dataslice` WRITE;
/*!40000 ALTER TABLE `dganalysis_dataslice` DISABLE KEYS */;
/*!40000 ALTER TABLE `dganalysis_dataslice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dganalysis_dataslice_having_clauses`
--

DROP TABLE IF EXISTS `dganalysis_dataslice_having_clauses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dganalysis_dataslice_having_clauses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dataslice_id` bigint NOT NULL,
  `havingclause_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dganalysis_dataslice_hav_dataslice_id_havingclaus_314497be_uniq` (`dataslice_id`,`havingclause_id`),
  KEY `dganalysis_dataslice_havingclause_id_0e0db02c_fk_dganalysi` (`havingclause_id`),
  CONSTRAINT `dganalysis_dataslice_dataslice_id_34c1987f_fk_dganalysi` FOREIGN KEY (`dataslice_id`) REFERENCES `dganalysis_dataslice` (`id`),
  CONSTRAINT `dganalysis_dataslice_havingclause_id_0e0db02c_fk_dganalysi` FOREIGN KEY (`havingclause_id`) REFERENCES `dganalysis_havingclause` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dganalysis_dataslice_having_clauses`
--

LOCK TABLES `dganalysis_dataslice_having_clauses` WRITE;
/*!40000 ALTER TABLE `dganalysis_dataslice_having_clauses` DISABLE KEYS */;
/*!40000 ALTER TABLE `dganalysis_dataslice_having_clauses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dganalysis_havingclause`
--

DROP TABLE IF EXISTS `dganalysis_havingclause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dganalysis_havingclause` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `clause_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `having_clause` longtext,
  `having_clause_key` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clause_id` (`clause_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dganalysis_havingclause`
--

LOCK TABLES `dganalysis_havingclause` WRITE;
/*!40000 ALTER TABLE `dganalysis_havingclause` DISABLE KEYS */;
/*!40000 ALTER TABLE `dganalysis_havingclause` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dganalysis_queryoption`
--

DROP TABLE IF EXISTS `dganalysis_queryoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dganalysis_queryoption` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `query_id` int NOT NULL,
  `data_family` varchar(100) NOT NULL,
  `display_name` varchar(200) NOT NULL,
  `filter_column_name` varchar(200) DEFAULT NULL,
  `filter_stream_name` varchar(200) NOT NULL,
  `dimension` varchar(200) DEFAULT NULL,
  `data_unit` varchar(200) DEFAULT NULL,
  `query_type` varchar(200) DEFAULT NULL,
  `dashboard_id` int NOT NULL,
  `parent_query_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `query_id` (`query_id`),
  UNIQUE KEY `dganalysis_queryoption_dashboard_id_data_family_a9d0110b_uniq` (`dashboard_id`,`data_family`,`filter_stream_name`,`dimension`,`data_unit`),
  KEY `dganalysis_queryopti_parent_query_id_a78b1795_fk_dganalysi` (`parent_query_id`),
  CONSTRAINT `dganalysis_queryopti_dashboard_id_3e9f2604_fk_dashboard` FOREIGN KEY (`dashboard_id`) REFERENCES `dashboards_dashboard` (`organization_ptr_id`),
  CONSTRAINT `dganalysis_queryopti_parent_query_id_a78b1795_fk_dganalysi` FOREIGN KEY (`parent_query_id`) REFERENCES `dganalysis_queryoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dganalysis_queryoption`
--

LOCK TABLES `dganalysis_queryoption` WRITE;
/*!40000 ALTER TABLE `dganalysis_queryoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `dganalysis_queryoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dgcomments_dgcomment`
--

DROP TABLE IF EXISTS `dgcomments_dgcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dgcomments_dgcomment` (
  `comment_ptr_id` int NOT NULL,
  `image_base_64` longtext,
  PRIMARY KEY (`comment_ptr_id`),
  CONSTRAINT `dgcomments_dgcomment_comment_ptr_id_675267e3_fk_django_co` FOREIGN KEY (`comment_ptr_id`) REFERENCES `django_comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dgcomments_dgcomment`
--

LOCK TABLES `dgcomments_dgcomment` WRITE;
/*!40000 ALTER TABLE `dgcomments_dgcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dgcomments_dgcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dgusers_alertscategory`
--

DROP TABLE IF EXISTS `dgusers_alertscategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dgusers_alertscategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event_type` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `threshold_applicable` tinyint(1) NOT NULL,
  `threshold_value` double NOT NULL,
  `email_notifications` tinyint(1) NOT NULL,
  `sms_notifications` tinyint(1) NOT NULL,
  `email_aggregation_minutes` int NOT NULL,
  `sms_aggregation_minutes` int NOT NULL,
  `emails_count` int NOT NULL,
  `sms_count` int NOT NULL,
  `last_email` datetime(6) DEFAULT NULL,
  `last_sms` datetime(6) DEFAULT NULL,
  `alert_on_close` tinyint(1) NOT NULL,
  `user_role_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dgusers_alertscategory_user_role_id_event_type_afb1bbf1_uniq` (`user_role_id`,`event_type`),
  CONSTRAINT `dgusers_alertscatego_user_role_id_cbc8fe92_fk_dgusers_u` FOREIGN KEY (`user_role_id`) REFERENCES `dgusers_userrole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dgusers_alertscategory`
--

LOCK TABLES `dgusers_alertscategory` WRITE;
/*!40000 ALTER TABLE `dgusers_alertscategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `dgusers_alertscategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dgusers_userrole`
--

DROP TABLE IF EXISTS `dgusers_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dgusers_userrole` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  `daily_report` tinyint(1) NOT NULL,
  `enable_alerts` tinyint(1) NOT NULL,
  `account_suspended` tinyint(1) NOT NULL,
  `enable_preference_edit` tinyint(1) NOT NULL,
  `gateway_alerts_notifications` tinyint(1) NOT NULL,
  `inverters_alerts_notifications` tinyint(1) NOT NULL,
  `other_alerts` tinyint(1) NOT NULL,
  `sms` tinyint(1) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `viewOnly` tinyint(1) NOT NULL,
  `dg_client_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `dgusers_userrole_dg_client_id_9e7d8a52_fk_dashboard` (`dg_client_id`),
  CONSTRAINT `dgusers_userrole_dg_client_id_9e7d8a52_fk_dashboard` FOREIGN KEY (`dg_client_id`) REFERENCES `dashboards_dataglenclient` (`organization_ptr_id`),
  CONSTRAINT `dgusers_userrole_user_id_5ef32a01_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dgusers_userrole`
--

LOCK TABLES `dgusers_userrole` WRITE;
/*!40000 ALTER TABLE `dgusers_userrole` DISABLE KEYS */;
/*!40000 ALTER TABLE `dgusers_userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dgusers_userroleplantsalertspreferences`
--

DROP TABLE IF EXISTS `dgusers_userroleplantsalertspreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dgusers_userroleplantsalertspreferences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_role_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dgusers_userroleplan_user_role_id_8455fa06_fk_dgusers_u` (`user_role_id`),
  CONSTRAINT `dgusers_userroleplan_user_role_id_8455fa06_fk_dgusers_u` FOREIGN KEY (`user_role_id`) REFERENCES `dgusers_userrole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dgusers_userroleplantsalertspreferences`
--

LOCK TABLES `dgusers_userroleplantsalertspreferences` WRITE;
/*!40000 ALTER TABLE `dgusers_userroleplantsalertspreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `dgusers_userroleplantsalertspreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dgusers_userroleplantsalertspreferences_alerts_enabled`
--

DROP TABLE IF EXISTS `dgusers_userroleplantsalertspreferences_alerts_enabled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dgusers_userroleplantsalertspreferences_alerts_enabled` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userroleplantsalertspreferences_id` bigint NOT NULL,
  `solarplant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dgusers_userroleplantsal_userroleplantsalertspref_b7e30fc1_uniq` (`userroleplantsalertspreferences_id`,`solarplant_id`),
  KEY `dgusers_userroleplan_solarplant_id_cd518372_fk_solarrms_` (`solarplant_id`),
  CONSTRAINT `dgusers_userroleplan_solarplant_id_cd518372_fk_solarrms_` FOREIGN KEY (`solarplant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `dgusers_userroleplan_userroleplantsalerts_3f2a91ce_fk_dgusers_u` FOREIGN KEY (`userroleplantsalertspreferences_id`) REFERENCES `dgusers_userroleplantsalertspreferences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dgusers_userroleplantsalertspreferences_alerts_enabled`
--

LOCK TABLES `dgusers_userroleplantsalertspreferences_alerts_enabled` WRITE;
/*!40000 ALTER TABLE `dgusers_userroleplantsalertspreferences_alerts_enabled` DISABLE KEYS */;
/*!40000 ALTER TABLE `dgusers_userroleplantsalertspreferences_alerts_enabled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comment_flags`
--

DROP TABLE IF EXISTS `django_comment_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_comment_flags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `flag` varchar(30) NOT NULL,
  `flag_date` datetime(6) NOT NULL,
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_comment_flags_user_id_comment_id_flag_537f77a7_uniq` (`user_id`,`comment_id`,`flag`),
  KEY `django_comment_flags_comment_id_d8054933_fk_django_comments_id` (`comment_id`),
  KEY `django_comment_flags_flag_8b141fcb` (`flag`),
  CONSTRAINT `django_comment_flags_comment_id_d8054933_fk_django_comments_id` FOREIGN KEY (`comment_id`) REFERENCES `django_comments` (`id`),
  CONSTRAINT `django_comment_flags_user_id_f3f81f0a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comment_flags`
--

LOCK TABLES `django_comment_flags` WRITE;
/*!40000 ALTER TABLE `django_comment_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comment_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_comments`
--

DROP TABLE IF EXISTS `django_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(64) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(254) NOT NULL,
  `user_url` varchar(200) NOT NULL,
  `comment` longtext NOT NULL,
  `submit_date` datetime(6) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `is_removed` tinyint(1) NOT NULL,
  `content_type_id` int NOT NULL,
  `site_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `django_comments_content_type_id_c4afe962_fk_django_co` (`content_type_id`),
  KEY `django_comments_site_id_9dcf666e_fk_django_site_id` (`site_id`),
  KEY `django_comments_user_id_a0a440a1_fk_auth_user_id` (`user_id`),
  KEY `django_comments_submit_date_514ed2d9` (`submit_date`),
  KEY `django_comments_is_removed_52a03ae3` (`is_removed`),
  KEY `django_comments_object_pk_7fc98e83` (`object_pk`),
  CONSTRAINT `django_comments_content_type_id_c4afe962_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_comments_site_id_9dcf666e_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  CONSTRAINT `django_comments_user_id_a0a440a1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_comments`
--

LOCK TABLES `django_comments` WRITE;
/*!40000 ALTER TABLE `django_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','emailaddress'),(9,'account','emailconfirmation'),(30,'action','actionfield'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(24,'authtoken','token'),(25,'authtoken','tokenproxy'),(31,'config','configfield'),(5,'contenttypes','contenttype'),(66,'customwidgets','filepath'),(67,'customwidgets','userconfiguration'),(68,'customwidgets','widgetinstance'),(18,'dashboards','dashboard'),(19,'dashboards','dataglenclient'),(20,'dashboards','dataglengroup'),(23,'dataglen','field'),(21,'dataglen','sensor'),(22,'dataglen','sensorgroup'),(122,'dganalysis','aggregationfunction'),(129,'dganalysis','analysisconfiguration'),(128,'dganalysis','analysisdashboard'),(123,'dganalysis','csstemplate'),(124,'dganalysis','dataanalysis'),(127,'dganalysis','dataslice'),(125,'dganalysis','havingclause'),(126,'dganalysis','queryoption'),(130,'dgcomments','dgcomment'),(111,'dgusers','alertscategory'),(109,'dgusers','userrole'),(110,'dgusers','userroleplantsalertspreferences'),(26,'django_comments','comment'),(27,'django_comments','commentflag'),(136,'dwebdyn','invertersdevice'),(135,'dwebdyn','iodevice'),(134,'dwebdyn','modbusdevice'),(132,'dwebdyn','webdynclient'),(133,'dwebdyn','webdyngateway'),(32,'errors','errorfield'),(94,'events','alertmanagement'),(91,'events','events'),(93,'events','eventsconfig'),(92,'events','usereventalertspreferences'),(112,'features','customfeature'),(120,'features','customreportformat'),(119,'features','dgclientsubscription'),(113,'features','feature'),(114,'features','featurecategory'),(115,'features','featureorder'),(118,'features','roleaccess'),(117,'features','subscriptionplan'),(121,'features','usersolarplantwidgetsconfig'),(116,'features','usertablewidgetsconfig'),(28,'guardian','groupobjectpermission'),(29,'guardian','userobjectpermission'),(90,'helpdesk','alarmassociation'),(89,'helpdesk','analyticsassociation'),(86,'helpdesk','attachment'),(69,'helpdesk','baseeventassociation'),(70,'helpdesk','customfield'),(71,'helpdesk','emailtemplate'),(85,'helpdesk','escalationexclusion'),(72,'helpdesk','followup'),(84,'helpdesk','ignoreemail'),(73,'helpdesk','kbcategory'),(83,'helpdesk','kbitem'),(82,'helpdesk','presetreply'),(74,'helpdesk','queue'),(81,'helpdesk','savedsearch'),(88,'helpdesk','sladefinition'),(75,'helpdesk','ticket'),(80,'helpdesk','ticketassociation'),(79,'helpdesk','ticketcc'),(78,'helpdesk','ticketchange'),(77,'helpdesk','ticketcustomfieldvalue'),(87,'helpdesk','ticketdependency'),(76,'helpdesk','usersettings'),(96,'ioelab','invite'),(95,'ioelab','validuid'),(98,'license','installation'),(97,'license','license'),(102,'microgrid','battery'),(99,'microgrid','chargecontroller'),(101,'microgrid','connectedload'),(100,'microgrid','panelset'),(103,'oandmmanager','cycle'),(107,'oandmmanager','preferences'),(106,'oandmmanager','taskassociation'),(105,'oandmmanager','taskitem'),(104,'oandmmanager','tasks'),(13,'organizations','organization'),(16,'organizations','organizationinvitation'),(14,'organizations','organizationowner'),(15,'organizations','organizationuser'),(108,'otp','otp'),(6,'sessions','session'),(7,'sites','site'),(10,'socialaccount','socialaccount'),(11,'socialaccount','socialapp'),(12,'socialaccount','socialtoken'),(57,'solarrms','aggregatedindependentinverter'),(33,'solarrms','ajb'),(63,'solarrms','ajbstatusmappings'),(56,'solarrms','cleaningtrigger'),(55,'solarrms','clientcontentsenable'),(34,'solarrms','energymeter'),(35,'solarrms','feeder'),(36,'solarrms','gatewaysource'),(37,'solarrms','independentinverter'),(38,'solarrms','inverter'),(54,'solarrms','invertererrorcodes'),(62,'solarrms','inverterstatusmappings'),(39,'solarrms','iosensorfield'),(61,'solarrms','meterstatusmappings'),(40,'solarrms','mppt'),(53,'solarrms','panelsstring'),(52,'solarrms','plantcontractdetails'),(51,'solarrms','plantfeaturesenable'),(41,'solarrms','plantmetasource'),(60,'solarrms','pvsystinfo'),(59,'solarrms','pvwatt'),(42,'solarrms','solarerrorfield'),(43,'solarrms','solarfield'),(44,'solarrms','solargroup'),(50,'solarrms','solarmetrics'),(45,'solarrms','solarplant'),(49,'solarrms','solarsection'),(48,'solarrms','transformer'),(58,'solarrms','transformerstatusmappings'),(47,'solarrms','virtualgateway'),(46,'solarrms','weatherstation'),(64,'tagging','tag'),(65,'tagging','taggeditem'),(17,'website','betarequest'),(131,'widgets','widget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-22 06:19:33.014059'),(2,'auth','0001_initial','2023-03-22 06:19:33.631838'),(3,'account','0001_initial','2023-03-22 06:19:33.800030'),(4,'account','0002_email_max_length','2023-03-22 06:19:33.820205'),(5,'dataglen','0001_initial','2023-03-22 06:19:34.248107'),(6,'action','0001_initial','2023-03-22 06:19:34.375333'),(7,'admin','0001_initial','2023-03-22 06:19:34.519965'),(8,'admin','0002_logentry_remove_auto_add','2023-03-22 06:19:34.537319'),(9,'admin','0003_logentry_add_action_flag_choices','2023-03-22 06:19:34.555072'),(10,'contenttypes','0002_remove_content_type_name','2023-03-22 06:19:34.643748'),(11,'auth','0002_alter_permission_name_max_length','2023-03-22 06:19:34.711752'),(12,'auth','0003_alter_user_email_max_length','2023-03-22 06:19:34.742280'),(13,'auth','0004_alter_user_username_opts','2023-03-22 06:19:34.758503'),(14,'auth','0005_alter_user_last_login_null','2023-03-22 06:19:34.820051'),(15,'auth','0006_require_contenttypes_0002','2023-03-22 06:19:34.827210'),(16,'auth','0007_alter_validators_add_error_messages','2023-03-22 06:19:34.840732'),(17,'auth','0008_alter_user_username_max_length','2023-03-22 06:19:34.907074'),(18,'auth','0009_alter_user_last_name_max_length','2023-03-22 06:19:34.971863'),(19,'auth','0010_alter_group_name_max_length','2023-03-22 06:19:35.000133'),(20,'auth','0011_update_proxy_permissions','2023-03-22 06:19:35.013169'),(21,'auth','0012_alter_user_first_name_max_length','2023-03-22 06:19:35.087983'),(22,'authtoken','0001_initial','2023-03-22 06:19:35.173025'),(23,'authtoken','0002_auto_20160226_1747','2023-03-22 06:19:35.210029'),(24,'authtoken','0003_tokenproxy','2023-03-22 06:19:35.219645'),(25,'config','0001_initial','2023-03-22 06:19:35.336762'),(26,'customwidgets','0001_initial','2023-03-22 06:19:35.524215'),(27,'organizations','0001_initial','2023-03-22 06:19:35.861030'),(28,'organizations','0002_model_update','2023-03-22 06:19:35.877794'),(29,'organizations','0003_field_fix_and_editable','2023-03-22 06:19:35.895647'),(30,'organizations','0004_organizationinvitation','2023-03-22 06:19:36.094743'),(31,'organizations','0005_alter_organization_users_and_more','2023-03-22 06:19:36.268044'),(32,'organizations','0006_alter_organization_slug','2023-03-22 06:19:36.282813'),(33,'dashboards','0001_initial','2023-03-22 06:19:36.865988'),(34,'errors','0001_initial','2023-03-22 06:19:36.991111'),(35,'solarrms','0001_initial','2023-03-22 06:19:43.067853'),(36,'dganalysis','0001_initial','2023-03-22 06:19:44.880361'),(37,'sites','0001_initial','2023-03-22 06:19:44.907188'),(38,'django_comments','0001_initial','2023-03-22 06:19:45.331881'),(39,'django_comments','0002_update_user_email_field_length','2023-03-22 06:19:45.364153'),(40,'django_comments','0003_add_submit_date_index','2023-03-22 06:19:45.414219'),(41,'django_comments','0004_add_object_pk_is_removed_index','2023-03-22 06:19:45.571059'),(42,'dgcomments','0001_initial','2023-03-22 06:19:45.672590'),(43,'dgusers','0001_initial','2023-03-22 06:19:46.210271'),(44,'dwebdyn','0001_initial','2023-03-22 06:19:46.594661'),(45,'events','0001_initial','2023-03-22 06:19:47.084463'),(46,'features','0001_initial','2023-03-22 06:19:49.122483'),(47,'guardian','0001_initial','2023-03-22 06:19:49.708991'),(48,'guardian','0002_generic_permissions_index','2023-03-22 06:19:49.783366'),(49,'helpdesk','0001_initial','2023-03-22 06:19:53.312412'),(50,'ioelab','0001_initial','2023-03-22 06:19:53.610532'),(51,'license','0001_initial','2023-03-22 06:19:53.719817'),(52,'license','0002_alter_installation_install_ts','2023-03-22 06:19:53.731782'),(53,'license','0003_alter_installation_install_ts','2023-03-22 06:19:53.746254'),(54,'license','0004_alter_installation_install_ts','2023-03-22 06:19:53.760317'),(55,'license','0005_alter_installation_install_ts','2023-03-22 06:19:53.772460'),(56,'license','0006_alter_installation_install_ts','2023-03-22 06:19:53.784129'),(57,'license','0007_alter_installation_install_ts','2023-03-22 06:19:53.797741'),(58,'license','0008_alter_installation_install_ts','2023-03-22 06:19:53.811181'),(59,'license','0009_alter_installation_install_ts','2023-03-22 06:19:53.824172'),(60,'license','0010_alter_installation_install_ts','2023-03-22 06:19:53.837265'),(61,'license','0011_alter_installation_install_ts','2023-03-22 06:19:53.849470'),(62,'license','0012_alter_installation_install_ts','2023-03-22 06:19:53.863536'),(63,'license','0013_alter_installation_install_ts','2023-03-22 06:19:53.877285'),(64,'license','0014_alter_installation_install_ts','2023-03-22 06:19:53.892536'),(65,'microgrid','0001_initial','2023-03-22 06:19:54.839120'),(66,'oandmmanager','0001_initial','2023-03-22 06:19:55.921806'),(67,'otp','0001_initial','2023-03-22 06:19:55.951011'),(68,'sessions','0001_initial','2023-03-22 06:19:56.008356'),(69,'sites','0002_alter_domain_unique','2023-03-22 06:19:56.043234'),(70,'socialaccount','0001_initial','2023-03-22 06:19:56.684768'),(71,'socialaccount','0002_token_max_lengths','2023-03-22 06:19:56.778194'),(72,'socialaccount','0003_extra_data_default_dict','2023-03-22 06:19:56.811048'),(73,'tagging','0001_initial','2023-03-22 06:19:57.085797'),(74,'tagging','0002_on_delete','2023-03-22 06:19:57.397723'),(75,'tagging','0003_adapt_max_tag_length','2023-03-22 06:19:57.416809'),(76,'tagging','0004_alter_tag_id_alter_taggeditem_id','2023-03-22 06:19:57.779218'),(77,'widgets','0001_initial','2023-03-22 06:19:57.999259');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dwebdyn_invertersdevice`
--

DROP TABLE IF EXISTS `dwebdyn_invertersdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dwebdyn_invertersdevice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `identifier` varchar(20) NOT NULL,
  `fields_template` varchar(30) NOT NULL,
  `source_key` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `gateway_device_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dwebdyn_invertersdev_gateway_device_id_8646dec1_fk_dwebdyn_w` (`gateway_device_id`),
  CONSTRAINT `dwebdyn_invertersdev_gateway_device_id_8646dec1_fk_dwebdyn_w` FOREIGN KEY (`gateway_device_id`) REFERENCES `dwebdyn_webdyngateway` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dwebdyn_invertersdevice`
--

LOCK TABLES `dwebdyn_invertersdevice` WRITE;
/*!40000 ALTER TABLE `dwebdyn_invertersdevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `dwebdyn_invertersdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dwebdyn_iodevice`
--

DROP TABLE IF EXISTS `dwebdyn_iodevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dwebdyn_iodevice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `input_id` int NOT NULL,
  `stream_name` varchar(50) NOT NULL,
  `source_key` varchar(50) NOT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `output_range` varchar(20) NOT NULL,
  `lower_bound` double NOT NULL,
  `upper_bound` double NOT NULL,
  `coefficient_A` double DEFAULT NULL,
  `coefficient_B` double DEFAULT NULL,
  `multiplicationFactor` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  `gateway_device_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dwebdyn_iodevice_gateway_device_id_f08e711f_fk_dwebdyn_w` (`gateway_device_id`),
  CONSTRAINT `dwebdyn_iodevice_gateway_device_id_f08e711f_fk_dwebdyn_w` FOREIGN KEY (`gateway_device_id`) REFERENCES `dwebdyn_webdyngateway` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dwebdyn_iodevice`
--

LOCK TABLES `dwebdyn_iodevice` WRITE;
/*!40000 ALTER TABLE `dwebdyn_iodevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `dwebdyn_iodevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dwebdyn_modbusdevice`
--

DROP TABLE IF EXISTS `dwebdyn_modbusdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dwebdyn_modbusdevice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `modbus_address` varchar(20) NOT NULL,
  `fields_template` varchar(50) NOT NULL,
  `source_key` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `gateway_device_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dwebdyn_modbusdevice_gateway_device_id_d21159b5_fk_dwebdyn_w` (`gateway_device_id`),
  CONSTRAINT `dwebdyn_modbusdevice_gateway_device_id_d21159b5_fk_dwebdyn_w` FOREIGN KEY (`gateway_device_id`) REFERENCES `dwebdyn_webdyngateway` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dwebdyn_modbusdevice`
--

LOCK TABLES `dwebdyn_modbusdevice` WRITE;
/*!40000 ALTER TABLE `dwebdyn_modbusdevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `dwebdyn_modbusdevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dwebdyn_webdynclient`
--

DROP TABLE IF EXISTS `dwebdyn_webdynclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dwebdyn_webdynclient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `api_key` varchar(50) DEFAULT NULL,
  `ftp_dir` varchar(100) DEFAULT NULL,
  `archived_dir` varchar(100) DEFAULT NULL,
  `invalid_dir` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  UNIQUE KEY `api_key` (`api_key`),
  UNIQUE KEY `ftp_dir` (`ftp_dir`),
  UNIQUE KEY `archived_dir` (`archived_dir`),
  UNIQUE KEY `invalid_dir` (`invalid_dir`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dwebdyn_webdynclient`
--

LOCK TABLES `dwebdyn_webdynclient` WRITE;
/*!40000 ALTER TABLE `dwebdyn_webdynclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `dwebdyn_webdynclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dwebdyn_webdyngateway`
--

DROP TABLE IF EXISTS `dwebdyn_webdyngateway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dwebdyn_webdyngateway` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_id` varchar(20) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `installed_location` varchar(100) NOT NULL,
  `heartbeat_source_key` varchar(50) NOT NULL,
  `metadata_source_key` varchar(50) NOT NULL,
  `client_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dwebdyn_webdyngatewa_client_id_4902f01f_fk_dwebdyn_w` (`client_id`),
  CONSTRAINT `dwebdyn_webdyngatewa_client_id_4902f01f_fk_dwebdyn_w` FOREIGN KEY (`client_id`) REFERENCES `dwebdyn_webdynclient` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dwebdyn_webdyngateway`
--

LOCK TABLES `dwebdyn_webdyngateway` WRITE;
/*!40000 ALTER TABLE `dwebdyn_webdyngateway` DISABLE KEYS */;
/*!40000 ALTER TABLE `dwebdyn_webdyngateway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `errors_errorfield`
--

DROP TABLE IF EXISTS `errors_errorfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `errors_errorfield` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `streamDataType` varchar(20) NOT NULL,
  `streamDateTimeFormat` varchar(20) NOT NULL,
  `streamPositionInCSV` int DEFAULT NULL,
  `streamDataUnit` varchar(20) DEFAULT NULL,
  `multiplicationFactor` double NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `type` varchar(10) NOT NULL,
  `source_id` varchar(43) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `errors_errorfield_source_id_name_49083a1d_uniq` (`source_id`,`name`),
  UNIQUE KEY `errors_errorfield_source_id_streamPositionInCSV_11e4774c_uniq` (`source_id`,`streamPositionInCSV`),
  CONSTRAINT `errors_errorfield_source_id_82813aa4_fk_dataglen_` FOREIGN KEY (`source_id`) REFERENCES `dataglen_sensor` (`sourceKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errors_errorfield`
--

LOCK TABLES `errors_errorfield` WRITE;
/*!40000 ALTER TABLE `errors_errorfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `errors_errorfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_alertmanagement`
--

DROP TABLE IF EXISTS `events_alertmanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_alertmanagement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `identifier` varchar(128) NOT NULL,
  `alert_time` datetime(6) NOT NULL,
  `event_time` datetime(6) NOT NULL,
  `email_id` varchar(128) NOT NULL,
  `phone_no` varchar(13) NOT NULL,
  `event_code` varchar(100) NOT NULL,
  `event_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_alertmanagement_identifier_alert_time_em_d3e32780_uniq` (`identifier`,`alert_time`,`email_id`,`event_code`),
  KEY `events_alertmanagement_event_id_11d4ec86_fk_events_events_id` (`event_id`),
  CONSTRAINT `events_alertmanagement_event_id_11d4ec86_fk_events_events_id` FOREIGN KEY (`event_id`) REFERENCES `events_events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_alertmanagement`
--

LOCK TABLES `events_alertmanagement` WRITE;
/*!40000 ALTER TABLE `events_alertmanagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_alertmanagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_events`
--

DROP TABLE IF EXISTS `events_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event_name` varchar(128) NOT NULL,
  `event_category` varchar(128) NOT NULL,
  `applicable_to` varchar(128) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_events_event_name_event_categor_f0a27c2f_uniq` (`event_name`,`event_category`,`applicable_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_events`
--

LOCK TABLES `events_events` WRITE;
/*!40000 ALTER TABLE `events_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_eventsconfig`
--

DROP TABLE IF EXISTS `events_eventsconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_eventsconfig` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(128) NOT NULL,
  `condition_type` varchar(128) NOT NULL,
  `condition_operator` varchar(30) NOT NULL,
  `condition_value` varchar(128) NOT NULL,
  `event_type` varchar(128) NOT NULL,
  `source_key_id` varchar(43) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_eventsconfig_source_key_id_stream_nam_13e5336f_uniq` (`source_key_id`,`stream_name`,`condition_type`,`condition_operator`,`condition_value`),
  CONSTRAINT `events_eventsconfig_source_key_id_66a75329_fk_dataglen_` FOREIGN KEY (`source_key_id`) REFERENCES `dataglen_sensor` (`sourceKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_eventsconfig`
--

LOCK TABLES `events_eventsconfig` WRITE;
/*!40000 ALTER TABLE `events_eventsconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_eventsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events_usereventalertspreferences`
--

DROP TABLE IF EXISTS `events_usereventalertspreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events_usereventalertspreferences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `identifier` varchar(128) NOT NULL,
  `alert_active` tinyint(1) NOT NULL,
  `email_id` varchar(128) NOT NULL,
  `phone_no` varchar(13) NOT NULL,
  `alert_interval` int NOT NULL,
  `event_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `events_usereventalertspr_event_id_identifier_emai_b8624492_uniq` (`event_id`,`identifier`,`email_id`,`phone_no`),
  CONSTRAINT `events_usereventaler_event_id_93b061b2_fk_events_ev` FOREIGN KEY (`event_id`) REFERENCES `events_events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events_usereventalertspreferences`
--

LOCK TABLES `events_usereventalertspreferences` WRITE;
/*!40000 ALTER TABLE `events_usereventalertspreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `events_usereventalertspreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_customfeature`
--

DROP TABLE IF EXISTS `features_customfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_customfeature` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feature_title` varchar(100) DEFAULT NULL,
  `feature_description` varchar(100) DEFAULT NULL,
  `feature_columns` varchar(100) DEFAULT NULL,
  `feature_chart_type` varchar(100) DEFAULT NULL,
  `feature_unit` varchar(100) DEFAULT NULL,
  `feature_type` varchar(100) DEFAULT NULL,
  `feature_order` smallint NOT NULL,
  `features_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `features_customfeatu_features_id_7f9b1356_fk_features_` (`features_id`),
  CONSTRAINT `features_customfeatu_features_id_7f9b1356_fk_features_` FOREIGN KEY (`features_id`) REFERENCES `features_feature` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_customfeature`
--

LOCK TABLES `features_customfeature` WRITE;
/*!40000 ALTER TABLE `features_customfeature` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_customfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_customreportformat`
--

DROP TABLE IF EXISTS `features_customreportformat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_customreportformat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `role_default` tinyint(1) NOT NULL,
  `report_type` varchar(100) NOT NULL,
  `dg_client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `features_customrepor_dg_client_id_548a84dc_fk_dashboard` (`dg_client_id`),
  CONSTRAINT `features_customrepor_dg_client_id_548a84dc_fk_dashboard` FOREIGN KEY (`dg_client_id`) REFERENCES `dashboards_dataglenclient` (`organization_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_customreportformat`
--

LOCK TABLES `features_customreportformat` WRITE;
/*!40000 ALTER TABLE `features_customreportformat` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_customreportformat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_customreportformat_custom_features`
--

DROP TABLE IF EXISTS `features_customreportformat_custom_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_customreportformat_custom_features` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customreportformat_id` bigint NOT NULL,
  `customfeature_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `features_customreportfor_customreportformat_id_cu_824ec01d_uniq` (`customreportformat_id`,`customfeature_id`),
  KEY `features_customrepor_customfeature_id_1be30014_fk_features_` (`customfeature_id`),
  CONSTRAINT `features_customrepor_customfeature_id_1be30014_fk_features_` FOREIGN KEY (`customfeature_id`) REFERENCES `features_customfeature` (`id`),
  CONSTRAINT `features_customrepor_customreportformat_i_73021e58_fk_features_` FOREIGN KEY (`customreportformat_id`) REFERENCES `features_customreportformat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_customreportformat_custom_features`
--

LOCK TABLES `features_customreportformat_custom_features` WRITE;
/*!40000 ALTER TABLE `features_customreportformat_custom_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_customreportformat_custom_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_customreportformat_user`
--

DROP TABLE IF EXISTS `features_customreportformat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_customreportformat_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customreportformat_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `features_customreportfor_customreportformat_id_us_5c0c779f_uniq` (`customreportformat_id`,`user_id`),
  KEY `features_customrepor_user_id_c6172d54_fk_auth_user` (`user_id`),
  CONSTRAINT `features_customrepor_customreportformat_i_10df86ed_fk_features_` FOREIGN KEY (`customreportformat_id`) REFERENCES `features_customreportformat` (`id`),
  CONSTRAINT `features_customrepor_user_id_c6172d54_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_customreportformat_user`
--

LOCK TABLES `features_customreportformat_user` WRITE;
/*!40000 ALTER TABLE `features_customreportformat_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_customreportformat_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_dgclientsubscription`
--

DROP TABLE IF EXISTS `features_dgclientsubscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_dgclientsubscription` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dg_client_id` int NOT NULL,
  `subscription_plan_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `features_dgclientsub_dg_client_id_95684f07_fk_dashboard` (`dg_client_id`),
  KEY `features_dgclientsub_subscription_plan_id_79cef427_fk_features_` (`subscription_plan_id`),
  CONSTRAINT `features_dgclientsub_dg_client_id_95684f07_fk_dashboard` FOREIGN KEY (`dg_client_id`) REFERENCES `dashboards_dataglenclient` (`organization_ptr_id`),
  CONSTRAINT `features_dgclientsub_subscription_plan_id_79cef427_fk_features_` FOREIGN KEY (`subscription_plan_id`) REFERENCES `features_subscriptionplan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_dgclientsubscription`
--

LOCK TABLES `features_dgclientsubscription` WRITE;
/*!40000 ALTER TABLE `features_dgclientsubscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_dgclientsubscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_feature`
--

DROP TABLE IF EXISTS `features_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_feature` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `function_path` varchar(100) NOT NULL,
  `data_key_name` varchar(100) NOT NULL,
  `include_table` tinyint(1) NOT NULL,
  `feature_category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `features_feature_feature_category_id_9965dec8_fk_features_` (`feature_category_id`),
  CONSTRAINT `features_feature_feature_category_id_9965dec8_fk_features_` FOREIGN KEY (`feature_category_id`) REFERENCES `features_featurecategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_feature`
--

LOCK TABLES `features_feature` WRITE;
/*!40000 ALTER TABLE `features_feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_featurecategory`
--

DROP TABLE IF EXISTS `features_featurecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_featurecategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_featurecategory`
--

LOCK TABLES `features_featurecategory` WRITE;
/*!40000 ALTER TABLE `features_featurecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_featurecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_featureorder`
--

DROP TABLE IF EXISTS `features_featureorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_featureorder` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_number` int unsigned NOT NULL,
  `is_fixed` tinyint(1) NOT NULL,
  `features_id` bigint NOT NULL,
  `user_table_widgets_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `features_featureorde_user_table_widgets_i_2ed89425_fk_features_` (`user_table_widgets_id`),
  KEY `features_featureorde_features_id_7879cd13_fk_features_` (`features_id`),
  CONSTRAINT `features_featureorde_features_id_7879cd13_fk_features_` FOREIGN KEY (`features_id`) REFERENCES `features_feature` (`id`),
  CONSTRAINT `features_featureorde_user_table_widgets_i_2ed89425_fk_features_` FOREIGN KEY (`user_table_widgets_id`) REFERENCES `features_usertablewidgetsconfig` (`id`),
  CONSTRAINT `features_featureorder_chk_1` CHECK ((`order_number` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_featureorder`
--

LOCK TABLES `features_featureorder` WRITE;
/*!40000 ALTER TABLE `features_featureorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_featureorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_roleaccess`
--

DROP TABLE IF EXISTS `features_roleaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_roleaccess` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role` varchar(100) NOT NULL,
  `dg_client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `features_roleaccess_dg_client_id_c7760cfa_fk_dashboard` (`dg_client_id`),
  CONSTRAINT `features_roleaccess_dg_client_id_c7760cfa_fk_dashboard` FOREIGN KEY (`dg_client_id`) REFERENCES `dashboards_dataglenclient` (`organization_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_roleaccess`
--

LOCK TABLES `features_roleaccess` WRITE;
/*!40000 ALTER TABLE `features_roleaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_roleaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_roleaccess_features`
--

DROP TABLE IF EXISTS `features_roleaccess_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_roleaccess_features` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `roleaccess_id` bigint NOT NULL,
  `feature_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `features_roleaccess_feat_roleaccess_id_feature_id_40fd8527_uniq` (`roleaccess_id`,`feature_id`),
  KEY `features_roleaccess__feature_id_3088e4da_fk_features_` (`feature_id`),
  CONSTRAINT `features_roleaccess__feature_id_3088e4da_fk_features_` FOREIGN KEY (`feature_id`) REFERENCES `features_feature` (`id`),
  CONSTRAINT `features_roleaccess__roleaccess_id_aff03783_fk_features_` FOREIGN KEY (`roleaccess_id`) REFERENCES `features_roleaccess` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_roleaccess_features`
--

LOCK TABLES `features_roleaccess_features` WRITE;
/*!40000 ALTER TABLE `features_roleaccess_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_roleaccess_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_subscriptionplan`
--

DROP TABLE IF EXISTS `features_subscriptionplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_subscriptionplan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `dashboard_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `features_subscriptio_dashboard_id_050502a1_fk_dashboard` (`dashboard_id`),
  CONSTRAINT `features_subscriptio_dashboard_id_050502a1_fk_dashboard` FOREIGN KEY (`dashboard_id`) REFERENCES `dashboards_dashboard` (`organization_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_subscriptionplan`
--

LOCK TABLES `features_subscriptionplan` WRITE;
/*!40000 ALTER TABLE `features_subscriptionplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_subscriptionplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_subscriptionplan_features`
--

DROP TABLE IF EXISTS `features_subscriptionplan_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_subscriptionplan_features` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subscriptionplan_id` bigint NOT NULL,
  `feature_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `features_subscriptionpla_subscriptionplan_id_feat_4ee37ee6_uniq` (`subscriptionplan_id`,`feature_id`),
  KEY `features_subscriptio_feature_id_ec290a55_fk_features_` (`feature_id`),
  CONSTRAINT `features_subscriptio_feature_id_ec290a55_fk_features_` FOREIGN KEY (`feature_id`) REFERENCES `features_feature` (`id`),
  CONSTRAINT `features_subscriptio_subscriptionplan_id_2b374373_fk_features_` FOREIGN KEY (`subscriptionplan_id`) REFERENCES `features_subscriptionplan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_subscriptionplan_features`
--

LOCK TABLES `features_subscriptionplan_features` WRITE;
/*!40000 ALTER TABLE `features_subscriptionplan_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_subscriptionplan_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_usersolarplantwidgetsconfig`
--

DROP TABLE IF EXISTS `features_usersolarplantwidgetsconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_usersolarplantwidgetsconfig` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `config_name` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `features_usersolarplantw_user_id_config_name_2802698c_uniq` (`user_id`,`config_name`),
  CONSTRAINT `features_usersolarpl_user_id_f829e6f4_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_usersolarplantwidgetsconfig`
--

LOCK TABLES `features_usersolarplantwidgetsconfig` WRITE;
/*!40000 ALTER TABLE `features_usersolarplantwidgetsconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_usersolarplantwidgetsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_usersolarplantwidgetsconfig_plants`
--

DROP TABLE IF EXISTS `features_usersolarplantwidgetsconfig_plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_usersolarplantwidgetsconfig_plants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usersolarplantwidgetsconfig_id` bigint NOT NULL,
  `solarplant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `features_usersolarplantw_usersolarplantwidgetscon_0a471809_uniq` (`usersolarplantwidgetsconfig_id`,`solarplant_id`),
  KEY `features_usersolarpl_solarplant_id_6de5e724_fk_solarrms_` (`solarplant_id`),
  CONSTRAINT `features_usersolarpl_solarplant_id_6de5e724_fk_solarrms_` FOREIGN KEY (`solarplant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `features_usersolarpl_usersolarplantwidget_a66bf85a_fk_features_` FOREIGN KEY (`usersolarplantwidgetsconfig_id`) REFERENCES `features_usersolarplantwidgetsconfig` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_usersolarplantwidgetsconfig_plants`
--

LOCK TABLES `features_usersolarplantwidgetsconfig_plants` WRITE;
/*!40000 ALTER TABLE `features_usersolarplantwidgetsconfig_plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_usersolarplantwidgetsconfig_plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features_usertablewidgetsconfig`
--

DROP TABLE IF EXISTS `features_usertablewidgetsconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features_usertablewidgetsconfig` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `config_scope` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `features_usertablewidget_user_id_config_scope_cca15db4_uniq` (`user_id`,`config_scope`),
  CONSTRAINT `features_usertablewidgetsconfig_user_id_787184cf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features_usertablewidgetsconfig`
--

LOCK TABLES `features_usertablewidgetsconfig` WRITE;
/*!40000 ALTER TABLE `features_usertablewidgetsconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `features_usertablewidgetsconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_groupobjectpermission`
--

DROP TABLE IF EXISTS `guardian_groupobjectpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardian_groupobjectpermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq` (`group_id`,`permission_id`,`object_pk`),
  KEY `guardian_groupobject_permission_id_36572738_fk_auth_perm` (`permission_id`),
  KEY `guardian_gr_content_ae6aec_idx` (`content_type_id`,`object_pk`),
  CONSTRAINT `guardian_groupobject_content_type_id_7ade36b8_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `guardian_groupobject_group_id_4bbbfb62_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `guardian_groupobject_permission_id_36572738_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_groupobjectpermission`
--

LOCK TABLES `guardian_groupobjectpermission` WRITE;
/*!40000 ALTER TABLE `guardian_groupobjectpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardian_groupobjectpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guardian_userobjectpermission`
--

DROP TABLE IF EXISTS `guardian_userobjectpermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guardian_userobjectpermission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_pk` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq` (`user_id`,`permission_id`,`object_pk`),
  KEY `guardian_userobjectp_permission_id_71807bfc_fk_auth_perm` (`permission_id`),
  KEY `guardian_us_content_179ed2_idx` (`content_type_id`,`object_pk`),
  CONSTRAINT `guardian_userobjectp_content_type_id_2e892405_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `guardian_userobjectp_permission_id_71807bfc_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guardian_userobjectpermission`
--

LOCK TABLES `guardian_userobjectpermission` WRITE;
/*!40000 ALTER TABLE `guardian_userobjectpermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardian_userobjectpermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_alarmassociation`
--

DROP TABLE IF EXISTS `helpdesk_alarmassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_alarmassociation` (
  `baseeventassociation_ptr_id` bigint NOT NULL,
  `device_status_number` double NOT NULL,
  `alarm_code` varchar(20) DEFAULT NULL,
  `alarm_description` varchar(1000) DEFAULT NULL,
  `alarm_resolution` varchar(1000) DEFAULT NULL,
  `device_status_description` varchar(500) DEFAULT NULL,
  `expected_energy` double DEFAULT NULL,
  `actual_energy` double DEFAULT NULL,
  `ticket_association_id` bigint NOT NULL,
  PRIMARY KEY (`baseeventassociation_ptr_id`),
  KEY `helpdesk_alarmassoci_ticket_association_i_37aa5a58_fk_helpdesk_` (`ticket_association_id`),
  CONSTRAINT `helpdesk_alarmassoci_baseeventassociation_a4446d0f_fk_helpdesk_` FOREIGN KEY (`baseeventassociation_ptr_id`) REFERENCES `helpdesk_baseeventassociation` (`id`),
  CONSTRAINT `helpdesk_alarmassoci_ticket_association_i_37aa5a58_fk_helpdesk_` FOREIGN KEY (`ticket_association_id`) REFERENCES `helpdesk_ticketassociation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_alarmassociation`
--

LOCK TABLES `helpdesk_alarmassociation` WRITE;
/*!40000 ALTER TABLE `helpdesk_alarmassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_alarmassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_analyticsassociation`
--

DROP TABLE IF EXISTS `helpdesk_analyticsassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_analyticsassociation` (
  `baseeventassociation_ptr_id` bigint NOT NULL,
  `st` datetime(6) NOT NULL,
  `et` datetime(6) NOT NULL,
  `delta_energy` double DEFAULT NULL,
  `delta_current` double DEFAULT NULL,
  `actual_power` double DEFAULT NULL,
  `mean_power` double DEFAULT NULL,
  `delta_power` double DEFAULT NULL,
  `mean_energy` double DEFAULT NULL,
  `mean_current` double DEFAULT NULL,
  `actual_energy` double DEFAULT NULL,
  `expected_energy` double DEFAULT NULL,
  `actual_current` double DEFAULT NULL,
  `residual` double DEFAULT NULL,
  `mean_voltage` double DEFAULT NULL,
  `ticket_association_id` bigint NOT NULL,
  PRIMARY KEY (`baseeventassociation_ptr_id`),
  KEY `helpdesk_analyticsas_ticket_association_i_78ae075c_fk_helpdesk_` (`ticket_association_id`),
  CONSTRAINT `helpdesk_analyticsas_baseeventassociation_98373713_fk_helpdesk_` FOREIGN KEY (`baseeventassociation_ptr_id`) REFERENCES `helpdesk_baseeventassociation` (`id`),
  CONSTRAINT `helpdesk_analyticsas_ticket_association_i_78ae075c_fk_helpdesk_` FOREIGN KEY (`ticket_association_id`) REFERENCES `helpdesk_ticketassociation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_analyticsassociation`
--

LOCK TABLES `helpdesk_analyticsassociation` WRITE;
/*!40000 ALTER TABLE `helpdesk_analyticsassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_analyticsassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_attachment`
--

DROP TABLE IF EXISTS `helpdesk_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_attachment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(1000) NOT NULL,
  `filename` varchar(1000) NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `size` int NOT NULL,
  `followup_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_attachment_followup_id_bed12db9_fk_helpdesk_followup_id` (`followup_id`),
  CONSTRAINT `helpdesk_attachment_followup_id_bed12db9_fk_helpdesk_followup_id` FOREIGN KEY (`followup_id`) REFERENCES `helpdesk_followup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_attachment`
--

LOCK TABLES `helpdesk_attachment` WRITE;
/*!40000 ALTER TABLE `helpdesk_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_baseeventassociation`
--

DROP TABLE IF EXISTS `helpdesk_baseeventassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_baseeventassociation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `closed` datetime(6) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `energy_loss` double DEFAULT NULL,
  `energy_loss_cause` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_baseeventassociation_identifier_fc108163` (`identifier`),
  KEY `helpdesk_baseeventassociation_created_f0bed345` (`created`),
  KEY `helpdesk_baseeventassociation_updated_3d1e8988` (`updated`),
  KEY `helpdesk_baseeventassociation_closed_a23fe634` (`closed`),
  KEY `helpdesk_baseeventassociation_active_2d82aaa4` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_baseeventassociation`
--

LOCK TABLES `helpdesk_baseeventassociation` WRITE;
/*!40000 ALTER TABLE `helpdesk_baseeventassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_baseeventassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_customfield`
--

DROP TABLE IF EXISTS `helpdesk_customfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_customfield` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `label` varchar(30) NOT NULL,
  `help_text` longtext,
  `data_type` varchar(100) NOT NULL,
  `max_length` int DEFAULT NULL,
  `decimal_places` int DEFAULT NULL,
  `empty_selection_list` tinyint(1) NOT NULL,
  `list_values` longtext,
  `ordering` int DEFAULT NULL,
  `required` tinyint(1) NOT NULL,
  `staff_only` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_customfield`
--

LOCK TABLES `helpdesk_customfield` WRITE;
/*!40000 ALTER TABLE `helpdesk_customfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_customfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_emailtemplate`
--

DROP TABLE IF EXISTS `helpdesk_emailtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_emailtemplate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `heading` varchar(100) NOT NULL,
  `plain_text` longtext NOT NULL,
  `html` longtext NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_emailtemplate`
--

LOCK TABLES `helpdesk_emailtemplate` WRITE;
/*!40000 ALTER TABLE `helpdesk_emailtemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_emailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_escalationexclusion`
--

DROP TABLE IF EXISTS `helpdesk_escalationexclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_escalationexclusion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_escalationexclusion`
--

LOCK TABLES `helpdesk_escalationexclusion` WRITE;
/*!40000 ALTER TABLE `helpdesk_escalationexclusion` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_escalationexclusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_escalationexclusion_queues`
--

DROP TABLE IF EXISTS `helpdesk_escalationexclusion_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_escalationexclusion_queues` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `escalationexclusion_id` bigint NOT NULL,
  `queue_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `helpdesk_escalationexclu_escalationexclusion_id_q_f8f19aff_uniq` (`escalationexclusion_id`,`queue_id`),
  KEY `helpdesk_escalatione_queue_id_ed8d4906_fk_helpdesk_` (`queue_id`),
  CONSTRAINT `helpdesk_escalatione_escalationexclusion__62556c07_fk_helpdesk_` FOREIGN KEY (`escalationexclusion_id`) REFERENCES `helpdesk_escalationexclusion` (`id`),
  CONSTRAINT `helpdesk_escalatione_queue_id_ed8d4906_fk_helpdesk_` FOREIGN KEY (`queue_id`) REFERENCES `helpdesk_queue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_escalationexclusion_queues`
--

LOCK TABLES `helpdesk_escalationexclusion_queues` WRITE;
/*!40000 ALTER TABLE `helpdesk_escalationexclusion_queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_escalationexclusion_queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_followup`
--

DROP TABLE IF EXISTS `helpdesk_followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_followup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `comment` longtext,
  `public` tinyint(1) NOT NULL,
  `new_status` int DEFAULT NULL,
  `ticket_id` bigint NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_followup_ticket_id_3db2d079_fk_helpdesk_ticket_id` (`ticket_id`),
  KEY `helpdesk_followup_user_id_5b9c07e3_fk_auth_user_id` (`user_id`),
  CONSTRAINT `helpdesk_followup_ticket_id_3db2d079_fk_helpdesk_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `helpdesk_ticket` (`id`),
  CONSTRAINT `helpdesk_followup_user_id_5b9c07e3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_followup`
--

LOCK TABLES `helpdesk_followup` WRITE;
/*!40000 ALTER TABLE `helpdesk_followup` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_ignoreemail`
--

DROP TABLE IF EXISTS `helpdesk_ignoreemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_ignoreemail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `email_address` varchar(150) NOT NULL,
  `keep_in_mailbox` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_ignoreemail`
--

LOCK TABLES `helpdesk_ignoreemail` WRITE;
/*!40000 ALTER TABLE `helpdesk_ignoreemail` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_ignoreemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_ignoreemail_queues`
--

DROP TABLE IF EXISTS `helpdesk_ignoreemail_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_ignoreemail_queues` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ignoreemail_id` bigint NOT NULL,
  `queue_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `helpdesk_ignoreemail_que_ignoreemail_id_queue_id_b3c79ff5_uniq` (`ignoreemail_id`,`queue_id`),
  KEY `helpdesk_ignoreemail_queue_id_73141496_fk_helpdesk_` (`queue_id`),
  CONSTRAINT `helpdesk_ignoreemail_ignoreemail_id_f6fcd398_fk_helpdesk_` FOREIGN KEY (`ignoreemail_id`) REFERENCES `helpdesk_ignoreemail` (`id`),
  CONSTRAINT `helpdesk_ignoreemail_queue_id_73141496_fk_helpdesk_` FOREIGN KEY (`queue_id`) REFERENCES `helpdesk_queue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_ignoreemail_queues`
--

LOCK TABLES `helpdesk_ignoreemail_queues` WRITE;
/*!40000 ALTER TABLE `helpdesk_ignoreemail_queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_ignoreemail_queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_kbcategory`
--

DROP TABLE IF EXISTS `helpdesk_kbcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_kbcategory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_kbcategory_slug_5922579d` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_kbcategory`
--

LOCK TABLES `helpdesk_kbcategory` WRITE;
/*!40000 ALTER TABLE `helpdesk_kbcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_kbcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_kbitem`
--

DROP TABLE IF EXISTS `helpdesk_kbitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_kbitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `question` longtext NOT NULL,
  `answer` longtext NOT NULL,
  `votes` int NOT NULL,
  `recommendations` int NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_kbitem_category_id_14a1b130_fk_helpdesk_kbcategory_id` (`category_id`),
  CONSTRAINT `helpdesk_kbitem_category_id_14a1b130_fk_helpdesk_kbcategory_id` FOREIGN KEY (`category_id`) REFERENCES `helpdesk_kbcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_kbitem`
--

LOCK TABLES `helpdesk_kbitem` WRITE;
/*!40000 ALTER TABLE `helpdesk_kbitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_kbitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_presetreply`
--

DROP TABLE IF EXISTS `helpdesk_presetreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_presetreply` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_presetreply`
--

LOCK TABLES `helpdesk_presetreply` WRITE;
/*!40000 ALTER TABLE `helpdesk_presetreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_presetreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_presetreply_queues`
--

DROP TABLE IF EXISTS `helpdesk_presetreply_queues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_presetreply_queues` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `presetreply_id` bigint NOT NULL,
  `queue_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `helpdesk_presetreply_que_presetreply_id_queue_id_805647a1_uniq` (`presetreply_id`,`queue_id`),
  KEY `helpdesk_presetreply_queue_id_b90d97e8_fk_helpdesk_` (`queue_id`),
  CONSTRAINT `helpdesk_presetreply_presetreply_id_9e5e7b10_fk_helpdesk_` FOREIGN KEY (`presetreply_id`) REFERENCES `helpdesk_presetreply` (`id`),
  CONSTRAINT `helpdesk_presetreply_queue_id_b90d97e8_fk_helpdesk_` FOREIGN KEY (`queue_id`) REFERENCES `helpdesk_queue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_presetreply_queues`
--

LOCK TABLES `helpdesk_presetreply_queues` WRITE;
/*!40000 ALTER TABLE `helpdesk_presetreply_queues` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_presetreply_queues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_queue`
--

DROP TABLE IF EXISTS `helpdesk_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_queue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `email_address` varchar(254) DEFAULT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `allow_public_submission` tinyint(1) NOT NULL,
  `allow_email_submission` tinyint(1) NOT NULL,
  `escalate_days` int DEFAULT NULL,
  `new_ticket_cc` varchar(200) DEFAULT NULL,
  `new_ticket_sms` varchar(200) DEFAULT NULL,
  `updated_ticket_cc` varchar(200) DEFAULT NULL,
  `email_box_type` varchar(5) DEFAULT NULL,
  `email_box_host` varchar(200) DEFAULT NULL,
  `email_box_port` int DEFAULT NULL,
  `email_box_ssl` tinyint(1) NOT NULL,
  `email_box_user` varchar(200) DEFAULT NULL,
  `email_box_pass` varchar(200) DEFAULT NULL,
  `email_box_imap_folder` varchar(100) DEFAULT NULL,
  `permission_name` varchar(50) DEFAULT NULL,
  `email_box_interval` int DEFAULT NULL,
  `email_box_last_check` datetime(6) DEFAULT NULL,
  `socks_proxy_type` varchar(8) DEFAULT NULL,
  `socks_proxy_host` char(39) DEFAULT NULL,
  `socks_proxy_port` int DEFAULT NULL,
  `default_owner_id` int DEFAULT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `helpdesk_queue_default_owner_id_b0930a66_fk_auth_user_id` (`default_owner_id`),
  KEY `helpdesk_queue_plant_id_f1ec95f7_fk_solarrms_` (`plant_id`),
  CONSTRAINT `helpdesk_queue_default_owner_id_b0930a66_fk_auth_user_id` FOREIGN KEY (`default_owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `helpdesk_queue_plant_id_f1ec95f7_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_queue`
--

LOCK TABLES `helpdesk_queue` WRITE;
/*!40000 ALTER TABLE `helpdesk_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_savedsearch`
--

DROP TABLE IF EXISTS `helpdesk_savedsearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_savedsearch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `shared` tinyint(1) NOT NULL,
  `query` longtext NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_savedsearch_user_id_24cf33b5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `helpdesk_savedsearch_user_id_24cf33b5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_savedsearch`
--

LOCK TABLES `helpdesk_savedsearch` WRITE;
/*!40000 ALTER TABLE `helpdesk_savedsearch` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_savedsearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_sladefinition`
--

DROP TABLE IF EXISTS `helpdesk_sladefinition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_sladefinition` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `priority` int NOT NULL,
  `level` int NOT NULL,
  `SLA` int NOT NULL,
  `escalate_to_email` varchar(254) DEFAULT NULL,
  `escalate_to_phone` varchar(15) DEFAULT NULL,
  `queue_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `helpdesk_sladefinition_queue_id_priority_level__380da271_uniq` (`queue_id`,`priority`,`level`,`escalate_to_email`),
  CONSTRAINT `helpdesk_sladefinition_queue_id_60122128_fk_helpdesk_queue_id` FOREIGN KEY (`queue_id`) REFERENCES `helpdesk_queue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_sladefinition`
--

LOCK TABLES `helpdesk_sladefinition` WRITE;
/*!40000 ALTER TABLE `helpdesk_sladefinition` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_sladefinition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_ticket`
--

DROP TABLE IF EXISTS `helpdesk_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(400) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `submitter_email` varchar(254) DEFAULT NULL,
  `status` int NOT NULL,
  `on_hold` tinyint(1) NOT NULL,
  `description` longtext,
  `resolution` longtext,
  `priority` int NOT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `last_escalation` datetime(6) DEFAULT NULL,
  `escalation_level` int DEFAULT NULL,
  `event_type` varchar(50) NOT NULL,
  `energy_loss` double DEFAULT NULL,
  `energy_loss_cause` varchar(50) DEFAULT NULL,
  `expected_energy` double DEFAULT NULL,
  `actual_energy` double DEFAULT NULL,
  `assigned_to_id` int DEFAULT NULL,
  `queue_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_ticket_assigned_to_id_0716992e_fk_auth_user_id` (`assigned_to_id`),
  KEY `helpdesk_ticket_queue_id_9b210169_fk_helpdesk_queue_id` (`queue_id`),
  KEY `helpdesk_ticket_created_cb17d678` (`created`),
  KEY `helpdesk_ticket_modified_92bc0683` (`modified`),
  KEY `helpdesk_ticket_status_d9beeff6` (`status`),
  KEY `helpdesk_ticket_event_type_86e816f1` (`event_type`),
  CONSTRAINT `helpdesk_ticket_assigned_to_id_0716992e_fk_auth_user_id` FOREIGN KEY (`assigned_to_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `helpdesk_ticket_queue_id_9b210169_fk_helpdesk_queue_id` FOREIGN KEY (`queue_id`) REFERENCES `helpdesk_queue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_ticket`
--

LOCK TABLES `helpdesk_ticket` WRITE;
/*!40000 ALTER TABLE `helpdesk_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_ticketassociation`
--

DROP TABLE IF EXISTS `helpdesk_ticketassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_ticketassociation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `identifier` varchar(200) NOT NULL,
  `identifier_name` varchar(200) DEFAULT NULL,
  `event_type` varchar(50) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) DEFAULT NULL,
  `energy_loss` double DEFAULT NULL,
  `energy_loss_cause` varchar(50) DEFAULT NULL,
  `expected_energy` double DEFAULT NULL,
  `actual_energy` double DEFAULT NULL,
  `closed` datetime(6) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `ticket_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_ticketassoc_ticket_id_247e4b5a_fk_helpdesk_` (`ticket_id`),
  KEY `helpdesk_ticketassociation_identifier_e6340d83` (`identifier`),
  KEY `helpdesk_ticketassociation_event_type_65910a7e` (`event_type`),
  KEY `helpdesk_ticketassociation_created_8fb7daef` (`created`),
  KEY `helpdesk_ticketassociation_updated_28e6cc12` (`updated`),
  KEY `helpdesk_ticketassociation_closed_b7fa1ce3` (`closed`),
  CONSTRAINT `helpdesk_ticketassoc_ticket_id_247e4b5a_fk_helpdesk_` FOREIGN KEY (`ticket_id`) REFERENCES `helpdesk_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_ticketassociation`
--

LOCK TABLES `helpdesk_ticketassociation` WRITE;
/*!40000 ALTER TABLE `helpdesk_ticketassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_ticketassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_ticketcc`
--

DROP TABLE IF EXISTS `helpdesk_ticketcc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_ticketcc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) DEFAULT NULL,
  `can_view` tinyint(1) NOT NULL,
  `can_update` tinyint(1) NOT NULL,
  `ticket_id` bigint NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_ticketcc_ticket_id_4e774289_fk_helpdesk_ticket_id` (`ticket_id`),
  KEY `helpdesk_ticketcc_user_id_d811c3c2_fk_auth_user_id` (`user_id`),
  CONSTRAINT `helpdesk_ticketcc_ticket_id_4e774289_fk_helpdesk_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `helpdesk_ticket` (`id`),
  CONSTRAINT `helpdesk_ticketcc_user_id_d811c3c2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_ticketcc`
--

LOCK TABLES `helpdesk_ticketcc` WRITE;
/*!40000 ALTER TABLE `helpdesk_ticketcc` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_ticketcc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_ticketchange`
--

DROP TABLE IF EXISTS `helpdesk_ticketchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_ticketchange` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `field` varchar(100) NOT NULL,
  `old_value` longtext,
  `new_value` longtext,
  `followup_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_ticketchang_followup_id_2e4e87bc_fk_helpdesk_` (`followup_id`),
  CONSTRAINT `helpdesk_ticketchang_followup_id_2e4e87bc_fk_helpdesk_` FOREIGN KEY (`followup_id`) REFERENCES `helpdesk_followup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_ticketchange`
--

LOCK TABLES `helpdesk_ticketchange` WRITE;
/*!40000 ALTER TABLE `helpdesk_ticketchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_ticketchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_ticketcustomfieldvalue`
--

DROP TABLE IF EXISTS `helpdesk_ticketcustomfieldvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_ticketcustomfieldvalue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` longtext,
  `field_id` bigint NOT NULL,
  `ticket_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `helpdesk_ticketcusto_field_id_fd61fcda_fk_helpdesk_` (`field_id`),
  KEY `helpdesk_ticketcusto_ticket_id_4e2fe33a_fk_helpdesk_` (`ticket_id`),
  CONSTRAINT `helpdesk_ticketcusto_field_id_fd61fcda_fk_helpdesk_` FOREIGN KEY (`field_id`) REFERENCES `helpdesk_customfield` (`id`),
  CONSTRAINT `helpdesk_ticketcusto_ticket_id_4e2fe33a_fk_helpdesk_` FOREIGN KEY (`ticket_id`) REFERENCES `helpdesk_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_ticketcustomfieldvalue`
--

LOCK TABLES `helpdesk_ticketcustomfieldvalue` WRITE;
/*!40000 ALTER TABLE `helpdesk_ticketcustomfieldvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_ticketcustomfieldvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_ticketdependency`
--

DROP TABLE IF EXISTS `helpdesk_ticketdependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_ticketdependency` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `depends_on_id` bigint NOT NULL,
  `ticket_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `helpdesk_ticketdependency_ticket_id_depends_on_id_43caa9be_uniq` (`ticket_id`,`depends_on_id`),
  KEY `helpdesk_ticketdepen_depends_on_id_e310efa4_fk_helpdesk_` (`depends_on_id`),
  CONSTRAINT `helpdesk_ticketdepen_depends_on_id_e310efa4_fk_helpdesk_` FOREIGN KEY (`depends_on_id`) REFERENCES `helpdesk_ticket` (`id`),
  CONSTRAINT `helpdesk_ticketdepen_ticket_id_618bbe6b_fk_helpdesk_` FOREIGN KEY (`ticket_id`) REFERENCES `helpdesk_ticket` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_ticketdependency`
--

LOCK TABLES `helpdesk_ticketdependency` WRITE;
/*!40000 ALTER TABLE `helpdesk_ticketdependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpdesk_ticketdependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `helpdesk_usersettings`
--

DROP TABLE IF EXISTS `helpdesk_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helpdesk_usersettings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `settings_pickled` longtext,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `helpdesk_usersettings_user_id_58123c87_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpdesk_usersettings`
--

LOCK TABLES `helpdesk_usersettings` WRITE;
/*!40000 ALTER TABLE `helpdesk_usersettings` DISABLE KEYS */;
INSERT INTO `helpdesk_usersettings` VALUES (1,'b\'gASVngAAAAAAAAB9lCiMFnVzZV9lbWFpbF9hc19zdWJtaXR0ZXKUiIwWZW1haWxfb25fdGlja2V0X2Fzc2lnbpSIjBZlbWFpbF9vbl90aWNrZXRfY2hhbmdllIiMFWxvZ2luX3ZpZXdfdGlja2V0bGlzdJSIjBllbWFpbF9vbl90aWNrZXRfYXBpY2hhbmdllIiMEHRpY2tldHNfcGVyX3BhZ2WUSxl1Lg==\'',1);
/*!40000 ALTER TABLE `helpdesk_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioelab_invite`
--

DROP TABLE IF EXISTS `ioelab_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ioelab_invite` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `UID` varchar(12) NOT NULL,
  `emailid` varchar(100) NOT NULL,
  `status` smallint unsigned NOT NULL,
  `inviteTime` datetime(6) NOT NULL,
  `default_load` tinyint(1) NOT NULL,
  `invitee_id` int NOT NULL,
  `source_id` varchar(43) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ioelab_invite_UID_emailid_status_a6357ffa_uniq` (`UID`,`emailid`,`status`),
  KEY `ioelab_invite_invitee_id_aba0f7d3_fk_auth_user_id` (`invitee_id`),
  KEY `ioelab_invite_source_id_61e00cab_fk_dataglen_sensor_sourceKey` (`source_id`),
  CONSTRAINT `ioelab_invite_invitee_id_aba0f7d3_fk_auth_user_id` FOREIGN KEY (`invitee_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `ioelab_invite_source_id_61e00cab_fk_dataglen_sensor_sourceKey` FOREIGN KEY (`source_id`) REFERENCES `dataglen_sensor` (`sourceKey`),
  CONSTRAINT `ioelab_invite_chk_1` CHECK ((`status` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioelab_invite`
--

LOCK TABLES `ioelab_invite` WRITE;
/*!40000 ALTER TABLE `ioelab_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioelab_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ioelab_validuid`
--

DROP TABLE IF EXISTS `ioelab_validuid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ioelab_validuid` (
  `UID` varchar(12) NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ioelab_validuid`
--

LOCK TABLES `ioelab_validuid` WRITE;
/*!40000 ALTER TABLE `ioelab_validuid` DISABLE KEYS */;
/*!40000 ALTER TABLE `ioelab_validuid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_installation`
--

DROP TABLE IF EXISTS `license_installation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_installation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `installation_key` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `installation_name` varchar(255) NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `install_ts` datetime(6) NOT NULL,
  `updated_ts` datetime(6) DEFAULT NULL,
  `active_installation` tinyint(1) NOT NULL,
  `license_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `installation_key` (`installation_key`),
  KEY `license_installation_license_id_1e84a6cc_fk_license_l` (`license_id`),
  CONSTRAINT `license_installation_license_id_1e84a6cc_fk_license_l` FOREIGN KEY (`license_id`) REFERENCES `license_license` (`license_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_installation`
--

LOCK TABLES `license_installation` WRITE;
/*!40000 ALTER TABLE `license_installation` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_installation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license_license`
--

DROP TABLE IF EXISTS `license_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_license` (
  `license_key` varchar(255) NOT NULL,
  `installations_limit` int NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  PRIMARY KEY (`license_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_license`
--

LOCK TABLES `license_license` WRITE;
/*!40000 ALTER TABLE `license_license` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microgrid_battery`
--

DROP TABLE IF EXISTS `microgrid_battery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `microgrid_battery` (
  `independentinverter_ptr_id` bigint NOT NULL,
  `controllable` tinyint(1) NOT NULL,
  PRIMARY KEY (`independentinverter_ptr_id`),
  CONSTRAINT `microgrid_battery_independentinverter__32c87c53_fk_solarrms_` FOREIGN KEY (`independentinverter_ptr_id`) REFERENCES `solarrms_independentinverter` (`sensor_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microgrid_battery`
--

LOCK TABLES `microgrid_battery` WRITE;
/*!40000 ALTER TABLE `microgrid_battery` DISABLE KEYS */;
/*!40000 ALTER TABLE `microgrid_battery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microgrid_battery_charge_controller`
--

DROP TABLE IF EXISTS `microgrid_battery_charge_controller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `microgrid_battery_charge_controller` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `battery_id` bigint NOT NULL,
  `chargecontroller_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `microgrid_battery_charge_battery_id_chargecontrol_a3f3df70_uniq` (`battery_id`,`chargecontroller_id`),
  KEY `microgrid_battery_ch_chargecontroller_id_8d886a68_fk_microgrid` (`chargecontroller_id`),
  CONSTRAINT `microgrid_battery_ch_battery_id_a2dac416_fk_microgrid` FOREIGN KEY (`battery_id`) REFERENCES `microgrid_battery` (`independentinverter_ptr_id`),
  CONSTRAINT `microgrid_battery_ch_chargecontroller_id_8d886a68_fk_microgrid` FOREIGN KEY (`chargecontroller_id`) REFERENCES `microgrid_chargecontroller` (`sensor_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microgrid_battery_charge_controller`
--

LOCK TABLES `microgrid_battery_charge_controller` WRITE;
/*!40000 ALTER TABLE `microgrid_battery_charge_controller` DISABLE KEYS */;
/*!40000 ALTER TABLE `microgrid_battery_charge_controller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microgrid_chargecontroller`
--

DROP TABLE IF EXISTS `microgrid_chargecontroller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `microgrid_chargecontroller` (
  `sensor_ptr_id` bigint NOT NULL,
  `is_master` tinyint(1) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `microgrid_chargecont_plant_id_87a2e1e8_fk_solarrms_` (`plant_id`),
  CONSTRAINT `microgrid_chargecont_plant_id_87a2e1e8_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `microgrid_chargecont_sensor_ptr_id_1a0f1932_fk_dataglen_` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microgrid_chargecontroller`
--

LOCK TABLES `microgrid_chargecontroller` WRITE;
/*!40000 ALTER TABLE `microgrid_chargecontroller` DISABLE KEYS */;
/*!40000 ALTER TABLE `microgrid_chargecontroller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microgrid_connectedload`
--

DROP TABLE IF EXISTS `microgrid_connectedload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `microgrid_connectedload` (
  `independentinverter_ptr_id` bigint NOT NULL,
  `load_voltage` double NOT NULL,
  `charge_controller_id` bigint NOT NULL,
  PRIMARY KEY (`independentinverter_ptr_id`),
  KEY `microgrid_connectedl_charge_controller_id_b7c4f627_fk_microgrid` (`charge_controller_id`),
  CONSTRAINT `microgrid_connectedl_charge_controller_id_b7c4f627_fk_microgrid` FOREIGN KEY (`charge_controller_id`) REFERENCES `microgrid_chargecontroller` (`sensor_ptr_id`),
  CONSTRAINT `microgrid_connectedl_independentinverter__e0610560_fk_solarrms_` FOREIGN KEY (`independentinverter_ptr_id`) REFERENCES `solarrms_independentinverter` (`sensor_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microgrid_connectedload`
--

LOCK TABLES `microgrid_connectedload` WRITE;
/*!40000 ALTER TABLE `microgrid_connectedload` DISABLE KEYS */;
/*!40000 ALTER TABLE `microgrid_connectedload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `microgrid_panelset`
--

DROP TABLE IF EXISTS `microgrid_panelset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `microgrid_panelset` (
  `independentinverter_ptr_id` bigint NOT NULL,
  `no_of_panels` int NOT NULL,
  `charge_controller_id` bigint NOT NULL,
  PRIMARY KEY (`independentinverter_ptr_id`),
  KEY `microgrid_panelset_charge_controller_id_c67709b0_fk_microgrid` (`charge_controller_id`),
  CONSTRAINT `microgrid_panelset_charge_controller_id_c67709b0_fk_microgrid` FOREIGN KEY (`charge_controller_id`) REFERENCES `microgrid_chargecontroller` (`sensor_ptr_id`),
  CONSTRAINT `microgrid_panelset_independentinverter__0b18b336_fk_solarrms_` FOREIGN KEY (`independentinverter_ptr_id`) REFERENCES `solarrms_independentinverter` (`sensor_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `microgrid_panelset`
--

LOCK TABLES `microgrid_panelset` WRITE;
/*!40000 ALTER TABLE `microgrid_panelset` DISABLE KEYS */;
/*!40000 ALTER TABLE `microgrid_panelset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oandmmanager_cycle`
--

DROP TABLE IF EXISTS `oandmmanager_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oandmmanager_cycle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `alert_date` datetime(6) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `preferences_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oandmmanager_cycle_preferences_id_start_dat_e1caaca3_uniq` (`preferences_id`,`start_date`,`end_date`),
  CONSTRAINT `oandmmanager_cycle_preferences_id_486c9146_fk_oandmmana` FOREIGN KEY (`preferences_id`) REFERENCES `oandmmanager_preferences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oandmmanager_cycle`
--

LOCK TABLES `oandmmanager_cycle` WRITE;
/*!40000 ALTER TABLE `oandmmanager_cycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `oandmmanager_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oandmmanager_preferences`
--

DROP TABLE IF EXISTS `oandmmanager_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oandmmanager_preferences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ed` varchar(2) NOT NULL,
  `sd` varchar(2) NOT NULL,
  `alert_date` varchar(2) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oandmmanager_prefere_plant_id_a36c5feb_fk_solarrms_` (`plant_id`),
  CONSTRAINT `oandmmanager_prefere_plant_id_a36c5feb_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oandmmanager_preferences`
--

LOCK TABLES `oandmmanager_preferences` WRITE;
/*!40000 ALTER TABLE `oandmmanager_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `oandmmanager_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oandmmanager_preferences_associated_tasks`
--

DROP TABLE IF EXISTS `oandmmanager_preferences_associated_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oandmmanager_preferences_associated_tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `preferences_id` bigint NOT NULL,
  `tasks_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oandmmanager_preferences_preferences_id_tasks_id_5186e111_uniq` (`preferences_id`,`tasks_id`),
  KEY `oandmmanager_prefere_tasks_id_7fc5265c_fk_oandmmana` (`tasks_id`),
  CONSTRAINT `oandmmanager_prefere_preferences_id_f71e4818_fk_oandmmana` FOREIGN KEY (`preferences_id`) REFERENCES `oandmmanager_preferences` (`id`),
  CONSTRAINT `oandmmanager_prefere_tasks_id_7fc5265c_fk_oandmmana` FOREIGN KEY (`tasks_id`) REFERENCES `oandmmanager_tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oandmmanager_preferences_associated_tasks`
--

LOCK TABLES `oandmmanager_preferences_associated_tasks` WRITE;
/*!40000 ALTER TABLE `oandmmanager_preferences_associated_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oandmmanager_preferences_associated_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oandmmanager_taskassociation`
--

DROP TABLE IF EXISTS `oandmmanager_taskassociation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oandmmanager_taskassociation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` longblob NOT NULL,
  `opened_at` datetime(6) DEFAULT NULL,
  `closed_at` datetime(6) DEFAULT NULL,
  `sensor_id` bigint NOT NULL,
  `task_item_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oandmmanager_taskass_sensor_id_671c1c83_fk_dataglen_` (`sensor_id`),
  KEY `oandmmanager_taskass_task_item_id_e0ce8905_fk_oandmmana` (`task_item_id`),
  CONSTRAINT `oandmmanager_taskass_sensor_id_671c1c83_fk_dataglen_` FOREIGN KEY (`sensor_id`) REFERENCES `dataglen_sensor` (`id`),
  CONSTRAINT `oandmmanager_taskass_task_item_id_e0ce8905_fk_oandmmana` FOREIGN KEY (`task_item_id`) REFERENCES `oandmmanager_taskitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oandmmanager_taskassociation`
--

LOCK TABLES `oandmmanager_taskassociation` WRITE;
/*!40000 ALTER TABLE `oandmmanager_taskassociation` DISABLE KEYS */;
/*!40000 ALTER TABLE `oandmmanager_taskassociation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oandmmanager_taskitem`
--

DROP TABLE IF EXISTS `oandmmanager_taskitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oandmmanager_taskitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` longtext,
  `scheduled_start_date` datetime(6) NOT NULL,
  `scheduled_closing_date` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `closed_at` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `time` varchar(50) NOT NULL,
  `is_custom` tinyint(1) NOT NULL,
  `description` longtext,
  `assigned_to_id` int NOT NULL,
  `cycle_id` bigint NOT NULL,
  `task_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oandmmanager_taskitem_cycle_id_task_id_schedul_4f281122_uniq` (`cycle_id`,`task_id`,`scheduled_start_date`,`scheduled_closing_date`),
  KEY `oandmmanager_taskitem_assigned_to_id_b7052c70_fk_auth_user_id` (`assigned_to_id`),
  KEY `oandmmanager_taskitem_task_id_ba066c67_fk_oandmmanager_tasks_id` (`task_id`),
  CONSTRAINT `oandmmanager_taskitem_assigned_to_id_b7052c70_fk_auth_user_id` FOREIGN KEY (`assigned_to_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `oandmmanager_taskitem_cycle_id_95322dfc_fk_oandmmanager_cycle_id` FOREIGN KEY (`cycle_id`) REFERENCES `oandmmanager_cycle` (`id`),
  CONSTRAINT `oandmmanager_taskitem_task_id_ba066c67_fk_oandmmanager_tasks_id` FOREIGN KEY (`task_id`) REFERENCES `oandmmanager_tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oandmmanager_taskitem`
--

LOCK TABLES `oandmmanager_taskitem` WRITE;
/*!40000 ALTER TABLE `oandmmanager_taskitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `oandmmanager_taskitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oandmmanager_tasks`
--

DROP TABLE IF EXISTS `oandmmanager_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oandmmanager_tasks` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `frequency` varchar(50) NOT NULL,
  `recurring` varchar(50) NOT NULL,
  `time` varchar(50) NOT NULL,
  `associated_devices` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oandmmanager_tasks_name_frequency_recurring_1939bb15_uniq` (`name`,`frequency`,`recurring`,`time`,`associated_devices`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oandmmanager_tasks`
--

LOCK TABLES `oandmmanager_tasks` WRITE;
/*!40000 ALTER TABLE `oandmmanager_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oandmmanager_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_organization`
--

DROP TABLE IF EXISTS `organizations_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations_organization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `slug` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_organization`
--

LOCK TABLES `organizations_organization` WRITE;
/*!40000 ALTER TABLE `organizations_organization` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_organizationinvitation`
--

DROP TABLE IF EXISTS `organizations_organizationinvitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations_organizationinvitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `guid` char(32) NOT NULL,
  `invitee_identifier` varchar(1000) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `invited_by_id` int NOT NULL,
  `invitee_id` int DEFAULT NULL,
  `organization_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organizations_organi_invited_by_id_ce048629_fk_auth_user` (`invited_by_id`),
  KEY `organizations_organi_invitee_id_9264ee07_fk_auth_user` (`invitee_id`),
  KEY `organizations_organi_organization_id_cec602af_fk_organizat` (`organization_id`),
  CONSTRAINT `organizations_organi_invited_by_id_ce048629_fk_auth_user` FOREIGN KEY (`invited_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `organizations_organi_invitee_id_9264ee07_fk_auth_user` FOREIGN KEY (`invitee_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `organizations_organi_organization_id_cec602af_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_organizationinvitation`
--

LOCK TABLES `organizations_organizationinvitation` WRITE;
/*!40000 ALTER TABLE `organizations_organizationinvitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_organizationinvitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_organizationowner`
--

DROP TABLE IF EXISTS `organizations_organizationowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations_organizationowner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `organization_id` int NOT NULL,
  `organization_user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organization_id` (`organization_id`),
  UNIQUE KEY `organization_user_id` (`organization_user_id`),
  CONSTRAINT `organizations_organi_organization_id_7e98f9c0_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`),
  CONSTRAINT `organizations_organi_organization_user_id_c9c76850_fk_organizat` FOREIGN KEY (`organization_user_id`) REFERENCES `organizations_organizationuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_organizationowner`
--

LOCK TABLES `organizations_organizationowner` WRITE;
/*!40000 ALTER TABLE `organizations_organizationowner` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_organizationowner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations_organizationuser`
--

DROP TABLE IF EXISTS `organizations_organizationuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations_organizationuser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `organization_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_organizati_user_id_organization_id_dd2bc761_uniq` (`user_id`,`organization_id`),
  KEY `organizations_organi_organization_id_5376c939_fk_organizat` (`organization_id`),
  CONSTRAINT `organizations_organi_organization_id_5376c939_fk_organizat` FOREIGN KEY (`organization_id`) REFERENCES `organizations_organization` (`id`),
  CONSTRAINT `organizations_organizationuser_user_id_6c888ebd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations_organizationuser`
--

LOCK TABLES `organizations_organizationuser` WRITE;
/*!40000 ALTER TABLE `organizations_organizationuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations_organizationuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_otp`
--

DROP TABLE IF EXISTS `otp_otp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_otp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `otp` int NOT NULL,
  `generated_at` datetime(6) NOT NULL,
  `validated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_otp`
--

LOCK TABLES `otp_otp` WRITE;
/*!40000 ALTER TABLE `otp_otp` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_otp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_aggregatedindependentinverter`
--

DROP TABLE IF EXISTS `solarrms_aggregatedindependentinverter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_aggregatedindependentinverter` (
  `sensor_ptr_id` bigint NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_aggregatedi_plant_id_042899d6_fk_solarrms_` (`plant_id`),
  CONSTRAINT `solarrms_aggregatedi_plant_id_042899d6_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_aggregatedi_sensor_ptr_id_090541fe_fk_dataglen_` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_aggregatedindependentinverter`
--

LOCK TABLES `solarrms_aggregatedindependentinverter` WRITE;
/*!40000 ALTER TABLE `solarrms_aggregatedindependentinverter` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_aggregatedindependentinverter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_aggregatedindependentinverter_aggregated_independen0b2a`
--

DROP TABLE IF EXISTS `solarrms_aggregatedindependentinverter_aggregated_independen0b2a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_aggregatedindependentinverter_aggregated_independen0b2a` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `aggregatedindependentinverter_id` bigint NOT NULL,
  `independentinverter_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_aggregatedindep_aggregatedindependentinv_b94a63f3_uniq` (`aggregatedindependentinverter_id`,`independentinverter_id`),
  KEY `solarrms_aggregatedi_independentinverter__08bde587_fk_solarrms_` (`independentinverter_id`),
  CONSTRAINT `solarrms_aggregatedi_aggregatedindependen_2151c40d_fk_solarrms_` FOREIGN KEY (`aggregatedindependentinverter_id`) REFERENCES `solarrms_aggregatedindependentinverter` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_aggregatedi_independentinverter__08bde587_fk_solarrms_` FOREIGN KEY (`independentinverter_id`) REFERENCES `solarrms_independentinverter` (`sensor_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_aggregatedindependentinverter_aggregated_independen0b2a`
--

LOCK TABLES `solarrms_aggregatedindependentinverter_aggregated_independen0b2a` WRITE;
/*!40000 ALTER TABLE `solarrms_aggregatedindependentinverter_aggregated_independen0b2a` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_aggregatedindependentinverter_aggregated_independen0b2a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_ajb`
--

DROP TABLE IF EXISTS `solarrms_ajb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_ajb` (
  `sensor_ptr_id` bigint NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `displayName` varchar(100) NOT NULL,
  `independent_inverter_id` bigint DEFAULT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_ajb_independent_inverter_899b7f3f_fk_solarrms_` (`independent_inverter_id`),
  KEY `solarrms_ajb_plant_id_85870ba6_fk_solarrms_` (`plant_id`),
  CONSTRAINT `solarrms_ajb_independent_inverter_899b7f3f_fk_solarrms_` FOREIGN KEY (`independent_inverter_id`) REFERENCES `solarrms_independentinverter` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_ajb_plant_id_85870ba6_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_ajb_sensor_ptr_id_c8f7ecfc_fk_dataglen_sensor_id` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_ajb`
--

LOCK TABLES `solarrms_ajb` WRITE;
/*!40000 ALTER TABLE `solarrms_ajb` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_ajb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_ajbstatusmappings`
--

DROP TABLE IF EXISTS `solarrms_ajbstatusmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_ajbstatusmappings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(100) NOT NULL,
  `status_code` double NOT NULL,
  `status_description` varchar(256) NOT NULL,
  `description_stream_name` varchar(100) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_ajbstatusmappin_plant_id_stream_name_sta_399d8409_uniq` (`plant_id`,`stream_name`,`status_code`),
  CONSTRAINT `solarrms_ajbstatusma_plant_id_fe806bb3_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_ajbstatusmappings`
--

LOCK TABLES `solarrms_ajbstatusmappings` WRITE;
/*!40000 ALTER TABLE `solarrms_ajbstatusmappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_ajbstatusmappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_cleaningtrigger`
--

DROP TABLE IF EXISTS `solarrms_cleaningtrigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_cleaningtrigger` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `string_name` varchar(100) NOT NULL,
  `trigger_type` varchar(20) NOT NULL,
  `present_state` varchar(20) NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `accepted_at` datetime(6) DEFAULT NULL,
  `finished_at` datetime(6) DEFAULT NULL,
  `ajb_id` bigint NOT NULL,
  `submitted_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `solarrms_cleaningtri_ajb_id_5bc16f92_fk_solarrms_` (`ajb_id`),
  KEY `solarrms_cleaningtri_submitted_by_id_af03e74f_fk_auth_user` (`submitted_by_id`),
  CONSTRAINT `solarrms_cleaningtri_ajb_id_5bc16f92_fk_solarrms_` FOREIGN KEY (`ajb_id`) REFERENCES `solarrms_ajb` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_cleaningtri_submitted_by_id_af03e74f_fk_auth_user` FOREIGN KEY (`submitted_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_cleaningtrigger`
--

LOCK TABLES `solarrms_cleaningtrigger` WRITE;
/*!40000 ALTER TABLE `solarrms_cleaningtrigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_cleaningtrigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_clientcontentsenable`
--

DROP TABLE IF EXISTS `solarrms_clientcontentsenable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_clientcontentsenable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contents` longtext NOT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `solarrms_clientconte_client_id_0fdbc0dd_fk_dashboard` (`client_id`),
  CONSTRAINT `solarrms_clientconte_client_id_0fdbc0dd_fk_dashboard` FOREIGN KEY (`client_id`) REFERENCES `dashboards_dataglenclient` (`organization_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_clientcontentsenable`
--

LOCK TABLES `solarrms_clientcontentsenable` WRITE;
/*!40000 ALTER TABLE `solarrms_clientcontentsenable` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_clientcontentsenable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_energymeter`
--

DROP TABLE IF EXISTS `solarrms_energymeter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_energymeter` (
  `sensor_ptr_id` bigint NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `displayName` varchar(100) NOT NULL,
  `modbus_address` varchar(100) DEFAULT NULL,
  `energy_calculation` tinyint(1) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_energymeter_plant_id_7419d4b0_fk_solarrms_` (`plant_id`),
  CONSTRAINT `solarrms_energymeter_plant_id_7419d4b0_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_energymeter_sensor_ptr_id_e68ac86a_fk_dataglen_` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_energymeter`
--

LOCK TABLES `solarrms_energymeter` WRITE;
/*!40000 ALTER TABLE `solarrms_energymeter` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_energymeter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_feeder`
--

DROP TABLE IF EXISTS `solarrms_feeder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_feeder` (
  `sensor_ptr_id` bigint NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `displayName` varchar(100) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_feeder_plant_id_3d857c86_fk_solarrms_` (`plant_id`),
  CONSTRAINT `solarrms_feeder_plant_id_3d857c86_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_feeder_sensor_ptr_id_7952829e_fk_dataglen_sensor_id` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_feeder`
--

LOCK TABLES `solarrms_feeder` WRITE;
/*!40000 ALTER TABLE `solarrms_feeder` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_feeder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_gatewaysource`
--

DROP TABLE IF EXISTS `solarrms_gatewaysource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_gatewaysource` (
  `sensor_ptr_id` bigint NOT NULL,
  `isVirtual` tinyint(1) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_gatewaysour_plant_id_40b043d9_fk_solarrms_` (`plant_id`),
  CONSTRAINT `solarrms_gatewaysour_plant_id_40b043d9_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_gatewaysour_sensor_ptr_id_6d2973c0_fk_dataglen_` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_gatewaysource`
--

LOCK TABLES `solarrms_gatewaysource` WRITE;
/*!40000 ALTER TABLE `solarrms_gatewaysource` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_gatewaysource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_independentinverter`
--

DROP TABLE IF EXISTS `solarrms_independentinverter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_independentinverter` (
  `sensor_ptr_id` bigint NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `displayName` varchar(100) NOT NULL,
  `orientation` varchar(100) DEFAULT NULL,
  `total_capacity` double DEFAULT NULL,
  `actual_capacity` double DEFAULT NULL,
  `no_of_strings` int DEFAULT NULL,
  `string_capacity` double DEFAULT NULL,
  `number_of_mppts` int DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `modbus_address` varchar(100) DEFAULT NULL,
  `tilt_angle` double DEFAULT NULL,
  `compute_irradiance` tinyint(1) NOT NULL,
  `energy_meter_id` bigint DEFAULT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_independent_plant_id_eab2e2b6_fk_solarrms_` (`plant_id`),
  KEY `solarrms_independent_energy_meter_id_07375654_fk_solarrms_` (`energy_meter_id`),
  CONSTRAINT `solarrms_independent_energy_meter_id_07375654_fk_solarrms_` FOREIGN KEY (`energy_meter_id`) REFERENCES `solarrms_energymeter` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_independent_plant_id_eab2e2b6_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_independent_sensor_ptr_id_8876aa02_fk_dataglen_` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_independentinverter`
--

LOCK TABLES `solarrms_independentinverter` WRITE;
/*!40000 ALTER TABLE `solarrms_independentinverter` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_independentinverter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_inverter`
--

DROP TABLE IF EXISTS `solarrms_inverter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_inverter` (
  `sensor_ptr_id` bigint NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `displayName` varchar(100) NOT NULL,
  `energy_meter_id` bigint DEFAULT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_inverter_plant_id_92ccf943_fk_solarrms_` (`plant_id`),
  KEY `solarrms_inverter_energy_meter_id_4170dbb6_fk_solarrms_` (`energy_meter_id`),
  CONSTRAINT `solarrms_inverter_energy_meter_id_4170dbb6_fk_solarrms_` FOREIGN KEY (`energy_meter_id`) REFERENCES `solarrms_energymeter` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_inverter_plant_id_92ccf943_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_inverter_sensor_ptr_id_6364bef6_fk_dataglen_sensor_id` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_inverter`
--

LOCK TABLES `solarrms_inverter` WRITE;
/*!40000 ALTER TABLE `solarrms_inverter` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_inverter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_invertererrorcodes`
--

DROP TABLE IF EXISTS `solarrms_invertererrorcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_invertererrorcodes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(128) NOT NULL,
  `model` varchar(128) NOT NULL,
  `error_code` double NOT NULL,
  `error_description` varchar(256) DEFAULT NULL,
  `default_severity` varchar(256) DEFAULT NULL,
  `notes` varchar(256) DEFAULT NULL,
  `grid_down` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_invertererrorco_manufacturer_model_error_199465bb_uniq` (`manufacturer`,`model`,`error_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_invertererrorcodes`
--

LOCK TABLES `solarrms_invertererrorcodes` WRITE;
/*!40000 ALTER TABLE `solarrms_invertererrorcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_invertererrorcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_inverterstatusmappings`
--

DROP TABLE IF EXISTS `solarrms_inverterstatusmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_inverterstatusmappings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(100) NOT NULL,
  `status_code` double NOT NULL,
  `status_description` varchar(256) NOT NULL,
  `description_stream_name` varchar(100) NOT NULL,
  `generating` tinyint(1) NOT NULL,
  `dual_status` tinyint(1) NOT NULL,
  `grid_down` tinyint(1) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_inverterstatusm_plant_id_stream_name_sta_b42aa4ce_uniq` (`plant_id`,`stream_name`,`status_code`),
  CONSTRAINT `solarrms_invertersta_plant_id_f99891f4_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_inverterstatusmappings`
--

LOCK TABLES `solarrms_inverterstatusmappings` WRITE;
/*!40000 ALTER TABLE `solarrms_inverterstatusmappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_inverterstatusmappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_iosensorfield`
--

DROP TABLE IF EXISTS `solarrms_iosensorfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_iosensorfield` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `device_id` varchar(20) NOT NULL,
  `ain_number` int NOT NULL,
  `stream_type` varchar(50) NOT NULL,
  `tilt` double DEFAULT NULL,
  `orientation` double DEFAULT NULL,
  `output_range` varchar(20) NOT NULL,
  `lower_bound` double NOT NULL,
  `upper_bound` double NOT NULL,
  `plant_meta_id` bigint NOT NULL,
  `solar_field_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `solarrms_iosensorfie_plant_meta_id_7645f634_fk_solarrms_` (`plant_meta_id`),
  KEY `solarrms_iosensorfie_solar_field_id_472f4998_fk_solarrms_` (`solar_field_id`),
  CONSTRAINT `solarrms_iosensorfie_plant_meta_id_7645f634_fk_solarrms_` FOREIGN KEY (`plant_meta_id`) REFERENCES `solarrms_plantmetasource` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_iosensorfie_solar_field_id_472f4998_fk_solarrms_` FOREIGN KEY (`solar_field_id`) REFERENCES `solarrms_solarfield` (`field_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_iosensorfield`
--

LOCK TABLES `solarrms_iosensorfield` WRITE;
/*!40000 ALTER TABLE `solarrms_iosensorfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_iosensorfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_meterstatusmappings`
--

DROP TABLE IF EXISTS `solarrms_meterstatusmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_meterstatusmappings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(100) NOT NULL,
  `status_code` double NOT NULL,
  `status_description` varchar(256) NOT NULL,
  `description_stream_name` varchar(100) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_meterstatusmapp_plant_id_stream_name_sta_8c12fce2_uniq` (`plant_id`,`stream_name`,`status_code`),
  CONSTRAINT `solarrms_meterstatus_plant_id_4577c2e9_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_meterstatusmappings`
--

LOCK TABLES `solarrms_meterstatusmappings` WRITE;
/*!40000 ALTER TABLE `solarrms_meterstatusmappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_meterstatusmappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_mppt`
--

DROP TABLE IF EXISTS `solarrms_mppt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_mppt` (
  `sensor_ptr_id` bigint NOT NULL,
  `order` int DEFAULT NULL,
  `strings_per_mppt` int DEFAULT NULL,
  `modules_per_string` int DEFAULT NULL,
  `independent_inverter_id` bigint DEFAULT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_mppt_plant_id_53df1413_fk_solarrms_` (`plant_id`),
  KEY `solarrms_mppt_independent_inverter_67cb716b_fk_solarrms_` (`independent_inverter_id`),
  CONSTRAINT `solarrms_mppt_independent_inverter_67cb716b_fk_solarrms_` FOREIGN KEY (`independent_inverter_id`) REFERENCES `solarrms_independentinverter` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_mppt_plant_id_53df1413_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_mppt_sensor_ptr_id_99e94628_fk_dataglen_sensor_id` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_mppt`
--

LOCK TABLES `solarrms_mppt` WRITE;
/*!40000 ALTER TABLE `solarrms_mppt` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_mppt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_panelsstring`
--

DROP TABLE IF EXISTS `solarrms_panelsstring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_panelsstring` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `orientation` double DEFAULT NULL,
  `number_of_panels` int DEFAULT NULL,
  `tilt_angle` double DEFAULT NULL,
  `mppt_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `solarrms_panelsstrin_mppt_id_cc271acc_fk_solarrms_` (`mppt_id`),
  CONSTRAINT `solarrms_panelsstrin_mppt_id_cc271acc_fk_solarrms_` FOREIGN KEY (`mppt_id`) REFERENCES `solarrms_mppt` (`sensor_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_panelsstring`
--

LOCK TABLES `solarrms_panelsstring` WRITE;
/*!40000 ALTER TABLE `solarrms_panelsstring` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_panelsstring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_plantcontractdetails`
--

DROP TABLE IF EXISTS `solarrms_plantcontractdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_plantcontractdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contract_date` date DEFAULT NULL,
  `loi_date` date DEFAULT NULL,
  `ppa_date` date DEFAULT NULL,
  `commissioning_date` date DEFAULT NULL,
  `contract_number` varchar(100) DEFAULT NULL,
  `contract_release_date` date DEFAULT NULL,
  `current_utility_tariff` double DEFAULT NULL,
  `current_solar_tarrif` double DEFAULT NULL,
  `differential_pricing` double DEFAULT NULL,
  `ppa_pricing` double DEFAULT NULL,
  `pricing_model` varchar(100) DEFAULT NULL,
  `total_investment` double DEFAULT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `solarrms_plantcontra_plant_id_215ecb7f_fk_solarrms_` (`plant_id`),
  CONSTRAINT `solarrms_plantcontra_plant_id_215ecb7f_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_plantcontractdetails`
--

LOCK TABLES `solarrms_plantcontractdetails` WRITE;
/*!40000 ALTER TABLE `solarrms_plantcontractdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_plantcontractdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_plantfeaturesenable`
--

DROP TABLE IF EXISTS `solarrms_plantfeaturesenable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_plantfeaturesenable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `solar_metrics` tinyint(1) NOT NULL,
  `economic_benefits` tinyint(1) NOT NULL,
  `analytics` tinyint(1) NOT NULL,
  `alerts` tinyint(1) NOT NULL,
  `reports` tinyint(1) NOT NULL,
  `timeseries` tinyint(1) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `solarrms_plantfeatur_plant_id_5ccca2b0_fk_solarrms_` (`plant_id`),
  CONSTRAINT `solarrms_plantfeatur_plant_id_5ccca2b0_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_plantfeaturesenable`
--

LOCK TABLES `solarrms_plantfeaturesenable` WRITE;
/*!40000 ALTER TABLE `solarrms_plantfeaturesenable` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_plantfeaturesenable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_plantmetasource`
--

DROP TABLE IF EXISTS `solarrms_plantmetasource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_plantmetasource` (
  `sensor_ptr_id` bigint NOT NULL,
  `sending_aggregated_power` tinyint(1) NOT NULL,
  `sending_aggregated_energy` tinyint(1) NOT NULL,
  `energy_meter_installed` tinyint(1) NOT NULL,
  `inverters_sending_daily_generation` tinyint(1) NOT NULL,
  `inverters_sending_total_generation` tinyint(1) NOT NULL,
  `meter_power` tinyint(1) NOT NULL,
  `PV_panel_area` double DEFAULT NULL,
  `PV_panel_efficiency` double DEFAULT NULL,
  `panel_capacity` double DEFAULT NULL,
  `panel_technology` varchar(100) DEFAULT NULL,
  `panel_manufacturer` varchar(100) DEFAULT NULL,
  `model_number` varchar(100) DEFAULT NULL,
  `no_of_panels` int DEFAULT NULL,
  `ws_tilt_angle` double DEFAULT NULL,
  `operations_start_time` varchar(100) NOT NULL,
  `operations_end_time` varchar(100) NOT NULL,
  `calculate_hourly_pr` tinyint(1) NOT NULL,
  `tickets_enabled` tinyint(1) NOT NULL,
  `dc_loss_enabled` tinyint(1) NOT NULL,
  `conversion_loss_enabled` tinyint(1) NOT NULL,
  `ac_loss_enabled` tinyint(1) NOT NULL,
  `energy_from_power` tinyint(1) NOT NULL,
  `irradiation_data` tinyint(1) NOT NULL,
  `energy_calculation_device` varchar(100) NOT NULL,
  `energy_calculation_stream` varchar(100) NOT NULL,
  `energy_calculation_stream_unit` varchar(100) NOT NULL,
  `data_frequency` int DEFAULT NULL,
  `plant_type` varchar(100) NOT NULL,
  `installer_type` varchar(100) NOT NULL,
  `binning_interval` int DEFAULT NULL,
  `gateway_manufacturer` varchar(50) NOT NULL,
  `dsm_enabled` tinyint(1) NOT NULL,
  `prediction_enabled` tinyint(1) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  UNIQUE KEY `plant_id` (`plant_id`),
  CONSTRAINT `solarrms_plantmetaso_plant_id_8daccc4f_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_plantmetaso_sensor_ptr_id_7c9a0dd7_fk_dataglen_` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_plantmetasource`
--

LOCK TABLES `solarrms_plantmetasource` WRITE;
/*!40000 ALTER TABLE `solarrms_plantmetasource` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_plantmetasource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_pvsystinfo`
--

DROP TABLE IF EXISTS `solarrms_pvsystinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_pvsystinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parameterName` varchar(100) DEFAULT NULL,
  `timePeriodType` varchar(100) DEFAULT NULL,
  `timePeriodDay` int DEFAULT NULL,
  `timePeriodValue` int DEFAULT NULL,
  `timePeriodYear` int DEFAULT NULL,
  `parameterValue` double DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `plant_id` int NOT NULL,
  `solar_group_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_pvsystinfo_plant_id_solar_group_id__fe5f5cb3_uniq` (`plant_id`,`solar_group_id`,`parameterName`,`timePeriodType`,`timePeriodDay`,`timePeriodValue`,`timePeriodYear`),
  KEY `solarrms_pvsystinfo_solar_group_id_498c1193_fk_solarrms_` (`solar_group_id`),
  CONSTRAINT `solarrms_pvsystinfo_plant_id_bbd6afa9_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_pvsystinfo_solar_group_id_498c1193_fk_solarrms_` FOREIGN KEY (`solar_group_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_pvsystinfo`
--

LOCK TABLES `solarrms_pvsystinfo` WRITE;
/*!40000 ALTER TABLE `solarrms_pvsystinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_pvsystinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_pvwatt`
--

DROP TABLE IF EXISTS `solarrms_pvwatt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_pvwatt` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parameter_name` varchar(100) DEFAULT NULL,
  `time_period_type` varchar(100) DEFAULT NULL,
  `time_period_year_number` int DEFAULT NULL,
  `time_period_month_number` int DEFAULT NULL,
  `parameter_value` double DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `plant_id` int NOT NULL,
  `solar_group_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_pvwatt_plant_id_solar_group_id__704be23f_uniq` (`plant_id`,`solar_group_id`,`parameter_name`,`time_period_type`,`time_period_year_number`,`time_period_month_number`),
  KEY `solarrms_pvwatt_solar_group_id_b6ac2bec_fk_solarrms_` (`solar_group_id`),
  CONSTRAINT `solarrms_pvwatt_plant_id_7840a032_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_pvwatt_solar_group_id_b6ac2bec_fk_solarrms_` FOREIGN KEY (`solar_group_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_pvwatt`
--

LOCK TABLES `solarrms_pvwatt` WRITE;
/*!40000 ALTER TABLE `solarrms_pvwatt` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_pvwatt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solarerrorfield`
--

DROP TABLE IF EXISTS `solarrms_solarerrorfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solarerrorfield` (
  `errorfield_ptr_id` bigint NOT NULL,
  `displayName` varchar(100) NOT NULL,
  `fieldType` varchar(20) NOT NULL,
  PRIMARY KEY (`errorfield_ptr_id`),
  CONSTRAINT `solarrms_solarerrorf_errorfield_ptr_id_496f59eb_fk_errors_er` FOREIGN KEY (`errorfield_ptr_id`) REFERENCES `errors_errorfield` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solarerrorfield`
--

LOCK TABLES `solarrms_solarerrorfield` WRITE;
/*!40000 ALTER TABLE `solarrms_solarerrorfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solarerrorfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solarfield`
--

DROP TABLE IF EXISTS `solarrms_solarfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solarfield` (
  `field_ptr_id` bigint NOT NULL,
  `displayName` varchar(100) NOT NULL,
  `fieldType` varchar(20) NOT NULL,
  PRIMARY KEY (`field_ptr_id`),
  CONSTRAINT `solarrms_solarfield_field_ptr_id_2915e4c3_fk_dataglen_field_id` FOREIGN KEY (`field_ptr_id`) REFERENCES `dataglen_field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solarfield`
--

LOCK TABLES `solarrms_solarfield` WRITE;
/*!40000 ALTER TABLE `solarrms_solarfield` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solarfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solargroup`
--

DROP TABLE IF EXISTS `solarrms_solargroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solargroup` (
  `sensorgroup_ptr_id` bigint NOT NULL,
  `group_type` varchar(100) DEFAULT NULL,
  `roof_type` varchar(100) DEFAULT NULL,
  `tilt_angle` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `azimuth` varchar(100) DEFAULT NULL,
  `panel_manufacturer` varchar(100) DEFAULT NULL,
  `panel_capacity` double DEFAULT NULL,
  `no_of_panels` int DEFAULT NULL,
  `PV_panel_area` double DEFAULT NULL,
  `PV_panel_efficiency` double DEFAULT NULL,
  `data_logger_device_id` varchar(100) DEFAULT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensorgroup_ptr_id`),
  KEY `solarrms_solargroup_plant_id_b62bd30f_fk_solarrms_` (`plant_id`),
  CONSTRAINT `solarrms_solargroup_plant_id_b62bd30f_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_solargroup_sensorgroup_ptr_id_9e88d752_fk_dataglen_` FOREIGN KEY (`sensorgroup_ptr_id`) REFERENCES `dataglen_sensorgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solargroup`
--

LOCK TABLES `solarrms_solargroup` WRITE;
/*!40000 ALTER TABLE `solarrms_solargroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solargroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solargroup_groupAJBs`
--

DROP TABLE IF EXISTS `solarrms_solargroup_groupAJBs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solargroup_groupAJBs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `solargroup_id` bigint NOT NULL,
  `ajb_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_solargroup_groupAJBs_solargroup_id_ajb_id_81e22dcc_uniq` (`solargroup_id`,`ajb_id`),
  KEY `solarrms_solargroup__ajb_id_23aab63c_fk_solarrms_` (`ajb_id`),
  CONSTRAINT `solarrms_solargroup__ajb_id_23aab63c_fk_solarrms_` FOREIGN KEY (`ajb_id`) REFERENCES `solarrms_ajb` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_solargroup__solargroup_id_b715ffcc_fk_solarrms_` FOREIGN KEY (`solargroup_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solargroup_groupAJBs`
--

LOCK TABLES `solarrms_solargroup_groupAJBs` WRITE;
/*!40000 ALTER TABLE `solarrms_solargroup_groupAJBs` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solargroup_groupAJBs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solargroup_groupEnergyMeters`
--

DROP TABLE IF EXISTS `solarrms_solargroup_groupEnergyMeters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solargroup_groupEnergyMeters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `solargroup_id` bigint NOT NULL,
  `energymeter_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_solargroup_grou_solargroup_id_energymete_2bcc4ec3_uniq` (`solargroup_id`,`energymeter_id`),
  KEY `solarrms_solargroup__energymeter_id_1d1081b5_fk_solarrms_` (`energymeter_id`),
  CONSTRAINT `solarrms_solargroup__energymeter_id_1d1081b5_fk_solarrms_` FOREIGN KEY (`energymeter_id`) REFERENCES `solarrms_energymeter` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_solargroup__solargroup_id_1183e735_fk_solarrms_` FOREIGN KEY (`solargroup_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solargroup_groupEnergyMeters`
--

LOCK TABLES `solarrms_solargroup_groupEnergyMeters` WRITE;
/*!40000 ALTER TABLE `solarrms_solargroup_groupEnergyMeters` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solargroup_groupEnergyMeters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solargroup_groupFeeders`
--

DROP TABLE IF EXISTS `solarrms_solargroup_groupFeeders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solargroup_groupFeeders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `solargroup_id` bigint NOT NULL,
  `feeder_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_solargroup_grou_solargroup_id_feeder_id_7db31cf3_uniq` (`solargroup_id`,`feeder_id`),
  KEY `solarrms_solargroup__feeder_id_ce52ed2d_fk_solarrms_` (`feeder_id`),
  CONSTRAINT `solarrms_solargroup__feeder_id_ce52ed2d_fk_solarrms_` FOREIGN KEY (`feeder_id`) REFERENCES `solarrms_feeder` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_solargroup__solargroup_id_3c7d1812_fk_solarrms_` FOREIGN KEY (`solargroup_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solargroup_groupFeeders`
--

LOCK TABLES `solarrms_solargroup_groupFeeders` WRITE;
/*!40000 ALTER TABLE `solarrms_solargroup_groupFeeders` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solargroup_groupFeeders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solargroup_groupGatewaySources`
--

DROP TABLE IF EXISTS `solarrms_solargroup_groupGatewaySources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solargroup_groupGatewaySources` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `solargroup_id` bigint NOT NULL,
  `gatewaysource_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_solargroup_grou_solargroup_id_gatewaysou_6a282dff_uniq` (`solargroup_id`,`gatewaysource_id`),
  KEY `solarrms_solargroup__gatewaysource_id_3c72aa89_fk_solarrms_` (`gatewaysource_id`),
  CONSTRAINT `solarrms_solargroup__gatewaysource_id_3c72aa89_fk_solarrms_` FOREIGN KEY (`gatewaysource_id`) REFERENCES `solarrms_gatewaysource` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_solargroup__solargroup_id_549ef53e_fk_solarrms_` FOREIGN KEY (`solargroup_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solargroup_groupGatewaySources`
--

LOCK TABLES `solarrms_solargroup_groupGatewaySources` WRITE;
/*!40000 ALTER TABLE `solarrms_solargroup_groupGatewaySources` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solargroup_groupGatewaySources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solargroup_groupIOSensors`
--

DROP TABLE IF EXISTS `solarrms_solargroup_groupIOSensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solargroup_groupIOSensors` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `solargroup_id` bigint NOT NULL,
  `iosensorfield_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_solargroup_grou_solargroup_id_iosensorfi_3512d001_uniq` (`solargroup_id`,`iosensorfield_id`),
  KEY `solarrms_solargroup__iosensorfield_id_563f5d6b_fk_solarrms_` (`iosensorfield_id`),
  CONSTRAINT `solarrms_solargroup__iosensorfield_id_563f5d6b_fk_solarrms_` FOREIGN KEY (`iosensorfield_id`) REFERENCES `solarrms_iosensorfield` (`id`),
  CONSTRAINT `solarrms_solargroup__solargroup_id_19dc9529_fk_solarrms_` FOREIGN KEY (`solargroup_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solargroup_groupIOSensors`
--

LOCK TABLES `solarrms_solargroup_groupIOSensors` WRITE;
/*!40000 ALTER TABLE `solarrms_solargroup_groupIOSensors` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solargroup_groupIOSensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solargroup_groupIndependentInverters`
--

DROP TABLE IF EXISTS `solarrms_solargroup_groupIndependentInverters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solargroup_groupIndependentInverters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `solargroup_id` bigint NOT NULL,
  `independentinverter_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_solargroup_grou_solargroup_id_independen_5e144118_uniq` (`solargroup_id`,`independentinverter_id`),
  KEY `solarrms_solargroup__independentinverter__e072072d_fk_solarrms_` (`independentinverter_id`),
  CONSTRAINT `solarrms_solargroup__independentinverter__e072072d_fk_solarrms_` FOREIGN KEY (`independentinverter_id`) REFERENCES `solarrms_independentinverter` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_solargroup__solargroup_id_c7eb7890_fk_solarrms_` FOREIGN KEY (`solargroup_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solargroup_groupIndependentInverters`
--

LOCK TABLES `solarrms_solargroup_groupIndependentInverters` WRITE;
/*!40000 ALTER TABLE `solarrms_solargroup_groupIndependentInverters` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solargroup_groupIndependentInverters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solargroup_groupInverters`
--

DROP TABLE IF EXISTS `solarrms_solargroup_groupInverters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solargroup_groupInverters` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `solargroup_id` bigint NOT NULL,
  `inverter_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_solargroup_grou_solargroup_id_inverter_i_d46982de_uniq` (`solargroup_id`,`inverter_id`),
  KEY `solarrms_solargroup__inverter_id_67c7e22a_fk_solarrms_` (`inverter_id`),
  CONSTRAINT `solarrms_solargroup__inverter_id_67c7e22a_fk_solarrms_` FOREIGN KEY (`inverter_id`) REFERENCES `solarrms_inverter` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_solargroup__solargroup_id_a12fd92d_fk_solarrms_` FOREIGN KEY (`solargroup_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solargroup_groupInverters`
--

LOCK TABLES `solarrms_solargroup_groupInverters` WRITE;
/*!40000 ALTER TABLE `solarrms_solargroup_groupInverters` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solargroup_groupInverters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solargroup_groupPlantMetaSources`
--

DROP TABLE IF EXISTS `solarrms_solargroup_groupPlantMetaSources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solargroup_groupPlantMetaSources` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `solargroup_id` bigint NOT NULL,
  `plantmetasource_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_solargroup_grou_solargroup_id_plantmetas_6395a0f8_uniq` (`solargroup_id`,`plantmetasource_id`),
  KEY `solarrms_solargroup__plantmetasource_id_74bdb5f2_fk_solarrms_` (`plantmetasource_id`),
  CONSTRAINT `solarrms_solargroup__plantmetasource_id_74bdb5f2_fk_solarrms_` FOREIGN KEY (`plantmetasource_id`) REFERENCES `solarrms_plantmetasource` (`sensor_ptr_id`),
  CONSTRAINT `solarrms_solargroup__solargroup_id_50b8d3c4_fk_solarrms_` FOREIGN KEY (`solargroup_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solargroup_groupPlantMetaSources`
--

LOCK TABLES `solarrms_solargroup_groupPlantMetaSources` WRITE;
/*!40000 ALTER TABLE `solarrms_solargroup_groupPlantMetaSources` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solargroup_groupPlantMetaSources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solarmetrics`
--

DROP TABLE IF EXISTS `solarrms_solarmetrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solarmetrics` (
  `sensor_ptr_id` bigint NOT NULL,
  `displayName` varchar(100) NOT NULL,
  `plant_id` int NOT NULL,
  `solar_group_id` bigint DEFAULT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_solarmetric_plant_id_3e51abd4_fk_solarrms_` (`plant_id`),
  KEY `solarrms_solarmetric_solar_group_id_7d82203d_fk_solarrms_` (`solar_group_id`),
  CONSTRAINT `solarrms_solarmetric_plant_id_3e51abd4_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_solarmetric_sensor_ptr_id_d3d1b981_fk_dataglen_` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`),
  CONSTRAINT `solarrms_solarmetric_solar_group_id_7d82203d_fk_solarrms_` FOREIGN KEY (`solar_group_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solarmetrics`
--

LOCK TABLES `solarrms_solarmetrics` WRITE;
/*!40000 ALTER TABLE `solarrms_solarmetrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solarmetrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solarplant`
--

DROP TABLE IF EXISTS `solarrms_solarplant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solarplant` (
  `dataglengroup_ptr_id` int NOT NULL,
  `capacity` double NOT NULL,
  `location` varchar(250) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `commissioned_date` date DEFAULT NULL,
  `feed_in_tariff` double DEFAULT NULL,
  `openweather` varchar(50) NOT NULL,
  `isOperational` tinyint(1) NOT NULL,
  `evacuation_point` double DEFAULT NULL,
  `webdyn_device_id` varchar(100) DEFAULT NULL,
  `ac_capacity` double DEFAULT NULL,
  `elevation` double DEFAULT NULL,
  `intermediate_client` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_solarplant_dataglengroup_ptr_id_55c5960c_fk_dashboard` FOREIGN KEY (`dataglengroup_ptr_id`) REFERENCES `dashboards_dataglengroup` (`organization_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solarplant`
--

LOCK TABLES `solarrms_solarplant` WRITE;
/*!40000 ALTER TABLE `solarrms_solarplant` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solarplant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solarsection`
--

DROP TABLE IF EXISTS `solarrms_solarsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solarsection` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `solarrms_solarsectio_plant_id_1c702511_fk_solarrms_` (`plant_id`),
  CONSTRAINT `solarrms_solarsectio_plant_id_1c702511_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solarsection`
--

LOCK TABLES `solarrms_solarsection` WRITE;
/*!40000 ALTER TABLE `solarrms_solarsection` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solarsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_solarsection_solar_groups`
--

DROP TABLE IF EXISTS `solarrms_solarsection_solar_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_solarsection_solar_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `solarsection_id` bigint NOT NULL,
  `solargroup_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_solarsection_so_solarsection_id_solargro_ec2aeec3_uniq` (`solarsection_id`,`solargroup_id`),
  KEY `solarrms_solarsectio_solargroup_id_6904cf14_fk_solarrms_` (`solargroup_id`),
  CONSTRAINT `solarrms_solarsectio_solargroup_id_6904cf14_fk_solarrms_` FOREIGN KEY (`solargroup_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`),
  CONSTRAINT `solarrms_solarsectio_solarsection_id_1110f64e_fk_solarrms_` FOREIGN KEY (`solarsection_id`) REFERENCES `solarrms_solarsection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_solarsection_solar_groups`
--

LOCK TABLES `solarrms_solarsection_solar_groups` WRITE;
/*!40000 ALTER TABLE `solarrms_solarsection_solar_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_solarsection_solar_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_transformer`
--

DROP TABLE IF EXISTS `solarrms_transformer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_transformer` (
  `sensor_ptr_id` bigint NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `displayName` varchar(100) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_transformer_plant_id_8e83a58a_fk_solarrms_` (`plant_id`),
  CONSTRAINT `solarrms_transformer_plant_id_8e83a58a_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_transformer_sensor_ptr_id_dafbfbe8_fk_dataglen_` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_transformer`
--

LOCK TABLES `solarrms_transformer` WRITE;
/*!40000 ALTER TABLE `solarrms_transformer` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_transformer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_transformerstatusmappings`
--

DROP TABLE IF EXISTS `solarrms_transformerstatusmappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_transformerstatusmappings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(100) NOT NULL,
  `status_code` double NOT NULL,
  `status_description` varchar(256) NOT NULL,
  `description_stream_name` varchar(100) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_transformerstat_plant_id_stream_name_sta_f731a3f0_uniq` (`plant_id`,`stream_name`,`status_code`),
  CONSTRAINT `solarrms_transformer_plant_id_a2821b0e_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_transformerstatusmappings`
--

LOCK TABLES `solarrms_transformerstatusmappings` WRITE;
/*!40000 ALTER TABLE `solarrms_transformerstatusmappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_transformerstatusmappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_virtualgateway`
--

DROP TABLE IF EXISTS `solarrms_virtualgateway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_virtualgateway` (
  `sensor_ptr_id` bigint NOT NULL,
  `manufacturer` varchar(100) NOT NULL,
  `displayName` varchar(100) NOT NULL,
  `plant_id` int NOT NULL,
  `solar_group_id` bigint DEFAULT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_virtualgate_plant_id_3f75e593_fk_solarrms_` (`plant_id`),
  KEY `solarrms_virtualgate_solar_group_id_ac0de5e9_fk_solarrms_` (`solar_group_id`),
  CONSTRAINT `solarrms_virtualgate_plant_id_3f75e593_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_virtualgate_sensor_ptr_id_112eac83_fk_dataglen_` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`),
  CONSTRAINT `solarrms_virtualgate_solar_group_id_ac0de5e9_fk_solarrms_` FOREIGN KEY (`solar_group_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_virtualgateway`
--

LOCK TABLES `solarrms_virtualgateway` WRITE;
/*!40000 ALTER TABLE `solarrms_virtualgateway` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_virtualgateway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_weatherstation`
--

DROP TABLE IF EXISTS `solarrms_weatherstation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_weatherstation` (
  `sensor_ptr_id` bigint NOT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `displayName` varchar(100) NOT NULL,
  `plant_id` int NOT NULL,
  PRIMARY KEY (`sensor_ptr_id`),
  KEY `solarrms_weatherstat_plant_id_ee84f24d_fk_solarrms_` (`plant_id`),
  CONSTRAINT `solarrms_weatherstat_plant_id_ee84f24d_fk_solarrms_` FOREIGN KEY (`plant_id`) REFERENCES `solarrms_solarplant` (`dataglengroup_ptr_id`),
  CONSTRAINT `solarrms_weatherstat_sensor_ptr_id_80c77880_fk_dataglen_` FOREIGN KEY (`sensor_ptr_id`) REFERENCES `dataglen_sensor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_weatherstation`
--

LOCK TABLES `solarrms_weatherstation` WRITE;
/*!40000 ALTER TABLE `solarrms_weatherstation` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_weatherstation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solarrms_weatherstation_solar_groups`
--

DROP TABLE IF EXISTS `solarrms_weatherstation_solar_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solarrms_weatherstation_solar_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `weatherstation_id` bigint NOT NULL,
  `solargroup_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `solarrms_weatherstation__weatherstation_id_solarg_bda81898_uniq` (`weatherstation_id`,`solargroup_id`),
  KEY `solarrms_weatherstat_solargroup_id_df7a635a_fk_solarrms_` (`solargroup_id`),
  CONSTRAINT `solarrms_weatherstat_solargroup_id_df7a635a_fk_solarrms_` FOREIGN KEY (`solargroup_id`) REFERENCES `solarrms_solargroup` (`sensorgroup_ptr_id`),
  CONSTRAINT `solarrms_weatherstat_weatherstation_id_6b5b876f_fk_solarrms_` FOREIGN KEY (`weatherstation_id`) REFERENCES `solarrms_weatherstation` (`sensor_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solarrms_weatherstation_solar_groups`
--

LOCK TABLES `solarrms_weatherstation_solar_groups` WRITE;
/*!40000 ALTER TABLE `solarrms_weatherstation_solar_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `solarrms_weatherstation_solar_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_tag`
--

DROP TABLE IF EXISTS `tagging_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagging_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_tag`
--

LOCK TABLES `tagging_tag` WRITE;
/*!40000 ALTER TABLE `tagging_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_taggeditem`
--

DROP TABLE IF EXISTS `tagging_taggeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagging_taggeditem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tagging_taggeditem_tag_id_content_type_id_o_3d53f09d_uniq` (`tag_id`,`content_type_id`,`object_id`),
  KEY `tagging_taggeditem_content_type_id_ede1c265_fk_django_co` (`content_type_id`),
  KEY `tagging_taggeditem_object_id_0d0d5e42` (`object_id`),
  CONSTRAINT `tagging_taggeditem_content_type_id_ede1c265_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `tagging_taggeditem_tag_id_f008ca79_fk` FOREIGN KEY (`tag_id`) REFERENCES `tagging_tag` (`id`),
  CONSTRAINT `tagging_taggeditem_chk_1` CHECK ((`object_id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_taggeditem`
--

LOCK TABLES `tagging_taggeditem` WRITE;
/*!40000 ALTER TABLE `tagging_taggeditem` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_taggeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets_widget`
--

DROP TABLE IF EXISTS `widgets_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets_widget` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `packaging_function_path` varchar(100) DEFAULT NULL,
  `widget_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets_widget`
--

LOCK TABLES `widgets_widget` WRITE;
/*!40000 ALTER TABLE `widgets_widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `widgets_widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets_widget_features`
--

DROP TABLE IF EXISTS `widgets_widget_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets_widget_features` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `widget_id` bigint NOT NULL,
  `feature_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `widgets_widget_features_widget_id_feature_id_c27e4ecc_uniq` (`widget_id`,`feature_id`),
  KEY `widgets_widget_featu_feature_id_180960d9_fk_features_` (`feature_id`),
  CONSTRAINT `widgets_widget_featu_feature_id_180960d9_fk_features_` FOREIGN KEY (`feature_id`) REFERENCES `features_feature` (`id`),
  CONSTRAINT `widgets_widget_features_widget_id_36c24850_fk_widgets_widget_id` FOREIGN KEY (`widget_id`) REFERENCES `widgets_widget` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets_widget_features`
--

LOCK TABLES `widgets_widget_features` WRITE;
/*!40000 ALTER TABLE `widgets_widget_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `widgets_widget_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dataglen_meta2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-23 15:09:40
