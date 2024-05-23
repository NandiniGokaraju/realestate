-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: amma
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `id` binary(16) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `agency_name` varchar(255) DEFAULT NULL,
  `license_number` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (_binary 'Ö\Û*ß\Ôô8\‹!H[\Ò','nandini','anushabaditha1999@gmail.com','123','12312312','codegnanEstates','89898','2024-05-19 06:14:26','2024-05-19 06:14:26','p..b.nagar vijayawada andhra pradesh.'),(_binary '=Øiã,Ôª±ü	OqH','Nandini','nandinigokaraju2003@gmail.com','123','9502070678','Sivitha estates','101','2024-05-22 11:12:56','2024-05-22 11:12:56','MG road, vijayawada');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_messages`
--

DROP TABLE IF EXISTS `chat_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_messages` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `sender_id` binary(16) DEFAULT NULL,
  `receiver_id` binary(16) DEFAULT NULL,
  `message` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `file_path` varchar(255) DEFAULT NULL,
  `property_id` int DEFAULT NULL,
  PRIMARY KEY (`chat_id`),
  KEY `pid` (`property_id`),
  CONSTRAINT `pid` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

LOCK TABLES `chat_messages` WRITE;
/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
INSERT INTO `chat_messages` VALUES (19,_binary '1\Á˛†\Ôô8\‹!H[\Ò',_binary '›ÅM;ù\Ôô8\‹!H[\Ò','hello anusha codegnan','2024-05-19 05:57:05',NULL,14),(30,_binary '1\Á˛†\Ôô8\‹!H[\Ò',_binary 'Ö\Û*ß\Ôô8\‹!H[\Ò','hi 1999 ','2024-05-19 07:23:34',NULL,NULL),(31,_binary '1\Á˛†\Ôô8\‹!H[\Ò',_binary 'Ö\Û*ß\Ôô8\‹!H[\Ò','hello 1999 2','2024-05-19 07:23:41',NULL,NULL),(32,_binary 'Ö\Û*ß\Ôô8\‹!H[\Ò',_binary '1\Á˛†\Ôô8\‹!H[\Ò','ok anusha 206','2024-05-19 13:58:01',NULL,15),(33,_binary '›ÅM;ù\Ôô8\‹!H[\Ò',_binary 'Ö\Û*ß\Ôô8\‹!H[\Ò','hi from anusha codegnan','2024-05-19 14:12:44',NULL,NULL),(34,_binary '›ÅM;ù\Ôô8\‹!H[\Ò',_binary '1\Á˛†\Ôô8\‹!H[\Ò','ok from anusha 206','2024-05-19 14:26:55',NULL,14);
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `bedrooms` int NOT NULL,
  `bathrooms` int NOT NULL,
  `location` varchar(255) NOT NULL,
  `property_type` varchar(50) NOT NULL,
  `agent_id` binary(16) DEFAULT NULL,
  `owner_id` binary(16) DEFAULT NULL,
  `added_by_id` binary(16) DEFAULT NULL,
  `added_by_user` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `size` varchar(50) NOT NULL,
  `direction_faced` varchar(50) NOT NULL,
  `year_built` year DEFAULT NULL,
  `amenities` text,
  `floor_plan` varchar(255) DEFAULT NULL,
  `property_condition` varchar(50) DEFAULT NULL,
  `view` varchar(50) DEFAULT NULL,
  `status` enum('listed','sold') DEFAULT 'listed',
  `purpose` enum('For sales','For Rent','For Buy') DEFAULT NULL,
  `parking` enum('Parallel Parking','Perpendicular Parking','Angle Parking','Diagonal Parking','Parking Garage','Parking Lot','Valet Parking','Handicap Parking','Tandem Parking') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `ownerid` (`owner_id`),
  KEY `fk_property_agent` (`agent_id`),
  CONSTRAINT `fk_property_agent` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  CONSTRAINT `fk_property_owner` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (14,'Charming Family House','A beautiful family house with a spacious garden and modern amenities.',250000.00,4,3,'123 Maple Street, Springfield','house',NULL,_binary '›ÅM;ù\Ôô8\‹!H[\Ò',_binary '›ÅM;ù\Ôô8\‹!H[\Ò','anusha@codegnan.com','agent.jpg','2000 sqft','North',2003,'Swimming pool, Gym, Sauna','3','Excellent','Garden view','listed','For sales','Perpendicular Parking'),(15,'abc house ','asdfghjklertyuicvbnm',230987.00,4,3,'vijayawada','house',_binary 'Ö\Û*ß\Ôô8\‹!H[\Ò',_binary '1\Á˛†\Ôô8\‹!H[\Ò',_binary 'Ö\Û*ß\Ôô8\‹!H[\Ò','anushabaditha1999@gmail.com','house.jpg','1200sqft','north',2010,'swimming pool','2','new house','village view','listed','For Rent','Perpendicular Parking'),(16,'Awesome House','Beautiful home to live in',5000000.00,3,4,'delhi','house',NULL,_binary '!∫á\Ó+Ôª±ü	OqH',_binary '!∫á\Ó+Ôª±ü	OqH','gokarajunandini@gmail.com','img 2.jpg','900sqmt','east',2023,'swimming pool, play area, medical centre','no floor','the property should be clean ','no view','sold','For sales','Parking Lot'),(17,'triveni house','beautiful house along with nice furniture',4000000.00,3,4,'vizag','house',_binary '=Øiã,Ôª±ü	OqH',_binary '!∫á\Ó+Ôª±ü	OqH',_binary '=Øiã,Ôª±ü	OqH','nandinigokaraju2003@gmail.com','img 3.jpeg','700sqmt','east',2018,'swimming pool, play area','no floor','good','no view','sold','For sales','Parallel Parking'),(18,'threesome house','beautiful home',4500000.00,3,4,'punjab','house',_binary '=Øiã,Ôª±ü	OqH',_binary '!∫á\Ó+Ôª±ü	OqH',_binary '=Øiã,Ôª±ü	OqH','nandinigokaraju2003@gmail.com','img 4.jpg','750sqmt','east',2019,'swimming pool','no floor','good','no view','sold','For sales','Parallel Parking'),(19,'Royal villa','beautiful home with furniture',3000000.00,3,3,'vijayawada','house',NULL,_binary '!∫á\Ó+Ôª±ü	OqH',_binary '›ÅM;ù\Ôô8\‹!H[\Ò','anusha@codegnan.com','img 4.jpg','900sqmt','east',2020,'swimming pool','2 floors','the property should be clean ','no view','listed','For sales','Parking Lot'),(20,'sai nilayam','A nice house with vintage look',1500000.00,2,2,'guntur','house',_binary '=Øiã,Ôª±ü	OqH',_binary '!∫á\Ó+Ôª±ü	OqH',_binary '=Øiã,Ôª±ü	OqH','nandinigokaraju2003@gmail.com','img 5.jpg','550sqmt','east',2015,'play area for kids','no floor','good','no view','sold','For sales','Parallel Parking');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `property_id` int DEFAULT NULL,
  `seller_id` binary(16) DEFAULT NULL,
  `agent_id` binary(16) DEFAULT NULL,
  `buyer_id` binary(16) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `sale_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`),
  KEY `seller_id` (`seller_id`),
  KEY `agent_id` (`agent_id`),
  KEY `buyer_id` (`buyer_id`),
  CONSTRAINT `fk_sale_agent` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  CONSTRAINT `fk_sale_seller` FOREIGN KEY (`seller_id`) REFERENCES `user` (`id`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (9,17,_binary '!∫á\Ó+Ôª±ü	OqH',_binary '=Øiã,Ôª±ü	OqH',_binary '!∫á\Ó+Ôª±ü	OqH',4000000.00,'2024-05-22 11:36:28'),(10,18,_binary '!∫á\Ó+Ôª±ü	OqH',_binary '=Øiã,Ôª±ü	OqH',_binary '!∫á\Ó+Ôª±ü	OqH',4500000.00,'2024-05-22 11:43:55'),(11,16,_binary '!∫á\Ó+Ôª±ü	OqH',NULL,_binary '›ÅM;ù\Ôô8\‹!H[\Ò',5000000.00,'2024-05-22 12:24:20'),(12,20,_binary '!∫á\Ó+Ôª±ü	OqH',_binary '=Øiã,Ôª±ü	OqH',_binary '!∫á\Ó+Ôª±ü	OqH',1500000.00,'2024-05-23 04:43:17');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` binary(16) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_no` bigint DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_no` (`phone_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (_binary '!∫á\Ó+Ôª±ü	OqH','Nandini Gokaraju','gokarajunandini@gmail.com','123',9502070678,'786'),(_binary '1\Á˛†\Ôô8\‹!H[\Ò','baditha','badithaanusha206@gmail.com','123',12312312312,'abc colony vijjayawda 12-21/1'),(_binary '›ÅM;ù\Ôô8\‹!H[\Ò','anusha','anusha@codegnan.com','123',6304061929,'vijayawada benzcircle 61-34/34.');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 10:39:46
