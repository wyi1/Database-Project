-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: MCO
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
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist` (
  `blacklist_id` mediumint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`blacklist_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `blacklist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
INSERT INTO `blacklist` VALUES (2,'100110101110');
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkpoint`
--

DROP TABLE IF EXISTS `checkpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkpoint` (
  `checkpoint_id` bigint NOT NULL AUTO_INCREMENT,
  `entrance` varchar(255) NOT NULL,
  `location_id` bigint NOT NULL,
  PRIMARY KEY (`checkpoint_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `checkpoint_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkpoint`
--

LOCK TABLES `checkpoint` WRITE;
/*!40000 ALTER TABLE `checkpoint` DISABLE KEYS */;
INSERT INTO `checkpoint` VALUES (1,'Ampang Residence - Gate A',1),(2,'Ampang Residence - Gate B',1),(3,'Ampang Residence - Gate C',1),(4,'Ampang Residence - Gate D',1),(5,'Ampang Residence - Gate E',1),(6,'Suria Condominium - Gate 1',2),(7,'Suria Condominium - Gate 2',2),(8,'Suria Condominium - Gate 3',2),(9,'Suria Condominium - Gate 4',2),(10,'Suria Condominium - Gate 5',2);
/*!40000 ALTER TABLE `checkpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` bigint NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  `mgm_id` bigint NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `mgm_id` (`mgm_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`mgm_id`) REFERENCES `management` (`mgm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Ampang Residence',1),(2,'Suria Condominium',1);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management` (
  `mgm_id` bigint NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`mgm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES (1,'Suria Technology','suria123'),(2,'Jaya Resources','jaya'),(3,'Hup Seng Org','hupseng');
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `mgm_profile_update_trail` AFTER UPDATE ON `management` FOR EACH ROW BEGIN
INSERT INTO mgm_profile_update values (OLD.mgm_id,OLD.company_name,NEW.company_name,OLD.password,NEW.password);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mgm_profile_update`
--

DROP TABLE IF EXISTS `mgm_profile_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mgm_profile_update` (
  `mgm_id` bigint NOT NULL,
  `old_company_name` varchar(255) NOT NULL,
  `new_company_name` varchar(255) DEFAULT NULL,
  `old_password` varchar(255) NOT NULL,
  `new_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgm_profile_update`
--

LOCK TABLES `mgm_profile_update` WRITE;
/*!40000 ALTER TABLE `mgm_profile_update` DISABLE KEYS */;
INSERT INTO `mgm_profile_update` VALUES (3,'Hup Seng Org','Hup Seng Org','huphup','hupseng');
/*!40000 ALTER TABLE `mgm_profile_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `package_id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(7,2) DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `duration` int NOT NULL,
  `availability` date DEFAULT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,699.99,5,6,'2025-12-31'),(2,999.99,5,12,'2025-12-31'),(3,1599.99,10,24,'2025-12-31'),(4,2299.99,10,36,'2020-12-31');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` bigint NOT NULL AUTO_INCREMENT,
  `subs_id` bigint NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `subs_id` (`subs_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`subs_id`) REFERENCES `subscription` (`subs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'2020-07-15',999.99);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `subs_id` bigint NOT NULL AUTO_INCREMENT,
  `mgm_id` bigint NOT NULL,
  `package_id` bigint NOT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`subs_id`),
  KEY `mgm_id` (`mgm_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`mgm_id`) REFERENCES `management` (`mgm_id`),
  CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (1,1,2,'2021-07-01');
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `face_id` bigint NOT NULL,
  `thumbprint_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('031232332322','123456789',223322,333222),('100110101110','01333',222222,224466),('950318148263','0128283333',111222,133444);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `UserProfileUpdate` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
INSERT INTO UserProfileUpdateLog values(OLD.user_id,OLD.phone,NEW.phone,OLD.face_id,NEW.face_id,OLD.thumbprint_id,NEW.thumbprint_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_checkin`
--

DROP TABLE IF EXISTS `user_checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_checkin` (
  `checkin_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `body_temp` decimal(4,2) NOT NULL,
  `plate_number` varchar(7) DEFAULT NULL,
  `checkpoint_id` bigint NOT NULL,
  `time_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`checkin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_checkin`
--

LOCK TABLES `user_checkin` WRITE;
/*!40000 ALTER TABLE `user_checkin` DISABLE KEYS */;
INSERT INTO `user_checkin` VALUES (1,'031232332322',35.60,'VAB9202',1,'2020-07-26 06:51:27'),(2,'100110101110',36.60,'VRS9202',9,'2020-07-26 06:52:07'),(3,'001206138228',36.80,'TJS9384',4,'2020-07-26 06:53:06'),(4,'661207148733',35.70,'PSJ2039',7,'2020-07-26 07:07:59'),(5,'850429167834',36.50,'WA3749C',5,'2020-07-26 07:22:30'),(6,'581125106692',35.80,'TBX9127',3,'2020-07-26 07:25:19'),(7,'730918163823',36.40,'MCI3828',7,'2020-07-26 07:29:55'),(8,'690418132929',36.50,'SA2938D',8,'2020-07-26 07:36:05');
/*!40000 ALTER TABLE `user_checkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_checkout`
--

DROP TABLE IF EXISTS `user_checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_checkout` (
  `checkout_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `checkpoint_id` bigint NOT NULL,
  `time_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`checkout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_checkout`
--

LOCK TABLES `user_checkout` WRITE;
/*!40000 ALTER TABLE `user_checkout` DISABLE KEYS */;
INSERT INTO `user_checkout` VALUES (1,'031232332322',3,'2020-07-26 07:15:15'),(2,'100110101110',6,'2020-07-26 07:15:38'),(3,'001206138228',4,'2020-07-26 07:15:57'),(4,'690418132929',8,'2020-07-26 07:36:07'),(5,'661207148733',8,'2020-07-26 07:36:51'),(6,'581125106692',4,'2020-07-26 07:37:09'),(7,'730918163823',7,'2020-07-26 07:37:26'),(8,'850429167834',3,'2020-07-26 07:37:56');
/*!40000 ALTER TABLE `user_checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofileupdatelog`
--

DROP TABLE IF EXISTS `userprofileupdatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userprofileupdatelog` (
  `user_id` varchar(255) NOT NULL,
  `old_phone` varchar(11) NOT NULL,
  `new_phone` varchar(11) DEFAULT NULL,
  `old_faceid` bigint NOT NULL,
  `new_faceid` bigint DEFAULT NULL,
  `old_thumbid` bigint NOT NULL,
  `new_thumbid` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofileupdatelog`
--

LOCK TABLES `userprofileupdatelog` WRITE;
/*!40000 ALTER TABLE `userprofileupdatelog` DISABLE KEYS */;
INSERT INTO `userprofileupdatelog` VALUES ('100110101110','01333','01333',222222,222222,333333,224466),('031232332322','012345','123456789',223322,223322,333222,333222),('031232332322','123456789','123456789',223322,223322,333222,333222);
/*!40000 ALTER TABLE `userprofileupdatelog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-26 18:36:28
