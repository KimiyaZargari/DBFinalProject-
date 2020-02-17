-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: db_Final_Project
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
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
  `firstName` varchar(12) DEFAULT NULL,
  `lastName` varchar(12) DEFAULT NULL,
  `credit` float DEFAULT NULL,
  `gender` enum('m','f') DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('kim','z',475,'f',7,'kimi','12345','72aa1c178c4d426f748a8e8802c26331'),('hafez','b',2000,'m',8,'h.bahr','12345','81dc9bdb52d04dc20036dbd8313ed055'),('kian','ali',4440,'m',9,'k.ali','12345','c5b8c7c418be39bac6c35a6413fcc9a4'),('unknown','unknown',0,'f',10,'unknown','12345','1');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_addr`
--

DROP TABLE IF EXISTS `customer_addr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_addr` (
  `customer_ID` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`customer_ID`,`address`),
  CONSTRAINT `customer_addr` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_addr`
--

LOCK TABLES `customer_addr` WRITE;
/*!40000 ALTER TABLE `customer_addr` DISABLE KEYS */;
INSERT INTO `customer_addr` VALUES (7,'here'),(7,'home'),(8,'kerman'),(9,'k');
/*!40000 ALTER TABLE `customer_addr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_pn`
--

DROP TABLE IF EXISTS `customer_pn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_pn` (
  `code` char(3) NOT NULL,
  `pn` char(8) NOT NULL,
  `customer_ID` int(11) NOT NULL,
  PRIMARY KEY (`customer_ID`,`pn`,`code`),
  CONSTRAINT `customer` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_pn`
--

LOCK TABLES `customer_pn` WRITE;
/*!40000 ALTER TABLE `customer_pn` DISABLE KEYS */;
INSERT INTO `customer_pn` VALUES ('021','22440016',7),('021','22440440',7),('022','123456',8),('022','12345634',8),('022','00000000',9);
/*!40000 ALTER TABLE `customer_pn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivering_order`
--

DROP TABLE IF EXISTS `delivering_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivering_order` (
  `delivery_ID` int(11) NOT NULL,
  `order_ID` int(11) NOT NULL,
  PRIMARY KEY (`delivery_ID`,`order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivering_order`
--

LOCK TABLES `delivering_order` WRITE;
/*!40000 ALTER TABLE `delivering_order` DISABLE KEYS */;
INSERT INTO `delivering_order` VALUES (3,19),(3,22),(3,23),(3,25),(3,27),(4,21),(4,26);
/*!40000 ALTER TABLE `delivering_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_person`
--

DROP TABLE IF EXISTS `delivery_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery_person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(12) DEFAULT NULL,
  `last_name` varchar(12) DEFAULT NULL,
  `status` enum('f','s') DEFAULT NULL,
  `credit` float DEFAULT NULL,
  `pn` char(8) DEFAULT NULL,
  `pn_code` char(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_person`
--

LOCK TABLES `delivery_person` WRITE;
/*!40000 ALTER TABLE `delivery_person` DISABLE KEYS */;
INSERT INTO `delivery_person` VALUES (3,'max','aimini','f',93.7,'12345678','021'),(4,'max','aimini2','f',11.5,'12345678','021'),(5,'james','bond','f',0,'12345678','021'),(6,'sahar','k','f',0,'12345678','021');
/*!40000 ALTER TABLE `delivery_person` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_delivery_person_insert` AFTER INSERT ON `delivery_person` FOR EACH ROW Begin Insert into delivery_person_status_log values(id,'f', new.id); end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_delivery_person_update` AFTER UPDATE ON `delivery_person` FOR EACH ROW Begin
If new.status != old.status then
Insert into delivery_person_status_log values(id, new.status, new.id);
End if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `delivery_person_status_log`
--

DROP TABLE IF EXISTS `delivery_person_status_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery_person_status_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('s','f') DEFAULT NULL,
  `delivery_person_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_person_status_log`
--

LOCK TABLES `delivery_person_status_log` WRITE;
/*!40000 ALTER TABLE `delivery_person_status_log` DISABLE KEYS */;
INSERT INTO `delivery_person_status_log` VALUES (1,'f',6),(2,'s',3),(3,'f',3),(4,'s',3),(5,'s',4),(6,'f',4),(7,'f',3),(8,'s',3),(9,'f',3);
/*!40000 ALTER TABLE `delivery_person_status_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` decimal(5,4) DEFAULT NULL,
  `sold` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (4,'num',50,0.1000,2),(5,'tv',300,0.2000,1),(6,'com',150,0.0000,6),(7,'phone',20,0.1000,2),(8,'mirror',60,0.5000,2),(9,'pen',5,0.0000,0),(10,'mug',10,0.1000,0),(11,'table',60,0.2000,0),(12,'table2',80,0.2000,1),(13,'bag',40,0.0000,4);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market`
--

DROP TABLE IF EXISTS `market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `market` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `manager` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `pn` char(8) DEFAULT NULL,
  `pn_code` char(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market`
--

LOCK TABLES `market` WRITE;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
INSERT INTO `market` VALUES (1,'numnum','tehran','hmm','fdgf','12345678','021'),(2,'dg','tehran','manager','somewhere','12345678','021'),(3,'m_3','tehran','manager','somewhere','12345678','021');
/*!40000 ALTER TABLE `market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_delivery_person`
--

DROP TABLE IF EXISTS `market_delivery_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `market_delivery_person` (
  `market_ID` int(11) NOT NULL,
  `delivery_person_ID` int(11) NOT NULL,
  PRIMARY KEY (`market_ID`,`delivery_person_ID`),
  KEY `dilivery_person_ID` (`delivery_person_ID`),
  CONSTRAINT `dilivery_person_ID` FOREIGN KEY (`delivery_person_ID`) REFERENCES `delivery_person` (`id`),
  CONSTRAINT `market_ID` FOREIGN KEY (`market_ID`) REFERENCES `market` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_delivery_person`
--

LOCK TABLES `market_delivery_person` WRITE;
/*!40000 ALTER TABLE `market_delivery_person` DISABLE KEYS */;
INSERT INTO `market_delivery_person` VALUES (1,3),(2,3),(1,4),(2,4),(1,5);
/*!40000 ALTER TABLE `market_delivery_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_items`
--

DROP TABLE IF EXISTS `market_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `market_items` (
  `item_ID` int(11) NOT NULL,
  `num_of_item` int(11) DEFAULT NULL,
  `market_ID` int(11) NOT NULL,
  PRIMARY KEY (`market_ID`,`item_ID`),
  KEY `items_of_markets_ID` (`item_ID`),
  CONSTRAINT `items_of_markets_ID` FOREIGN KEY (`item_ID`) REFERENCES `item` (`id`),
  CONSTRAINT `market_ID_items` FOREIGN KEY (`market_ID`) REFERENCES `market` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_items`
--

LOCK TABLES `market_items` WRITE;
/*!40000 ALTER TABLE `market_items` DISABLE KEYS */;
INSERT INTO `market_items` VALUES (4,9,1),(5,50,1),(7,3,1),(10,40,1),(4,25,2),(5,17,2),(6,32,2),(8,19,2),(12,18,2),(13,65,2),(9,100,3),(10,30,3),(11,60,3);
/*!40000 ALTER TABLE `market_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_operation_agent`
--

DROP TABLE IF EXISTS `market_operation_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `market_operation_agent` (
  `market_ID` int(11) NOT NULL,
  `operation_agent_ID` int(11) NOT NULL,
  PRIMARY KEY (`market_ID`,`operation_agent_ID`),
  KEY `operation_ID` (`operation_agent_ID`),
  CONSTRAINT `market_ID_operation` FOREIGN KEY (`market_ID`) REFERENCES `market` (`id`),
  CONSTRAINT `operation_ID` FOREIGN KEY (`operation_agent_ID`) REFERENCES `operation_agent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_operation_agent`
--

LOCK TABLES `market_operation_agent` WRITE;
/*!40000 ALTER TABLE `market_operation_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_operation_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_support`
--

DROP TABLE IF EXISTS `market_support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `market_support` (
  `market_ID` int(11) NOT NULL,
  `support_ID` int(11) NOT NULL,
  PRIMARY KEY (`market_ID`,`support_ID`),
  KEY `support_ID` (`support_ID`),
  CONSTRAINT `market_ID_support` FOREIGN KEY (`market_ID`) REFERENCES `market` (`id`),
  CONSTRAINT `support_ID` FOREIGN KEY (`support_ID`) REFERENCES `support` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_support`
--

LOCK TABLES `market_support` WRITE;
/*!40000 ALTER TABLE `market_support` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_working_hour`
--

DROP TABLE IF EXISTS `market_working_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `market_working_hour` (
  `open` time NOT NULL,
  `close` time DEFAULT NULL,
  `market_ID` int(11) NOT NULL,
  PRIMARY KEY (`market_ID`,`open`),
  CONSTRAINT `market_hour` FOREIGN KEY (`market_ID`) REFERENCES `market` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_working_hour`
--

LOCK TABLES `market_working_hour` WRITE;
/*!40000 ALTER TABLE `market_working_hour` DISABLE KEYS */;
INSERT INTO `market_working_hour` VALUES ('00:00:13','00:00:15',1),('09:20:00','10:20:00',1),('11:20:00','12:20:00',1),('13:00:00','14:00:00',1),('16:10:00','23:10:00',1),('10:00:00','23:00:00',2);
/*!40000 ALTER TABLE `market_working_hour` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_market_working_hour_insert` BEFORE INSERT ON `market_working_hour` FOR EACH ROW begin
DECLARE done INT DEFAULT FALSE;
Declare open_time, close_time time;
Declare time_table cursor for select open, close from market_working_hour as t where new.market_id =  t.market_id; 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
Open time_table;
my_loop: loop
Fetch time_table into open_time, close_time;
IF done THEN
LEAVE my_loop;
end if;
If new.open between open_time and close_time or new.close between open_time and close_time or new.close < new.open or open_time between new.open and new.close or close_time between new.open and new.close then
signal sqlstate '22003' set message_text = ‘failed’;
Leave my_loop;
End if;
End loop;
Close time_table;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `operation_agent`
--

DROP TABLE IF EXISTS `operation_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `operation_agent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_agent`
--

LOCK TABLES `operation_agent` WRITE;
/*!40000 ALTER TABLE `operation_agent` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_item` (
  `order_ID` int(11) NOT NULL,
  `item_ID` int(11) NOT NULL,
  `num_of_item` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_ID`,`order_ID`),
  KEY `order_ID` (`order_ID`),
  CONSTRAINT `item_ID` FOREIGN KEY (`item_ID`) REFERENCES `item` (`id`),
  CONSTRAINT `order_ID` FOREIGN KEY (`order_ID`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (19,4,1),(22,4,5),(27,5,1),(20,6,5),(22,6,2),(23,6,2),(26,6,1),(27,6,3),(19,7,2),(20,8,2),(23,8,1),(28,8,1),(25,12,2),(25,13,3),(26,13,2),(28,13,3);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_item_insert` AFTER INSERT ON `order_item` FOR EACH ROW Begin
Declare market, mojud int;
Declare s char(1);
Select status into s from orders where new.order_id = orders.id;
if s != 'r' then
Select market_ID into market from orders where orders.id = new.order_ID;
Call mojudi_kafi(market, new.item_id, new.num_of_item, @mojud);
If @mojud  = 0 then
Update orders set status = 'r'where orders.id = new.order_id;
End if;
End if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_status_log`
--

DROP TABLE IF EXISTS `order_status_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_status_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('s','e','r','c') DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status_log`
--

LOCK TABLES `order_status_log` WRITE;
/*!40000 ALTER TABLE `order_status_log` DISABLE KEYS */;
INSERT INTO `order_status_log` VALUES (1,'s',0),(2,'e',23),(3,'c',23),(4,'r',24),(5,'s',25),(6,'e',25),(7,'s',26),(8,'e',26),(9,'c',26),(10,'c',25),(11,'s',27),(12,'e',27),(13,'c',27),(14,'r',28);
/*!40000 ALTER TABLE `order_status_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(100) DEFAULT NULL,
  `payment_type` enum('b','c') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `status` enum('c','s','r','e') DEFAULT NULL,
  `market_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `customer_order` (`customer_ID`),
  KEY `order_market` (`market_ID`),
  CONSTRAINT `customer_order` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`id`),
  CONSTRAINT `order_market` FOREIGN KEY (`market_ID`) REFERENCES `market` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (19,'here','b','2019-01-20',NULL,'c',1),(20,'here','c','2019-01-20',7,'r',2),(21,'here','c','2019-01-20',7,'c',2),(22,'home','c','2019-01-20',7,'c',2),(23,'k','c','2019-01-20',9,'c',2),(24,'there','b','2019-01-20',NULL,'r',3),(25,'there','b','2019-01-20',NULL,'c',2),(26,'k','c','2019-01-20',9,'c',2),(27,'somewhere','b','2019-01-20',NULL,'c',2),(28,'kerman','c','2019-01-20',8,'r',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_order_insert` BEFORE INSERT ON `orders` FOR EACH ROW Begin 
Declare cnt int default 0;
Select count(*) into cnt from market_working_hour as t
Where new.market_ID = t.market_ID and current_time() between t.open and t.close;
if cnt = 1 then 
Set new.status ='s';
else
Set new.status = 'r';
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_insert` AFTER INSERT ON `orders` FOR EACH ROW Begin
Insert into order_status_log values(id, new.status, new.id);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_order_update` AFTER UPDATE ON `orders` FOR EACH ROW Begin If new.status != old.status then Insert into order_status_log values(id, new.status, new.id); end if; end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `support` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(100) DEFAULT NULL,
  `pn` char(8) DEFAULT NULL,
  `pn_code` char(3) DEFAULT NULL,
  `first_name` varchar(12) DEFAULT NULL,
  `last_name` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tem`
--

DROP TABLE IF EXISTS `tem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tem` (
  `id` int(11) DEFAULT NULL,
  `cost` float DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `i.price * (1 - i.discount) * oi.num_of_item` decimal(26,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tem`
--

LOCK TABLES `tem` WRITE;
/*!40000 ALTER TABLE `tem` DISABLE KEYS */;
INSERT INTO `tem` VALUES (NULL,NULL,NULL,45.0000),(NULL,NULL,7,225.0000),(NULL,NULL,NULL,240.0000),(NULL,NULL,7,750.0000),(NULL,NULL,7,300.0000),(NULL,NULL,9,300.0000),(NULL,NULL,9,150.0000),(NULL,NULL,NULL,450.0000),(NULL,NULL,NULL,36.0000),(NULL,NULL,7,60.0000),(NULL,NULL,9,30.0000),(NULL,NULL,8,30.0000),(NULL,NULL,NULL,128.0000),(NULL,NULL,NULL,120.0000),(NULL,NULL,9,80.0000),(NULL,NULL,8,120.0000);
/*!40000 ALTER TABLE `tem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `temp` (
  `customer_id` int(11) DEFAULT NULL,
  `i.price * (1 - i.discount) * oi.num_of_item` decimal(26,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp`
--

LOCK TABLES `temp` WRITE;
/*!40000 ALTER TABLE `temp` DISABLE KEYS */;
INSERT INTO `temp` VALUES (NULL,45.0000),(7,225.0000),(NULL,240.0000),(7,750.0000),(7,300.0000),(9,300.0000),(9,150.0000),(NULL,450.0000),(NULL,36.0000),(7,60.0000),(9,30.0000),(8,30.0000),(NULL,128.0000),(NULL,120.0000),(9,80.0000),(8,120.0000);
/*!40000 ALTER TABLE `temp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-21  6:53:51
