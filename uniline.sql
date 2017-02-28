-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: uniline
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add property',7,'add_property'),(20,'Can change property',7,'change_property'),(21,'Can delete property',7,'delete_property'),(22,'Can add unit',8,'add_unit'),(23,'Can change unit',8,'change_unit'),(24,'Can delete unit',8,'delete_unit'),(25,'Can add base_price',9,'add_base_price'),(26,'Can change base_price',9,'change_base_price'),(27,'Can delete base_price',9,'delete_base_price'),(28,'Can add discount',10,'add_discount'),(29,'Can change discount',10,'change_discount'),(30,'Can delete discount',10,'delete_discount');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$HSNLtJwRDc03$3vvbmNo8LG8rPC3pUthGH4Hzg9/o3clNh66J28BP6FA=','2017-02-14 12:51:18.159002',1,'antun','','','akovace@hotmail.com',1,1,'2017-02-14 10:51:56.888378'),(2,'',NULL,0,'netko','','','netko@hof.com',1,1,'2017-02-14 11:06:10.148675');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_price`
--

DROP TABLE IF EXISTS `base_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `min_nights` int(11) NOT NULL,
  `nr_persons` int(11) NOT NULL,
  `checkin_days` varchar(7) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniappline_base_price_unit_id_4b11cfce_fk_uniappline_unit_id` (`unit_id`),
  CONSTRAINT `uniappline_base_price_unit_id_4b11cfce_fk_uniappline_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_price`
--

LOCK TABLES `base_price` WRITE;
/*!40000 ALTER TABLE `base_price` DISABLE KEYS */;
INSERT INTO `base_price` VALUES (1,'2017-05-28','2017-07-01',4,2,'1234567',35.00,1),(2,'2017-07-02','2017-08-26',4,2,'1234567',45.00,1),(3,'2017-08-27','2017-09-29',4,2,'1234567',35.00,1),(4,'2017-05-28','2017-07-01',4,4,'1234567',55.00,2),(5,'2017-07-02','2017-08-26',4,4,'1234567',70.00,2),(6,'2017-08-27','2017-09-29',4,4,'1234567',55.00,2),(7,'2017-06-27','2017-08-22',7,4,'1234567',95.00,3),(8,'2017-06-27','2017-08-22',7,5,'1234567',101.75,3),(9,'2017-08-23','2017-08-29',7,4,'1234567',74.00,3),(10,'2017-08-23','2017-08-29',7,5,'1234567',80.75,3),(11,'2017-08-30','2017-09-30',7,5,'1234567',67.50,3),(12,'2017-06-27','2017-08-22',7,3,'1234567',67.50,4),(13,'2017-08-23','2017-08-29',7,3,'1234567',60.75,4),(14,'2017-08-30','2017-09-30',7,3,'1234567',54.25,4),(15,'2017-02-28','2017-06-30',3,3,'1234567',54.25,5),(16,'2017-07-01','2017-09-01',4,3,'1234567',60.75,5),(17,'2017-09-02','2017-12-31',3,3,'1234567',54.25,5),(18,'2017-02-28','2017-06-30',3,4,'1234567',60.75,6),(19,'2017-07-01','2017-09-01',4,4,'1234567',76.00,6),(20,'2017-09-02','2017-12-31',3,4,'1234567',60.75,6),(21,'2017-02-28','2017-06-30',3,2,'1234567',39.00,7),(22,'2017-07-01','2017-09-01',4,2,'1234567',54.25,7),(23,'2017-09-02','2017-12-31',3,2,'1234567',39.00,7),(24,'2017-02-28','2017-06-30',3,6,'1234567',90.25,8),(25,'2017-07-01','2017-09-01',4,6,'1234567',116.75,8),(26,'2017-09-02','2017-12-31',3,6,'1234567',90.25,8),(27,'2017-01-01','2017-05-31',5,5,'1234567',72.25,9),(28,'2017-06-01','2017-06-16',5,5,'1234567',90.25,9),(29,'2017-06-17','2017-06-30',5,5,'1234567',108.25,9),(30,'2017-07-01','2017-07-14',7,5,'1234567',135.00,9),(31,'2017-07-15','2017-08-25',7,5,'1234567',162.50,9),(32,'2017-08-26','2017-09-01',7,5,'1234567',135.00,9),(33,'2017-09-02','2017-09-15',5,5,'1234567',108.25,9),(34,'2017-09-16','2017-09-30',5,5,'1234567',90.25,9),(35,'2017-10-01','2017-10-31',5,5,'1234567',72.25,9),(36,'2017-04-01','2017-05-30',3,2,'1234567',56.00,10),(37,'2017-04-01','2017-05-30',3,3,'1234567',74.00,10),(38,'2017-05-31','2017-07-09',3,2,'1234567',59.00,10),(39,'2017-05-31','2017-07-09',3,3,'1234567',77.00,10),(40,'2017-07-10','2017-08-20',5,2,'1234567',64.50,10),(41,'2017-07-10','2017-08-20',5,3,'1234567',82.75,10),(42,'2017-08-21','2017-09-29',5,2,'1234567',59.00,10),(43,'2017-08-21','2017-09-29',5,3,'1234567',77.00,10),(44,'2017-04-01','2017-05-30',3,2,'1234567',56.00,11),(45,'2017-05-31','2017-07-09',3,2,'1234567',59.00,11),(46,'2017-07-10','2017-08-20',5,2,'1234567',64.50,11),(47,'2017-08-21','2017-09-29',5,2,'1234567',59.00,11),(48,'2017-04-01','2017-05-30',3,2,'1234567',56.00,12),(49,'2017-04-01','2017-05-30',3,3,'1234567',74.00,12),(50,'2017-05-31','2017-07-09',3,2,'1234567',59.00,12),(51,'2017-05-31','2017-07-09',3,3,'1234567',77.00,12),(52,'2017-07-10','2017-08-20',5,2,'1234567',64.50,12),(53,'2017-07-10','2017-08-20',5,3,'1234567',82.75,12),(54,'2017-08-21','2017-09-29',5,2,'1234567',59.00,12),(55,'2017-08-21','2017-09-29',5,3,'1234567',77.00,12),(56,'2017-04-01','2017-05-30',3,2,'1234567',56.00,13),(57,'2017-05-31','2017-07-09',3,2,'1234567',59.00,13),(58,'2017-07-10','2017-08-20',5,2,'1234567',64.50,13),(59,'2017-08-21','2017-09-29',5,2,'1234567',59.00,13),(60,'2017-05-28','2017-06-30',3,4,'1234567',75.00,14),(61,'2017-07-01','2017-08-31',5,4,'1234567',115.00,14),(62,'2017-09-01','2017-09-26',3,4,'1234567',75.00,14),(63,'2017-09-27','2017-10-27',3,4,'1234567',47.50,14),(64,'2017-05-28','2017-06-30',3,3,'1234567',67.50,15),(65,'2017-07-01','2017-08-31',5,3,'1234567',101.75,15),(66,'2017-09-01','2017-09-26',3,3,'1234567',67.50,15),(67,'2017-09-27','2017-10-27',3,3,'1234567',47.50,15),(68,'2017-01-01','2017-06-09',7,4,'6',62.75,16),(69,'2017-06-10','2017-06-30',7,4,'6',74.00,16),(70,'2017-07-01','2017-07-07',7,4,'6',95.00,16),(71,'2017-07-08','2017-08-25',7,4,'6',100.75,16),(72,'2017-08-26','2017-09-01',7,4,'6',95.00,16),(73,'2017-09-02','2017-09-15',7,4,'6',74.00,16),(74,'2017-09-16','2017-12-31',7,4,'6',62.75,16),(75,'2017-05-01','2017-05-26',4,4,'1234567',42.75,17),(76,'2017-05-27','2017-06-30',4,4,'1234567',45.50,17),(77,'2017-07-01','2017-07-14',7,4,'1234567',74.00,17),(78,'2017-07-15','2017-08-18',7,4,'1234567',80.75,17),(79,'2017-08-19','2017-08-25',7,4,'1234567',74.00,17),(80,'2017-08-26','2017-09-26',4,4,'1234567',45.50,17),(81,'2017-09-27','2017-10-31',4,4,'1234567',42.75,17),(82,'2017-05-01','2017-05-26',4,4,'1234567',48.50,18),(83,'2017-05-27','2017-06-30',4,4,'1234567',54.25,18),(84,'2017-07-01','2017-07-14',7,4,'1234567',85.50,18),(85,'2017-07-15','2017-08-18',7,4,'1234567',87.50,18),(86,'2017-08-19','2017-08-25',7,4,'1234567',85.50,18),(87,'2017-08-26','2017-09-26',4,4,'1234567',54.25,18),(88,'2017-09-27','2017-10-31',4,4,'1234567',48.50,18),(89,'2017-05-01','2017-05-31',5,8,'1234567',135.00,19),(90,'2017-06-01','2017-06-30',5,8,'1234567',155.75,19),(91,'2017-07-01','2017-08-31',7,8,'1234567',175.75,19),(92,'2017-09-01','2017-11-01',5,8,'1234567',155.75,19),(93,'2017-05-01','2017-05-26',4,4,'1234567',54.25,20),(94,'2017-05-27','2017-06-30',4,4,'1234567',61.75,20),(95,'2017-07-01','2017-07-14',7,4,'6',75.00,20),(96,'2017-07-15','2017-08-18',7,4,'6',81.75,20),(97,'2017-08-19','2017-08-25',7,4,'6',75.00,20),(98,'2017-08-26','2017-09-30',4,4,'1234567',61.75,20),(99,'2017-01-01','2017-01-08',7,2,'1234567',61.75,21),(100,'2017-01-01','2017-01-08',7,3,'1234567',68.50,21),(101,'2017-01-01','2017-01-08',7,4,'1234567',81.75,21),(102,'2017-01-09','2017-05-25',7,2,'1234567',58.00,21),(103,'2017-01-09','2017-05-25',7,3,'1234567',64.50,21),(104,'2017-01-09','2017-05-25',7,4,'1234567',78.75,21),(105,'2017-05-26','2017-06-22',7,2,'1234567',61.75,21),(106,'2017-05-26','2017-06-22',7,3,'1234567',68.50,21),(107,'2017-05-26','2017-06-22',7,4,'1234567',81.75,21),(108,'2017-06-23','2017-07-06',7,2,'1234567',68.50,21),(109,'2017-06-23','2017-07-06',7,3,'1234567',75.00,21),(110,'2017-06-23','2017-07-06',7,4,'1234567',89.25,21),(111,'2017-07-07','2017-08-24',7,2,'1234567',75.00,21),(112,'2017-07-07','2017-08-24',7,3,'1234567',81.75,21),(113,'2017-07-07','2017-08-24',7,4,'1234567',96.00,21),(114,'2017-08-25','2017-09-21',7,2,'1234567',61.75,21),(115,'2017-08-25','2017-09-21',7,3,'1234567',68.50,21),(116,'2017-08-25','2017-09-21',7,4,'1234567',81.75,21),(117,'2017-09-22','2017-12-23',7,2,'1234567',58.00,21),(118,'2017-09-22','2017-12-23',7,3,'1234567',64.50,21),(119,'2017-09-22','2017-12-23',7,4,'1234567',78.75,21),(120,'2017-12-24','2017-12-31',7,2,'1234567',61.75,21),(121,'2017-12-24','2017-12-31',7,3,'1234567',68.50,21),(122,'2017-12-24','2017-12-31',7,4,'1234567',81.75,21),(123,'2017-01-01','2017-01-08',7,5,'1234567',83.50,22),(124,'2017-01-01','2017-01-08',7,6,'1234567',90.25,22),(125,'2017-01-01','2017-01-08',7,7,'1234567',95.00,22),(126,'2017-01-01','2017-01-08',7,8,'1234567',97.00,22),(127,'2017-01-09','2017-05-25',7,5,'1234567',78.75,22),(128,'2017-01-09','2017-05-25',7,6,'1234567',86.50,22),(129,'2017-01-09','2017-05-25',7,7,'1234567',90.25,22),(130,'2017-01-09','2017-05-25',7,8,'1234567',94.00,22),(131,'2017-05-26','2017-06-22',7,5,'1234567',83.50,22),(132,'2017-05-26','2017-06-22',7,6,'1234567',90.25,22),(133,'2017-05-26','2017-06-22',7,7,'1234567',95.00,22),(134,'2017-05-26','2017-06-22',7,8,'1234567',97.00,22),(135,'2017-06-23','2017-07-06',7,5,'1234567',109.25,22),(136,'2017-06-23','2017-07-06',7,6,'1234567',116.75,22),(137,'2017-06-23','2017-07-06',7,7,'1234567',120.75,22),(138,'2017-06-23','2017-07-06',7,8,'1234567',124.50,22),(139,'2017-07-07','2017-08-24',7,5,'1234567',121.50,22),(140,'2017-07-07','2017-08-24',7,6,'1234567',130.25,22),(141,'2017-07-07','2017-08-24',7,7,'1234567',133.00,22),(142,'2017-07-07','2017-08-24',7,8,'1234567',136.75,22),(143,'2017-08-25','2017-09-21',7,5,'1234567',83.50,22),(144,'2017-08-25','2017-09-21',7,6,'1234567',90.25,22),(145,'2017-08-25','2017-09-21',7,7,'1234567',95.00,22),(146,'2017-08-25','2017-09-21',7,8,'1234567',97.00,22),(147,'2017-09-22','2017-12-23',7,5,'1234567',78.75,22),(148,'2017-09-22','2017-12-23',7,6,'1234567',86.50,22),(149,'2017-09-22','2017-12-23',7,7,'1234567',90.25,22),(150,'2017-09-22','2017-12-23',7,8,'1234567',94.00,22),(151,'2017-12-24','2017-12-31',7,5,'1234567',83.50,22),(152,'2017-12-24','2017-12-31',7,6,'1234567',90.25,22),(153,'2017-12-24','2017-12-31',7,7,'1234567',95.00,22),(154,'2017-12-24','2017-12-31',7,8,'1234567',97.00,22),(155,'2017-01-01','2017-06-30',4,2,'1234567',42.75,23),(156,'2017-07-01','2017-08-31',4,2,'1234567',47.50,23),(157,'2017-09-01','2017-12-31',4,2,'1234567',42.75,23),(158,'2017-01-01','2017-06-30',4,2,'1234567',42.75,24),(159,'2017-07-01','2017-08-31',4,2,'1234567',47.50,24),(160,'2017-09-01','2017-12-31',4,2,'1234567',42.75,24),(161,'2017-01-01','2017-06-30',4,2,'1234567',53.25,25),(162,'2017-07-01','2017-08-31',4,2,'1234567',73.25,25),(163,'2017-09-01','2017-12-31',4,2,'1234567',53.25,25),(164,'2017-01-01','2017-06-30',4,3,'1234567',57.00,26),(165,'2017-07-01','2017-08-31',4,3,'1234567',76.00,26),(166,'2017-09-01','2017-12-31',4,3,'1234567',57.00,26);
/*!40000 ALTER TABLE `base_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(9,'uniappline','base_price'),(10,'uniappline','discount'),(7,'uniappline','property'),(8,'uniappline','unit');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-02-13 22:54:42.706454'),(2,'auth','0001_initial','2017-02-13 22:54:42.874569'),(3,'admin','0001_initial','2017-02-13 22:54:42.925648'),(4,'admin','0002_logentry_remove_auto_add','2017-02-13 22:54:42.950536'),(5,'contenttypes','0002_remove_content_type_name','2017-02-13 22:54:43.015812'),(6,'auth','0002_alter_permission_name_max_length','2017-02-13 22:54:43.044959'),(7,'auth','0003_alter_user_email_max_length','2017-02-13 22:54:43.077928'),(8,'auth','0004_alter_user_username_opts','2017-02-13 22:54:43.100645'),(9,'auth','0005_alter_user_last_login_null','2017-02-13 22:54:43.126312'),(10,'auth','0006_require_contenttypes_0002','2017-02-13 22:54:43.132278'),(11,'auth','0007_alter_validators_add_error_messages','2017-02-13 22:54:43.155471'),(12,'auth','0008_alter_user_username_max_length','2017-02-13 22:54:43.184638'),(13,'sessions','0001_initial','2017-02-13 22:54:43.199384'),(14,'uniappline','0001_initial','2017-02-14 09:23:48.970909'),(15,'uniappline','0002_auto_20170214_0924','2017-02-14 09:24:54.767021'),(16,'uniappline','0003_auto_20170214_0928','2017-02-14 09:28:43.170542'),(17,'uniappline','0002_auto_20170215_0855','2017-02-15 08:55:47.459771'),(18,'uniappline','0003_auto_20170215_1122','2017-02-15 11:22:53.609069');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1kw7puhjvi6tqiiad39v1ijxzpvg12mr','NjQyOGI5NzdhZjg2YTcyZGU5MWUxOTE5NDUyYWE2YmU2NjAwMmNiMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM5YmNlODVlZGEwYmMwODJkODNmNDQ4MjUzZjhiNzczZDdjMmFiNzQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-02-28 12:51:18.163377');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `destitnation` varchar(200) NOT NULL,
  `tourist_tax` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,'Apartments Sandra','Pula','not-included'),(2,'Apartments Vesna','Novigrad','not-included'),(3,'Apartments Marina','Rovinj','not-included'),(4,'House Viktor','Pula','on-the-spot'),(5,'Rooms Jadranka','Rabac','included'),(6,'Apartments Ljiljana','Pula','not-included'),(7,'House Nikolina','Umag','not-included'),(8,'Apartments Anton','Split','not-included'),(9,'Apartments Jasenka','Dubrovnik','not-included'),(10,'Apartments Massimo','Poreč','not-included'),(11,'Apartments Dragica','Crikvenica','not-included'),(12,'Apartments and Rooms Vlatka','Zadar','included');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uniappline_discount`
--

DROP TABLE IF EXISTS `uniappline_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uniappline_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `days` int(11) NOT NULL,
  `percent` decimal(5,2) NOT NULL,
  `property_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniappline_discou_property_id_ba6e4346_fk_uniappline_property_id` (`property_id`),
  CONSTRAINT `uniappline_discou_property_id_ba6e4346_fk_uniappline_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uniappline_discount`
--

LOCK TABLES `uniappline_discount` WRITE;
/*!40000 ALTER TABLE `uniappline_discount` DISABLE KEYS */;
INSERT INTO `uniappline_discount` VALUES (1,'first-minute',90,10.00,1),(2,'first-minute',210,15.00,2),(3,'first-minute',180,10.00,2),(4,'last-minute',14,10.00,2),(5,'last-minute',7,15.00,2),(6,'first-minute',150,10.00,3),(7,'first-minute',120,5.00,3),(8,'first-minute',210,15.00,4),(9,'first-minute',180,10.00,4),(10,'first-minute',180,10.00,6),(11,'first-minute',150,5.00,6),(12,'last-minute',14,5.00,6),(13,'last-minute',7,10.00,6),(14,'first-minute',180,15.00,12),(15,'first-minute',150,10.00,12),(16,'last-minute',14,10.00,12),(17,'last-minute',7,15.00,12);
/*!40000 ALTER TABLE `uniappline_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL,
  `property_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniappline_unit_property_id_9bc0baff_fk_uniappline_property_id` (`property_id`),
  CONSTRAINT `uniappline_unit_property_id_9bc0baff_fk_uniappline_property_id` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (1,'A1','apartment',1),(2,'A2','apartment',1),(3,'A1','apartment',2),(4,'A2','apartment',2),(5,'A1','apartment',3),(6,'A2','apartment',3),(7,'A3','apartment',3),(8,'A4','apartment',3),(9,'Viktor','house',4),(10,'R1','room',5),(11,'R2','room',5),(12,'R3','room',5),(13,'R4','room',5),(14,'A1','apartment',6),(15,'A2','apartment',6),(16,'Nikolina','house',7),(17,'A1','apartment',8),(18,'A2','apartment',8),(19,'A1','apartment',9),(20,'A1','apartment',10),(21,'A1','apartment',11),(22,'A2','apartment',11),(23,'R1','room',12),(24,'R2','room',12),(25,'A1','apartment',12),(26,'A2','apartment',12);
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-28 11:49:41
