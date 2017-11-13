-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `Color`
--

DROP TABLE IF EXISTS `Color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Color` (
  `Product_id` int(11) NOT NULL,
  `Color_Name` varchar(20) NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  KEY `Product_id` (`Product_id`),
  CONSTRAINT `Color_ibfk_1` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`Product_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Color`
--

LOCK TABLES `Color` WRITE;
/*!40000 ALTER TABLE `Color` DISABLE KEYS */;
INSERT INTO `Color` VALUES (1,'Red',510,5),(1,'Blue',490,2),(1,'Green',510,7),(2,'Green',300,1),(2,'Blue',250,15),(3,'Black',20000,7),(3,'White',10000,1),(4,'White',15000,9),(4,'Black',16000,2),(5,'Black',160,18),(5,'Blue',150,8);
/*!40000 ALTER TABLE `Color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Table`
--

DROP TABLE IF EXISTS `Order_Table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order_Table` (
  `Order_Id` int(11) NOT NULL,
  `Order_Price` int(11) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `Order_date` date DEFAULT NULL,
  PRIMARY KEY (`Order_Id`),
  KEY `Email` (`Email`),
  KEY `Product_id` (`Product_id`),
  CONSTRAINT `Order_Table_ibfk_1` FOREIGN KEY (`Email`) REFERENCES `User` (`Email`),
  CONSTRAINT `Order_Table_ibfk_2` FOREIGN KEY (`Product_id`) REFERENCES `Product` (`Product_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Table`
--

LOCK TABLES `Order_Table` WRITE;
/*!40000 ALTER TABLE `Order_Table` DISABLE KEYS */;
INSERT INTO `Order_Table` VALUES (1,1510,'abc@gmail.com',1,'2017-10-10'),(2,300,'xyz@gmail.com',2,'2017-10-15'),(3,20000,'npo@gmail.com',3,'2017-07-15'),(4,510,'fgh@yahoo.in',1,'2017-08-15');
/*!40000 ALTER TABLE `Order_Table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payment_Table`
--

DROP TABLE IF EXISTS `Payment_Table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payment_Table` (
  `Payment_Id` int(11) NOT NULL,
  `Order_Id` int(11) NOT NULL,
  `Payment_mode` varchar(20) NOT NULL,
  `Discount` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `Payment_date` date DEFAULT NULL,
  PRIMARY KEY (`Payment_Id`),
  KEY `Order_Id` (`Order_Id`),
  CONSTRAINT `Payment_Table_ibfk_1` FOREIGN KEY (`Order_Id`) REFERENCES `Order_Table` (`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payment_Table`
--

LOCK TABLES `Payment_Table` WRITE;
/*!40000 ALTER TABLE `Payment_Table` DISABLE KEYS */;
INSERT INTO `Payment_Table` VALUES (1,1,'Credit',500,1010,'2017-10-11'),(2,2,'Cash',50,250,'2017-10-17'),(3,4,'Cash',0,510,'2017-09-17');
/*!40000 ALTER TABLE `Payment_Table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `Product_Id` int(11) NOT NULL,
  `Product_Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Product_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Shirt'),(2,'Trousers'),(3,'Camera'),(4,'Phone'),(5,'Pen');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `Name` varchar(25) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('abc','abc@gmail.com','12345','Buyer','Kothrud'),('fgh','fgh@yahoo.in','98652','Inventory Manager','Baner'),('npo','npo@gmail.com','45678','Buyer','Katraj'),('tyu','tyu@outlook.com','56789','Buyer','Shivaji'),('xyz','xyz@gmail.com','67890','Inventory Manager','Bavdhan');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-12 17:17:42
