CREATE DATABASE  IF NOT EXISTS `projectdb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `projectdb`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: projectdb
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customers_first_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `customers_last_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `customers_passport_number` varchar(50) COLLATE utf8_bin NOT NULL,
  `customers_contract_number` varchar(50) COLLATE utf8_bin NOT NULL,
  `customers_contract_date_of_signing` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_passport_number_UNIQUE` (`customers_passport_number`),
  UNIQUE KEY `customers_contract_number_UNIQUE` (`customers_contract_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Snow','KN2049600','524/ds-a9s0d','2018-12-21'),(2,'Jane','Doy','KL4568408','65-0d156/12-1','2016-09-27');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hotel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hotels_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `stars` int(11) NOT NULL,
  `hotels_address_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Hotel_Hotels_Address1_idx` (`hotels_address_id`),
  CONSTRAINT `fk_Hotel_Hotels_Address1` FOREIGN KEY (`hotels_address_id`) REFERENCES `hotels_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Azure',4,1),(2,'SH',5,2);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_room`
--

DROP TABLE IF EXISTS `hotel_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hotel_room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_bin NOT NULL,
  `number_of_guests` int(11) NOT NULL,
  `food_type` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_room`
--

LOCK TABLES `hotel_room` WRITE;
/*!40000 ALTER TABLE `hotel_room` DISABLE KEYS */;
INSERT INTO `hotel_room` VALUES (1,'regular',2,'not all inclusive'),(2,'luxury',1,'all inclusive');
/*!40000 ALTER TABLE `hotel_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_room_hotel`
--

DROP TABLE IF EXISTS `hotel_room_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hotel_room_hotel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hotel_id` bigint(20) NOT NULL,
  `hotel_room_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Hotel room_Hotels_Hotels1_idx` (`hotel_id`),
  KEY `fk_Hotel room_Hotels_Hotel room1` (`hotel_room_id`),
  CONSTRAINT `fk_Hotel room_Hotels_Hotel room1` FOREIGN KEY (`hotel_room_id`) REFERENCES `hotel_room` (`id`),
  CONSTRAINT `fk_Hotel room_Hotels_Hotels1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_room_hotel`
--

LOCK TABLES `hotel_room_hotel` WRITE;
/*!40000 ALTER TABLE `hotel_room_hotel` DISABLE KEYS */;
INSERT INTO `hotel_room_hotel` VALUES (1,1,1),(2,2,2),(3,2,1);
/*!40000 ALTER TABLE `hotel_room_hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_room_hotel_room_price`
--

DROP TABLE IF EXISTS `hotel_room_hotel_room_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hotel_room_hotel_room_price` (
  `hotel_room_id` bigint(20) NOT NULL,
  `hotel_room_price_id` bigint(20) NOT NULL,
  PRIMARY KEY (`hotel_room_id`,`hotel_room_price_id`),
  KEY `fk_Hotel room_has_Hotel room price_Hotel room price1_idx` (`hotel_room_price_id`),
  KEY `fk_Hotel room_has_Hotel room price_Hotel room1_idx` (`hotel_room_id`),
  CONSTRAINT `fk_Hotel room_has_Hotel room price_Hotel room price1` FOREIGN KEY (`hotel_room_price_id`) REFERENCES `hotel_room_price` (`id`),
  CONSTRAINT `fk_Hotel room_has_Hotel room price_Hotel room1` FOREIGN KEY (`hotel_room_id`) REFERENCES `hotel_room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_room_hotel_room_price`
--

LOCK TABLES `hotel_room_hotel_room_price` WRITE;
/*!40000 ALTER TABLE `hotel_room_hotel_room_price` DISABLE KEYS */;
INSERT INTO `hotel_room_hotel_room_price` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(2,13),(2,14),(2,15);
/*!40000 ALTER TABLE `hotel_room_hotel_room_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_room_price`
--

DROP TABLE IF EXISTS `hotel_room_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hotel_room_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_of_month` date NOT NULL,
  `price_per_night` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_room_price`
--

LOCK TABLES `hotel_room_price` WRITE;
/*!40000 ALTER TABLE `hotel_room_price` DISABLE KEYS */;
INSERT INTO `hotel_room_price` VALUES (1,'2019-01-01',2),(2,'2019-02-01',2.1),(3,'2019-03-01',2.2),(4,'2019-04-01',2.3),(5,'2019-05-01',2.4),(6,'2019-01-06',2.5),(7,'2019-07-01',2.6),(8,'2019-08-01',2.7),(9,'2019-09-01',2.8),(10,'2019-10-01',2.9),(11,'2019-11-01',3),(12,'2019-12-01',3.1),(13,'2019-01-01',3),(14,'2019-02-01',3.4),(15,'2019-03-01',4);
/*!40000 ALTER TABLE `hotel_room_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels_address`
--

DROP TABLE IF EXISTS `hotels_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hotels_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_code` varchar(50) COLLATE utf8_bin NOT NULL,
  `country` varchar(50) COLLATE utf8_bin NOT NULL,
  `city` varchar(50) COLLATE utf8_bin NOT NULL,
  `street` varchar(50) COLLATE utf8_bin NOT NULL,
  `building_number` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels_address`
--

LOCK TABLES `hotels_address` WRITE;
/*!40000 ALTER TABLE `hotels_address` DISABLE KEYS */;
INSERT INTO `hotels_address` VALUES (1,'235540','Egypt','Hurgada','some','1'),(2,'NW1/W1','England','London','Baker Street','221B');
/*!40000 ALTER TABLE `hotels_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `insurance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `insurance_type` varchar(50) COLLATE utf8_bin NOT NULL,
  `insurance_price` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `insurance_type_UNIQUE` (`insurance_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,'Premium',251),(2,'Regular',99.99);
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `beginning_date_of_tour` date NOT NULL,
  `amount_of_days_of_tour` int(11) NOT NULL,
  `number_of_tourists` int(11) NOT NULL,
  `total_price` double DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `insurance_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `hotel_room_hotel_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Order_Users1_idx` (`user_id`),
  KEY `fk_OrderList_Customer1_idx` (`customer_id`),
  KEY `fk_OrderList_Insurance1_idx` (`insurance_id`),
  KEY `fk_OrderList_Hotel_room_Hotels1_idx` (`hotel_room_hotel_id`),
  CONSTRAINT `fk_OrderList_Customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_OrderList_Hotel_room_Hotels1` FOREIGN KEY (`hotel_room_hotel_id`) REFERENCES `hotel_room_hotel` (`id`),
  CONSTRAINT `fk_OrderList_Insurance1` FOREIGN KEY (`insurance_id`) REFERENCES `insurance` (`id`),
  CONSTRAINT `fk_Order_Users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` VALUES (1,'2020-03-15',10,2,999.99,1,1,1,1);
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (2,'ROLE_ADMIN'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_Users_has_Role_Role1_idx` (`role_id`),
  KEY `fk_Users_has_Role_Users1_idx` (`user_id`),
  CONSTRAINT `fk_Users_has_Role_Role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_Users_has_Role_Users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_loggin_UNIQUE` (`name`),
  UNIQUE KEY `users_password_UNIQUE` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user.simple','$2a$10$ZZ49JJylsBY8v8dZL/95FuNQgDZeo9oiEgzL.0iyCxUUCjSsCPiAO'),(2,'user.admin','$2a$10$l/D6AGt8vYJG.cW/lIT44uy.TAYkV9UYJ8bPuGKBwuva/ERc9Ct4K');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-14 17:14:22
