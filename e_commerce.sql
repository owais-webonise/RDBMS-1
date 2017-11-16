-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mytest
-- ------------------------------------------------------
-- Server version	5.5.58-0ubuntu0.14.04.1

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `user_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `xyz` (`variant_id`),
  CONSTRAINT `xyz` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_history` (
  `user_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
INSERT INTO `order_history` VALUES (1,1,1,2,1,'2017-11-16 17:25:55','2017-11-16 11:55:55'),(1,1,1,2,1,'2017-11-16 17:25:55','2017-11-16 11:55:55');
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `final_cost` decimal(10,2) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2017-11-14','Placed',100.00,'2017-11-14','2017-11-14 00:00:00','2017-11-16 12:14:46');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_type` varchar(20) NOT NULL,
  `discount_coupon` decimal(10,0) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `checkout_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'credit',10,'2017-11-16','placed','2017-11-16 00:00:00','2017-11-16 12:14:46',90.00);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'shoes','2017-12-11 11:42:21','2017-12-11 12:54:21'),(2,'shirt','2017-12-11 15:12:54','2017-12-11 12:15:25'),(3,'watch','2017-12-11 16:12:54','2017-12-11 12:42:32'),(4,'jacket','2017-12-11 15:14:24','2017-12-11 10:55:26'),(5,'belt','2017-12-11 14:14:24','2017-12-11 09:55:35');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'inventory_manager','owais@webonise.com','root','owais','5478412457','nagpur','2017-12-11 13:25:01','2017-12-11 13:10:21'),(2,'buyer','antrx@webonise.com','roott','antrx','1234567890','pune','2017-11-16 17:23:46','2017-11-16 11:53:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `color_name` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES (1,1,'BLACK',1,50.24,'2017-11-13 00:00:00','2017-11-16 12:57:06'),(2,2,'RED',1,58.32,'2017-11-13 00:00:00','2017-11-16 09:57:00'),(3,3,'BROWN',8,75.32,'2017-11-13 00:00:00','2017-11-12 18:30:00'),(4,4,'BLUE',5,68.32,'2017-11-13 00:00:00','2017-11-12 18:30:00'),(5,1,'GREY',3,52.25,'2017-11-14 00:00:00','2017-11-16 09:57:00'),(6,2,'BLACK',3,55.25,'2017-11-14 00:00:00','2017-11-16 09:57:00');
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-16 18:29:23
