-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bank_ng
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `checking`
--

DROP TABLE IF EXISTS `checking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checking` (
  `cid` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  `overdraft` decimal(10,2) DEFAULT '0.00',
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`),
  KEY `uid` (`uid`),
  CONSTRAINT `checking_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `customers` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checking`
--

LOCK TABLES `checking` WRITE;
/*!40000 ALTER TABLE `checking` DISABLE KEYS */;
INSERT INTO `checking` VALUES (1,1,106.00,0.00,'2020-05-05 10:53:34','2020-05-05 10:43:17'),(2,2,10.50,5.00,'2020-05-05 10:53:34','2020-05-05 10:43:23'),(3,1,2100.00,0.00,'2020-05-05 10:54:07','2020-05-05 10:54:07'),(4,2,10501.05,0.00,'2020-05-05 10:54:32','2020-05-05 10:54:32');
/*!40000 ALTER TABLE `checking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `update_checking_trigger` AFTER UPDATE ON `checking` FOR EACH ROW insert into checking_audit
set cid = old.cid,
balance_old = OLD.balance,
balance_new = NEW.balance,
overdraft_old = OLD.overdraft,
overdraft_new = NEW.overdraft,
change_datetime = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `checking_audit`
--

DROP TABLE IF EXISTS `checking_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checking_audit` (
  `cid` bigint DEFAULT NULL,
  `balance_old` decimal(10,2) DEFAULT NULL,
  `balance_new` decimal(10,2) DEFAULT NULL,
  `overdraft_old` decimal(10,2) DEFAULT NULL,
  `overdraft_new` decimal(10,2) DEFAULT NULL,
  `change_datetime` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checking_audit`
--

LOCK TABLES `checking_audit` WRITE;
/*!40000 ALTER TABLE `checking_audit` DISABLE KEYS */;
INSERT INTO `checking_audit` VALUES (2,0.00,10.00,0.00,5.00,'2020-05-12 12:36:14'),(1,100.00,105.00,0.00,0.00,'2020-05-12 12:38:36'),(2,10.00,10.50,5.00,5.00,'2020-05-12 12:38:36'),(3,2000.00,2100.00,0.00,0.00,'2020-05-12 12:38:36'),(4,10001.00,10501.05,0.00,0.00,'2020-05-12 12:38:36'),(1,105.00,106.00,0.00,0.00,'2020-05-12 14:46:00');
/*!40000 ALTER TABLE `checking_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Siti','siti@upm.edu.my','01112222332',NULL,NULL,NULL,'2020-05-05 10:34:31','2020-05-05 10:34:31'),(2,'Ng Keng Yap','kengyap@upm.edu.my','01115233601',NULL,NULL,NULL,'2020-05-05 10:34:35','2020-05-05 10:34:35'),(3,'Mutu','mutu@upm.edu.my','01202320223',NULL,NULL,NULL,'2020-05-05 11:03:56','2020-05-05 11:03:56'),(4,'Bobo','bobo@upm','222',NULL,NULL,NULL,'2020-05-12 12:55:48','2020-05-12 12:55:48'),(6,'Mobi','ibom@hotmail.com','0129392939','immobi','f','immobile how r u','2020-06-10 00:44:05','2020-06-10 00:44:05'),(7,'Rudy','rudydabom@gmail.com','0122234445','rudybomda','u','im da bom cant you see','2020-06-10 00:46:32','2020-06-10 00:46:32'),(8,'Rudy','rudydabom@gmail.com','0122234445','rudybomda','u','im da bom cant you see','2020-06-10 00:48:52','2020-06-10 00:48:52'),(9,'Lickilicky','lickiallthewayy@gmail.com','0139292929','lickiyou929','m','gonnna lickilicky show me skillsy','2020-06-10 00:49:53','2020-06-10 00:49:53'),(10,'Abada','dabada@gmail.com','0189992222','abadabada','m','dabadabadabadabadaba daaaaaaaaaaaaaa','2020-06-10 00:52:45','2020-06-10 00:52:45');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `insert_customer` BEFORE INSERT ON `customers` FOR EACH ROW insert into customers_insert_audit
set uid=NEW.uid, name = NEW.name, email = NEW.email, phone = NEW.phone, change_datetime = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `delete_customer` AFTER DELETE ON `customers` FOR EACH ROW insert into customers_delete_audit
set uid = OLD.uid, name= OLD.name, email = OLD.email, phone = OLD.phone, change_datetime = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customers_delete_audit`
--

DROP TABLE IF EXISTS `customers_delete_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_delete_audit` (
  `uid` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `change_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_delete_audit`
--

LOCK TABLES `customers_delete_audit` WRITE;
/*!40000 ALTER TABLE `customers_delete_audit` DISABLE KEYS */;
INSERT INTO `customers_delete_audit` VALUES (5,'Mimi','mimi@upm','0193729382','2020-05-12 15:06:12'),(11,'','','','2020-06-10 00:57:39');
/*!40000 ALTER TABLE `customers_delete_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers_insert_audit`
--

DROP TABLE IF EXISTS `customers_insert_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers_insert_audit` (
  `uid` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `change_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers_insert_audit`
--

LOCK TABLES `customers_insert_audit` WRITE;
/*!40000 ALTER TABLE `customers_insert_audit` DISABLE KEYS */;
INSERT INTO `customers_insert_audit` VALUES (5,'Mimi','mimi@upm','0193729382','2020-05-12 15:02:00'),(0,'Mobi','ibom@hotmail.com','0129392939','2020-06-10 00:44:05'),(0,'Rudy','rudydabom@gmail.com','0122234445','2020-06-10 00:46:32'),(0,'Rudy','rudydabom@gmail.com','0122234445','2020-06-10 00:48:52'),(0,'Lickilicky','lickiallthewayy@gmail.com','0139292929','2020-06-10 00:49:53'),(0,'Abada','dabada@gmail.com','0189992222','2020-06-10 00:52:45'),(0,'','','','2020-06-10 00:54:15');
/*!40000 ALTER TABLE `customers_insert_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saving`
--

DROP TABLE IF EXISTS `saving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saving` (
  `cid` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL,
  `balance` decimal(10,2) DEFAULT '0.00',
  `created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modified_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cid`),
  KEY `uid` (`uid`),
  CONSTRAINT `saving_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `customers` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saving`
--

LOCK TABLES `saving` WRITE;
/*!40000 ALTER TABLE `saving` DISABLE KEYS */;
INSERT INTO `saving` VALUES (1,1,16.00,'2020-05-05 10:57:58','2020-05-05 10:57:58'),(2,1,85.00,'2020-05-05 10:58:11','2020-05-05 10:58:11'),(3,2,46.80,'2020-05-05 10:58:23','2020-05-05 10:58:23');
/*!40000 ALTER TABLE `saving` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `update_saving_trigger` AFTER UPDATE ON `saving` FOR EACH ROW insert into saving_audit
set cid = old.cid,
uid = old.uid,
balance_old = OLD.balance,
balance_new = NEW.balance,
change_datetime = NOW() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `saving_audit`
--

DROP TABLE IF EXISTS `saving_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saving_audit` (
  `cid` bigint DEFAULT NULL,
  `uid` bigint DEFAULT NULL,
  `balance_old` decimal(10,2) DEFAULT NULL,
  `balance_new` decimal(10,2) DEFAULT NULL,
  `change_datetime` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saving_audit`
--

LOCK TABLES `saving_audit` WRITE;
/*!40000 ALTER TABLE `saving_audit` DISABLE KEYS */;
INSERT INTO `saving_audit` VALUES (2,1,10.00,10.00,'2020-05-12 13:05:51'),(2,1,10.00,100.00,'2020-05-12 13:06:24'),(2,1,100.00,95.00,'2020-05-12 13:37:03'),(1,1,1.00,6.00,'2020-05-12 13:37:03'),(2,1,95.00,90.00,'2020-05-12 13:47:32'),(1,1,6.00,11.00,'2020-05-12 13:47:32'),(2,1,90.00,85.00,'2020-05-12 13:53:36'),(1,1,11.00,16.00,'2020-05-12 13:53:36'),(3,2,47.80,46.80,'2020-05-12 14:46:00');
/*!40000 ALTER TABLE `saving_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_log`
--

DROP TABLE IF EXISTS `transfer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_log` (
  `transfer_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `from_account` bigint DEFAULT NULL,
  `from_account_type` varchar(20) DEFAULT NULL,
  `to_account` bigint DEFAULT NULL,
  `to_account_type` varchar(20) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_log`
--

LOCK TABLES `transfer_log` WRITE;
/*!40000 ALTER TABLE `transfer_log` DISABLE KEYS */;
INSERT INTO `transfer_log` VALUES ('2020-05-12 14:45:33',2,'saving',1,'checking',500.00,'insufficient fund'),('2020-05-12 14:46:00',3,'saving',1,'checking',1.00,'1');
/*!40000 ALTER TABLE `transfer_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-22 22:51:07
