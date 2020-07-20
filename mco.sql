-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mco
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkpoint`
--

LOCK TABLES `checkpoint` WRITE;
/*!40000 ALTER TABLE `checkpoint` DISABLE KEYS */;
INSERT INTO `checkpoint` VALUES (1,'AR-A',1),(2,'AR-B',1),(3,'AR-C',1),(4,'AR-D',1),(5,'AR-E',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Ampang Residence',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES (1,'Suria Technology','suria123');
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
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
  `name` varchar(255) NOT NULL,
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
INSERT INTO `user` VALUES ('031232332322','Agnes','012345',223322,33222233),('100110101110','Ong','01333',222222,333333);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_checkin`
--

DROP TABLE IF EXISTS `user_checkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_checkin` (
  `checkin_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `time_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `body_temp` decimal(4,2) NOT NULL,
  `plate_number` varchar(7) NOT NULL,
  `checkpoint_id` bigint NOT NULL,
  PRIMARY KEY (`checkin_id`),
  KEY `checkpoint_id` (`checkpoint_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_checkin_ibfk_1` FOREIGN KEY (`checkpoint_id`) REFERENCES `checkpoint` (`checkpoint_id`),
  CONSTRAINT `user_checkin_ibfk_2` FOREIGN KEY (`checkpoint_id`) REFERENCES `checkpoint` (`checkpoint_id`),
  CONSTRAINT `user_checkin_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_checkin`
--

LOCK TABLES `user_checkin` WRITE;
/*!40000 ALTER TABLE `user_checkin` DISABLE KEYS */;
INSERT INTO `user_checkin` VALUES (1,'031232332322','2020-07-15 07:24:27',36.60,'VAR9343',1);
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
  `time_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `duration` mediumint NOT NULL,
  `checkpoint_id` bigint NOT NULL,
  PRIMARY KEY (`checkout_id`),
  KEY `checkpoint_id` (`checkpoint_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_checkout_ibfk_1` FOREIGN KEY (`checkpoint_id`) REFERENCES `checkpoint` (`checkpoint_id`),
  CONSTRAINT `user_checkout_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_checkout`
--

LOCK TABLES `user_checkout` WRITE;
/*!40000 ALTER TABLE `user_checkout` DISABLE KEYS */;
INSERT INTO `user_checkout` VALUES (1,'031232332322','2020-07-15 07:25:40',4,4);
/*!40000 ALTER TABLE `user_checkout` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-20 22:43:32
