-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: final_project_adbms
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `Address_ID` int(11) NOT NULL,
  `Address_Line1` varchar(200) NOT NULL,
  `Address_Line2` varchar(200) DEFAULT NULL,
  `City` varchar(50) NOT NULL,
  `State_ID` int(11) NOT NULL,
  `ZipCode` varchar(50) NOT NULL,
  PRIMARY KEY (`Address_ID`),
  KEY `FK_Address_StateID_idx` (`State_ID`),
  CONSTRAINT `FK_Address_StateID` FOREIGN KEY (`State_ID`) REFERENCES `state` (`State_ID`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'A','B','Mumbai',1,'400101'),(2,'C','D','Macau',2,'123456'),(3,'E','F','Boston',3,'2120'),(4,'G','F','Boston',3,'2120'),(5,'X','Y','Mumbai',1,'400101'),(6,'P','O','Pune',1,'40011'),(7,'M','Q','Bos',3,'40011'),(8,'M','Q','Bos',3,'40011');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditlog` (
  `Log_ID` int(11) NOT NULL,
  `Order_Detail` int(11) NOT NULL,
  `LogInfo` varchar(255) NOT NULL,
  `Create_Date` datetime NOT NULL,
  PRIMARY KEY (`Log_ID`),
  KEY `FK_AuditLog_OrderDetail_idx` (`Order_Detail`),
  CONSTRAINT `FK_AuditLog_OrderDetail` FOREIGN KEY (`Order_Detail`) REFERENCES `order_detail` (`Order_DetailID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
INSERT INTO `auditlog` VALUES (1,1,'All payments received','2014-10-28 11:28:26'),(2,2,'Payments yet to receive','2014-08-27 11:28:26');
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `Country_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Country_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'India'),(2,'China'),(3,'USA'),(4,'Brazil');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `First_Name` varchar(80) NOT NULL,
  `Last_Name` varchar(80) NOT NULL,
  `Home_PhoneNumber` varchar(20) NOT NULL,
  `Work_PhoneNumber` varchar(20) DEFAULT NULL,
  `Cell_PhoneNumber` varchar(20) DEFAULT NULL,
  `Other_PhoneNumber` varchar(20) DEFAULT NULL,
  `EMail_ID` varchar(50) DEFAULT NULL,
  `Address_ID` int(11) NOT NULL,
  `Create_Date` datetime NOT NULL,
  `Create_UserID` int(11) NOT NULL,
  `Modify_UserID` int(11) DEFAULT NULL,
  `Modify_Date` datetime DEFAULT NULL,
  `Active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Customer_ID`),
  KEY `FK_Customer_AddressID_idx` (`Address_ID`),
  KEY `FK_Customer_CreateUserID_idx` (`Create_UserID`),
  KEY `FK_Customer_ModifyUserID_idx` (`Modify_UserID`),
  CONSTRAINT `FK_Customer_AddressID` FOREIGN KEY (`Address_ID`) REFERENCES `address` (`Address_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Nikita','Khamkar','6178607204',NULL,NULL,NULL,'khamkar.n@husky.neu.edu',1,'2016-04-19 10:25:36',1,NULL,NULL,''),(2,'Anupama','Rachuri','6572026433',NULL,NULL,NULL,'anupama.rachuri@gmail.com',2,'2015-01-01 10:25:36',2,NULL,NULL,''),(3,'Utsav','Khandelwal','98765432',NULL,NULL,NULL,'utsavk@gmail.com',3,'2015-01-01 10:25:36',3,NULL,NULL,''),(4,'Sonal','Khamkar','6186257889',NULL,NULL,NULL,'kham.so@husky.neu.edu',8,'2016-04-25 00:00:00',6,NULL,NULL,'');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `customer_order_summary`
--

DROP TABLE IF EXISTS `customer_order_summary`;
/*!50001 DROP VIEW IF EXISTS `customer_order_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_order_summary` (
  `first_name` tinyint NOT NULL,
  `last_name` tinyint NOT NULL,
  `home_phonenumber` tinyint NOT NULL,
  `email_id` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `Product_ID` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `quantity` tinyint NOT NULL,
  `Unit_Price` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer_product`
--

DROP TABLE IF EXISTS `customer_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_product` (
  `customer_ProductID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Serial_Number` varchar(30) NOT NULL,
  `Purchase_Date` datetime NOT NULL,
  PRIMARY KEY (`customer_ProductID`),
  KEY `FK_CustomerProduct_ProductID_idx` (`Product_ID`),
  KEY `FK_CustomerProduct_CustomerID_idx` (`Customer_ID`),
  CONSTRAINT `FK_CustomerProduct_CustomerID` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CustomerProduct_ProductID` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_product`
--

LOCK TABLES `customer_product` WRITE;
/*!40000 ALTER TABLE `customer_product` DISABLE KEYS */;
INSERT INTO `customer_product` VALUES (1,1,1,'2580','2015-01-29 10:25:36'),(2,2,2,'9630','2014-10-29 10:25:36'),(3,3,3,'7410','2015-01-01 10:25:36');
/*!40000 ALTER TABLE `customer_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `Invoice_ID` int(11) NOT NULL,
  `Amount` decimal(10,0) DEFAULT '0',
  `Order_ID` int(11) NOT NULL,
  PRIMARY KEY (`Invoice_ID`),
  KEY `FK_Invoice_OrderID_idx` (`Order_ID`),
  CONSTRAINT `FK_Invoice_OrderID` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,1013,1),(2,1026,2);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_detail`
--

DROP TABLE IF EXISTS `invoice_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_detail` (
  `Invoice_DetailID` int(11) NOT NULL,
  `Amount` decimal(10,0) DEFAULT '0',
  `Order_DetailID` int(11) NOT NULL,
  PRIMARY KEY (`Invoice_DetailID`),
  KEY `FK_InvoiceDetail_OrderDetailID_idx` (`Order_DetailID`),
  CONSTRAINT `FK_InvoiceDetail_OrderDetailID` FOREIGN KEY (`Order_DetailID`) REFERENCES `order_detail` (`Order_DetailID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_detail`
--

LOCK TABLES `invoice_detail` WRITE;
/*!40000 ALTER TABLE `invoice_detail` DISABLE KEYS */;
INSERT INTO `invoice_detail` VALUES (1,1013,2);
/*!40000 ALTER TABLE `invoice_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `Manufacturer_ID` int(11) NOT NULL,
  `Code` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Manufacturer_ID`),
  UNIQUE KEY `Code_UNIQUE` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'abcdef','Johnson'),(2,'bcdefg','Michael'),(3,'cdefgh','Sparks');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `Order_DetailID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Customer_ProductID` int(11) NOT NULL,
  `Status_ID` int(11) NOT NULL,
  `Unit_Price` decimal(10,0) DEFAULT '0',
  `Total_Price` decimal(10,0) DEFAULT '0',
  `Quantity` int(11) DEFAULT NULL,
  `Taxable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Order_DetailID`),
  KEY `FK_OrderDetail_OrderID_idx` (`Order_ID`),
  KEY `FK_OrderDetail_CustomerProductID_idx` (`Customer_ProductID`),
  KEY `FK_OrderDetail_Status_idx` (`Status_ID`),
  KEY `FK_OrderDetail_Product_ID_idx` (`Product_ID`),
  CONSTRAINT `FK_OrderDetail_CustomerProductID` FOREIGN KEY (`Customer_ProductID`) REFERENCES `customer_product` (`customer_ProductID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderDetail_OrderID` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderDetail_Product_ID_idx` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderDetail_Status` FOREIGN KEY (`Status_ID`) REFERENCES `status` (`Status_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,2,1,1,200,1000,5,1),(2,1,1,1,2,200,1000,5,0),(3,1,3,1,5,200,1000,5,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger update_quantity
after insert on order_detail
for each row
begin
update product_inventory a
inner join product_bin b  on a.bin_id=b.bin_id
set a.Available_Count = a.Available_Count - NEW.quantity
where b.Product_ID = NEW.Customer_ProductID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_addquantity AFTER DELETE ON order_detail FOR EACH ROW 
BEGIN
     
	  UPDATE product_inventory a
      inner join product_bin b  on a.bin_id=b.bin_id
	 set a.Available_Count = a.Available_Count+ old.quantity
where b.Product_ID = old.Customer_ProductID;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_return`
--

DROP TABLE IF EXISTS `order_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_return` (
  `Order_ReturnID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Reason_Return` varchar(20) NOT NULL,
  `Return_Date` datetime NOT NULL,
  `Status_ID` int(11) NOT NULL,
  PRIMARY KEY (`Order_ReturnID`),
  KEY `FK_OrderReturn_OrderID_idx` (`Order_ID`),
  KEY `FK_OrderReturn_StatusID_idx` (`Status_ID`),
  CONSTRAINT `FK_OrderReturn_OrderID` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderReturn_StatusID` FOREIGN KEY (`Status_ID`) REFERENCES `status` (`Status_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_return`
--

LOCK TABLES `order_return` WRITE;
/*!40000 ALTER TABLE `order_return` DISABLE KEYS */;
INSERT INTO `order_return` VALUES (1,1,'Defective','2014-10-29 20:28:36',5),(2,2,'Ineffective','2014-12-10 22:36:36',5);
/*!40000 ALTER TABLE `order_return` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Order_return_backup after DELETE ON order_return FOR EACH ROW BEGIN

 INSERT IGNORE INTO Product_backup (
  Order_ReturnID,
  Order_ID,
  Reason_Return, 
  Return_Date,
  Status_ID 
 ) VALUES (
   OLD.order_returnId,Order_id,reason_return,return_date,status_id
 );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_return_backup`
--

DROP TABLE IF EXISTS `order_return_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_return_backup` (
  `Order_ReturnID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Reason_Return` varchar(20) NOT NULL,
  `Return_Date` datetime NOT NULL,
  `Status_ID` int(11) NOT NULL,
  PRIMARY KEY (`Order_ReturnID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_return_backup`
--

LOCK TABLES `order_return_backup` WRITE;
/*!40000 ALTER TABLE `order_return_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_return_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_shipment`
--

DROP TABLE IF EXISTS `order_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_shipment` (
  `Shipment_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  KEY `FK_OrderShipment_ShipmentID_idx` (`Shipment_ID`),
  KEY `FK_OrderShipment_OrderID_idx` (`Order_ID`),
  CONSTRAINT `FK_OrderShipment_OrderID` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderShipment_ShipmentID` FOREIGN KEY (`Shipment_ID`) REFERENCES `shipment` (`Shipment_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_shipment`
--

LOCK TABLES `order_shipment` WRITE;
/*!40000 ALTER TABLE `order_shipment` DISABLE KEYS */;
INSERT INTO `order_shipment` VALUES (1,1),(1,1),(2,2),(2,2);
/*!40000 ALTER TABLE `order_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL,
  `Customer_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Status_ID` int(11) NOT NULL,
  `Total_Price` decimal(10,0) DEFAULT '0',
  `CreateDate` datetime NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `FK_Order_CustomerID_idx` (`Customer_ID`),
  KEY `FK_Order_StatusID_idx` (`Status_ID`),
  KEY `FK_Orders_Product_ID_idx` (`Product_ID`),
  CONSTRAINT `FK_Order_CustomerID` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Order_StatusID` FOREIGN KEY (`Status_ID`) REFERENCES `status` (`Status_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Orders_Product_ID_idx` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,2,1,1000,'2014-01-01 10:25:36'),(2,2,1,2,2000,'2015-01-01 10:25:36'),(3,3,3,3,1000,'2014-01-01 10:25:36'),(4,1,2,2,1000,'2012-01-29 00:00:00'),(5,2,1,4,2500,'2013-01-29 00:00:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `price`
--

DROP TABLE IF EXISTS `price`;
/*!50001 DROP VIEW IF EXISTS `price`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `price` (
  `product_id` tinyint NOT NULL,
  `Description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Description` varchar(50) NOT NULL,
  `Model_Number` varchar(50) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Manufacturer_ID` int(11) NOT NULL,
  `Create_Date` datetime NOT NULL,
  PRIMARY KEY (`Product_ID`),
  KEY `FK_Product_ManufacturerID_idx` (`Manufacturer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Mobile','S4',1200,1,'2014-12-29 00:25:36'),(2,'Tablet','G5',1500,2,'2012-12-24 10:25:36'),(3,'Laptop','W4560',2000,3,'2015-01-01 10:25:36'),(4,'Tablet','Air4',600,4,'2016-04-22 00:00:00'),(5,'Desktop','Dell Inspiron',500,5,'2016-04-25 00:00:00');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_bin`
--

DROP TABLE IF EXISTS `product_bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_bin` (
  `Bin_ID` int(11) NOT NULL,
  `Bin_Name` varchar(20) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  PRIMARY KEY (`Bin_ID`),
  KEY `FK_ProductBin_ProductID_idx` (`Product_ID`),
  CONSTRAINT `FK_ProductBin_ProductID` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_bin`
--

LOCK TABLES `product_bin` WRITE;
/*!40000 ALTER TABLE `product_bin` DISABLE KEYS */;
INSERT INTO `product_bin` VALUES (1,'Bin 1',1),(2,'Bin 2',3),(3,'Bin 1',2);
/*!40000 ALTER TABLE `product_bin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventory`
--

DROP TABLE IF EXISTS `product_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_inventory` (
  `Inventory_ID` int(11) NOT NULL,
  `Bin_ID` int(11) NOT NULL,
  `Available_Count` int(11) DEFAULT NULL,
  `Reserved_Count` int(11) DEFAULT NULL,
  `Used_Count` int(11) DEFAULT NULL,
  PRIMARY KEY (`Inventory_ID`),
  KEY `FK_ProductInventory_BinID_idx` (`Bin_ID`),
  CONSTRAINT `FK_ProductInventory_BinID` FOREIGN KEY (`Bin_ID`) REFERENCES `product_bin` (`Bin_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory`
--

LOCK TABLES `product_inventory` WRITE;
/*!40000 ALTER TABLE `product_inventory` DISABLE KEYS */;
INSERT INTO `product_inventory` VALUES (1,1,20,5,10),(2,1,30,10,20),(3,2,25,10,15);
/*!40000 ALTER TABLE `product_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment`
--

DROP TABLE IF EXISTS `shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment` (
  `Shipment_ID` int(11) NOT NULL,
  `Shipment_Number` varchar(20) NOT NULL,
  `Tracking_Number` varchar(40) DEFAULT NULL,
  `Address_Line1` varchar(200) NOT NULL,
  `Address_Line2` varchar(200) DEFAULT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `ZipCode` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Status_ID` int(11) NOT NULL,
  PRIMARY KEY (`Shipment_ID`),
  KEY `FK_Shipment_StatusID_idx` (`Status_ID`),
  CONSTRAINT `FK_Shipment_StatusID` FOREIGN KEY (`Status_ID`) REFERENCES `status` (`Status_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment`
--

LOCK TABLES `shipment` WRITE;
/*!40000 ALTER TABLE `shipment` DISABLE KEYS */;
INSERT INTO `shipment` VALUES (1,'BE123','XYZ987','BE','MS','Mumbai','Maharashtra','400101','India',1),(2,'AB896','DT678','AB','CD','Boston','Massachussets','2120','USA',5);
/*!40000 ALTER TABLE `shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `State_ID` int(11) NOT NULL,
  `State_Name` varchar(50) NOT NULL,
  `Country_ID` int(11) NOT NULL,
  PRIMARY KEY (`State_ID`),
  KEY `FK_State_CountryID_idx` (`Country_ID`),
  CONSTRAINT `FK_State_CountryID` FOREIGN KEY (`Country_ID`) REFERENCES `country` (`Country_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Maharashtra',1),(2,'Beijing',2),(3,'Massachussets',3),(4,'Brasilia',4);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `Status_ID` int(11) NOT NULL,
  `Status_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Status_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Placed'),(2,'Processing'),(3,'Shipped'),(4,'Delivered'),(5,'Returned');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `Supplier_ID` int(11) NOT NULL,
  `Supplier_Name` varchar(50) NOT NULL,
  `Supplier_Address` int(11) NOT NULL,
  PRIMARY KEY (`Supplier_ID`),
  KEY `FK_Supplier_Address_idx` (`Supplier_Address`),
  CONSTRAINT `FK_Supplier_Address` FOREIGN KEY (`Supplier_Address`) REFERENCES `address` (`Address_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'UPC',4),(2,'LAJJA',5);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `Login_Name` varchar(20) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'abc','abc'),(2,'xyz','xyz'),(3,'uvw','uvw'),(4,'upc','upc'),(5,'Lajja','Lajja');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `Role_id` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `User_Role` varchar(50) NOT NULL,
  PRIMARY KEY (`Role_id`),
  KEY `FK_User_id_idx` (`User_ID`),
  CONSTRAINT `FK_User_id` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,2,'SysAdmin'),(2,1,'Customer'),(3,4,'Procurement MAnager'),(4,5,'Customer'),(5,3,'Finance Manager');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'final_project_adbms'
--

--
-- Dumping routines for database 'final_project_adbms'
--
/*!50003 DROP PROCEDURE IF EXISTS `p_insert_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_insert_customer`(
	IN Customer_Id int,
    IN Address_Id int,
    IN First_Name varchar(80),
    IN Last_Name varchar(80),
    IN Home_Phone_Number varchar(20),
    IN Work_Phone_Number varchar(20),
    IN Cell_Phone_Number varchar(20),
    IN Other_Phone_Number varchar(20),
    IN EMail_Id varchar(50),
    IN Address_Line_1 varchar(200),
    IN Address_Line_2 varchar(200),
    IN City varchar(50),
    IN State int(11),
    IN ZipCode varchar(50),
    IN UserId int(20)
    )
BEGIN
DECLARE CAL_STATE_ID INT;
DECLARE CAL_COUNTRY_ID INT;
DECLARE CAL_ADDRESS_ID INT;
DECLARE CAL_USER_ID INT;

SELECT CAL_STATE_ID = STATE_ID, CAL_COUNTRY_ID = COUNTRY_ID 
FROM STATE WHERE STATE_NAME = STATE;

SELECT USERID = CAL_USER_ID FROM USER WHERE User_Id = UserId;

START TRANSACTION;
	INSERT INTO 
	address (Address_ID, Address_Line1,Address_Line2,City,State_ID,ZipCode)
	VALUES (Address_ID, ADDRESS_LINE_1, ADDRESS_LINE_2, CITY, STATE, ZipCode);
	
	
	
	INSERT INTO customer (Customer_ID, First_Name,Last_Name,Home_PhoneNumber, Work_PhoneNumber,
	Cell_PhoneNumber,Other_PhoneNumber, EMail_ID, Create_Date, Create_UserID, Address_ID)
	VALUES (Customer_Id, First_Name,Last_Name,Home_Phone_Number,Work_Phone_Number, 
	Cell_Phone_Number, Other_Phone_Number,EMail_Id,current_date(),userId,Address_id);
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_Insert_Product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_Insert_Product`(
	IN Product_Id int(11),
    IN Description varchar(50),
    IN Model_Number varchar(50),
    IN Price decimal(10,0),
    IN Manufacturer_ID int(11)
    )
BEGIN
Start Transaction;
	INSERT INTO 
	product (Product_id,description,model_number,price,manufacturer_id,create_date)
	VALUES (Product_id,description,model_number,price,manufacturer_id,current_date());
    Commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customer_order_summary`
--

/*!50001 DROP TABLE IF EXISTS `customer_order_summary`*/;
/*!50001 DROP VIEW IF EXISTS `customer_order_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_order_summary` AS select `c`.`First_Name` AS `first_name`,`c`.`Last_Name` AS `last_name`,`c`.`Home_PhoneNumber` AS `home_phonenumber`,`c`.`EMail_ID` AS `email_id`,`a`.`City` AS `city`,`od`.`Product_ID` AS `Product_ID`,`p`.`Description` AS `description`,`od`.`Quantity` AS `quantity`,`od`.`Unit_Price` AS `Unit_Price` from ((((`customer` `c` join `address` `a`) join `order_detail` `od`) join `product` `p`) join `orders` `o`) where ((`c`.`Address_ID` = `a`.`Address_ID`) and (`o`.`Order_ID` = `od`.`Order_ID`) and (`p`.`Product_ID` = `od`.`Product_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `price`
--

/*!50001 DROP TABLE IF EXISTS `price`*/;
/*!50001 DROP VIEW IF EXISTS `price`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `price` AS select `product`.`Product_ID` AS `product_id`,`product`.`Description` AS `Description` from `product` where (`product`.`Price` > (select avg(`product`.`Price`) from `product`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-25 20:17:30
