-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: ESHOP
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `Age`
--

DROP TABLE IF EXISTS `Age`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Age` (
  `Date_Of_Birth` date NOT NULL,
  `Age` int(11) DEFAULT NULL,
  PRIMARY KEY (`Date_Of_Birth`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Age`
--

LOCK TABLES `Age` WRITE;
/*!40000 ALTER TABLE `Age` DISABLE KEYS */;
INSERT INTO `Age` VALUES ('1980-03-09',40),('1984-01-06',36),('1988-09-02',32),('1990-11-13',30),('1992-08-22',28);
/*!40000 ALTER TABLE `Age` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Brand`
--

DROP TABLE IF EXISTS `Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Brand` (
  `Model_Name` varchar(100) NOT NULL,
  `Brand_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Model_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brand`
--

LOCK TABLES `Brand` WRITE;
/*!40000 ALTER TABLE `Brand` DISABLE KEYS */;
INSERT INTO `Brand` VALUES ('ALAK','KALA'),('BRO','BRO1'),('DUB','D'),('GenPro','B4'),('GoStar','B1'),('JOJO','J'),('Live','B2'),('MagicPlus','B3'),('NAN','N'),('NE','YO'),('Vivid','B5');
/*!40000 ALTER TABLE `Brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Camera`
--

DROP TABLE IF EXISTS `Camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Camera` (
  `ProductID` varchar(100) NOT NULL,
  `Sensor_Type` varchar(50) DEFAULT NULL,
  `Megapixels` int(11) DEFAULT NULL,
  `Effective_Pixels` int(11) DEFAULT NULL,
  `Manual_Focus` tinyint(1) DEFAULT NULL,
  `Battery` int(11) DEFAULT NULL,
  `Maximum_Shutter_Speed` int(11) DEFAULT NULL,
  `Minimum_Shutter_Speed` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  CONSTRAINT `Camera_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camera`
--

LOCK TABLES `Camera` WRITE;
/*!40000 ALTER TABLE `Camera` DISABLE KEYS */;
INSERT INTO `Camera` VALUES ('P3','CMOS',50,45,1,3000,30,1),('P6','CMO',45,30,0,5600,50,1);
/*!40000 ALTER TABLE `Camera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery_Provider`
--

DROP TABLE IF EXISTS `Delivery_Provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Delivery_Provider` (
  `CompanyID` varchar(100) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `EmailID` varchar(100) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Door_Number` varchar(10) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zipcode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery_Provider`
--

LOCK TABLES `Delivery_Provider` WRITE;
/*!40000 ALTER TABLE `Delivery_Provider` DISABLE KEYS */;
INSERT INTO `Delivery_Provider` VALUES ('DP1','REDBLUE','rb@sql.com','3478280','22','DPS1','DPC1','SQLCITY','1111'),('DP2','GREENGUY','gg@sql.com','347558280','27','DPS2','DPC2','SQLCITY','1111'),('DP3','TRUEBLACK','tb@sql.com','4489471','77','DPS3','DPC3','SQLCITY','1111');
/*!40000 ALTER TABLE `Delivery_Provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery_Provider_Contract`
--

DROP TABLE IF EXISTS `Delivery_Provider_Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Delivery_Provider_Contract` (
  `CompanyID` varchar(100) NOT NULL,
  `Contract_Length` int(11) DEFAULT NULL,
  `Last_Renewed_On` date DEFAULT NULL,
  `Payment` int(11) DEFAULT NULL,
  `Number_Of_Drivers` int(11) DEFAULT NULL,
  PRIMARY KEY (`CompanyID`),
  CONSTRAINT `Delivery_Provider_Contract_ibfk_1` FOREIGN KEY (`CompanyID`) REFERENCES `Delivery_Provider` (`CompanyID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery_Provider_Contract`
--

LOCK TABLES `Delivery_Provider_Contract` WRITE;
/*!40000 ALTER TABLE `Delivery_Provider_Contract` DISABLE KEYS */;
INSERT INTO `Delivery_Provider_Contract` VALUES ('DP1',10,'2018-01-01',3400,2),('DP2',5,'2018-01-01',3700,2),('DP3',15,'2018-01-01',4700,2);
/*!40000 ALTER TABLE `Delivery_Provider_Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deliveryman`
--

DROP TABLE IF EXISTS `Deliveryman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Deliveryman` (
  `Phone` varchar(50) NOT NULL,
  `First_Name` varchar(100) DEFAULT NULL,
  `Last_Name` varchar(100) DEFAULT NULL,
  `Coordinated_By` int(11) DEFAULT NULL,
  `Works_For` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Phone`),
  KEY `Works_For` (`Works_For`),
  KEY `Coordinated_By` (`Coordinated_By`),
  CONSTRAINT `Deliveryman_ibfk_1` FOREIGN KEY (`Works_For`) REFERENCES `Delivery_Provider` (`CompanyID`),
  CONSTRAINT `Deliveryman_ibfk_2` FOREIGN KEY (`Coordinated_By`) REFERENCES `Department_Office` (`Office_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deliveryman`
--

LOCK TABLES `Deliveryman` WRITE;
/*!40000 ALTER TABLE `Deliveryman` DISABLE KEYS */;
INSERT INTO `Deliveryman` VALUES ('121212','John','Egan',1,'DP2'),('334455','Jack','Grealish',1,'DP1'),('514141','Edouard','Mendy',1,'DP2'),('787005','Phil','Foden',1,'DP3'),('980000','Luke','Shaw',1,'DP3'),('998899','Moussa','Sissoko',1,'DP1');
/*!40000 ALTER TABLE `Deliveryman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department_Office`
--

DROP TABLE IF EXISTS `Department_Office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department_Office` (
  `Office_Number` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Door_Number` varchar(10) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zipcode` varchar(50) DEFAULT NULL,
  `Managed_By` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Office_Number`),
  KEY `Managed_By` (`Managed_By`),
  CONSTRAINT `Department_Office_ibfk_1` FOREIGN KEY (`Managed_By`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department_Office`
--

LOCK TABLES `Department_Office` WRITE;
/*!40000 ALTER TABLE `Department_Office` DISABLE KEYS */;
INSERT INTO `Department_Office` VALUES (1,'DO1','55','DS1','DC1','SQLCITY','1111','A1'),(2,'DO2','52','DS2','DC2','SQLCITY','1111','A2');
/*!40000 ALTER TABLE `Department_Office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `EmployeeID` varchar(100) NOT NULL,
  `First_Name` varchar(100) DEFAULT NULL,
  `Last_Name` varchar(100) DEFAULT NULL,
  `Sex` enum('F','M') NOT NULL,
  `Supervised_By` varchar(100) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `EmailID` varchar(100) DEFAULT NULL,
  `Salary` int(11) DEFAULT NULL,
  `Door_Number` varchar(10) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zipcode` varchar(50) DEFAULT NULL,
  `Works_For_Office` int(11) DEFAULT NULL,
  `Date_Of_Birth` date DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `Works_For_Office` (`Works_For_Office`),
  KEY `Supervised_By` (`Supervised_By`),
  KEY `Date_Of_Birth` (`Date_Of_Birth`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`Works_For_Office`) REFERENCES `Department_Office` (`Office_Number`),
  CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`Supervised_By`) REFERENCES `Employee` (`EmployeeID`),
  CONSTRAINT `Employee_ibfk_3` FOREIGN KEY (`Date_Of_Birth`) REFERENCES `Age` (`Date_Of_Birth`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('A1','FIRST1','LAST1','M',NULL,'17182946','11@sql.com',2200,'10','S1','C1','SQLCITY','1111',1,'1980-03-09'),('A2','FIRST2','LAST2','F',NULL,'864189','22@sql.com',3000,'11','S2','C2','SQLCITY','1111',2,'1992-08-22'),('B1','Mason','Mount','M','A1','293472','mm@sql.com',500,'1','S3','C3','SQLCITY','1111',1,'1984-01-06'),('B2','Erin','Cuthbert','F','A2','29344472','ec@sql.com',600,'1','S4','C4','SQLCITY','1111',2,'1984-01-06'),('B3','Sophie','Ingle','F','A2','56744472','si@sql.com',200,'1','S5','C5','SQLCITY','1111',2,'1990-11-13'),('B4','Eric','Dier','M','A1','234871','ed@sql.com',900,'1','S6','C6','SQLCITY','1111',1,'1988-09-02');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Laptop`
--

DROP TABLE IF EXISTS `Laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Laptop` (
  `ProductID` varchar(100) NOT NULL,
  `Screen_Size` decimal(3,1) DEFAULT NULL,
  `Storage` int(11) DEFAULT NULL,
  `Resolution` varchar(50) DEFAULT NULL,
  `RAM` int(11) DEFAULT NULL,
  `GPU_RAM` int(11) DEFAULT NULL,
  `GPU_Name` varchar(50) DEFAULT NULL,
  `Processor_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `Processor_Name` (`Processor_Name`),
  CONSTRAINT `Laptop_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Laptop_ibfk_2` FOREIGN KEY (`Processor_Name`) REFERENCES `Processor` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Laptop`
--

LOCK TABLES `Laptop` WRITE;
/*!40000 ALTER TABLE `Laptop` DISABLE KEYS */;
INSERT INTO `Laptop` VALUES ('P10',17.0,456,'4K',8,4,'SOME','GOODONE'),('P11',18.0,3455,'4K',8,2,'BLUE','PROC2'),('P4',15.6,1000,'1920X1080',16,4,'Graphics++','GoodProcessor1');
/*!40000 ALTER TABLE `Laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Laptop_Ports`
--

DROP TABLE IF EXISTS `Laptop_Ports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Laptop_Ports` (
  `ProductID` varchar(100) NOT NULL,
  `Port_Type` varchar(50) NOT NULL,
  PRIMARY KEY (`ProductID`,`Port_Type`),
  CONSTRAINT `Laptop_Ports_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Laptop_Ports`
--

LOCK TABLES `Laptop_Ports` WRITE;
/*!40000 ALTER TABLE `Laptop_Ports` DISABLE KEYS */;
INSERT INTO `Laptop_Ports` VALUES ('P10','HDMI'),('P10','USBC'),('P11','HDMI'),('P11','USBA'),('P4','HDMI'),('P4','LAN'),('P4','USB A'),('P5','USB C');
/*!40000 ALTER TABLE `Laptop_Ports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Merchant`
--

DROP TABLE IF EXISTS `Merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Merchant` (
  `MerchantID` varchar(100) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Bank_Account_Number` varchar(50) DEFAULT NULL,
  `EmailID` varchar(100) DEFAULT NULL,
  `Door_Number` varchar(10) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Zipcode` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MerchantID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Merchant`
--

LOCK TABLES `Merchant` WRITE;
/*!40000 ALTER TABLE `Merchant` DISABLE KEYS */;
INSERT INTO `Merchant` VALUES ('M1','LESSGOMART','BANK3456','lgm@sql.com','2','MS1','MC1','SQLCITY','1111','23864'),('M2','QUANTAMMART','BANK8623','qm@sql.com','45','MS2','MC2','SQLCITY','1111','83468'),('M3','BREATHEMART','BANK7972','bm@sql.com','44','MS2','MC2','SQLCITY','1111','91274'),('M4','TRUEPRICE','BANK4949','tp@sql.com','33','MS3','MC3','SQLCITY','1111','48827');
/*!40000 ALTER TABLE `Merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `OrderID` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `ProductID` varchar(100) NOT NULL,
  `Deliveryman_Phone` varchar(50) NOT NULL,
  `MerchantID` varchar(100) NOT NULL,
  PRIMARY KEY (`OrderID`,`Username`,`ProductID`,`Deliveryman_Phone`,`MerchantID`),
  KEY `Username` (`Username`),
  KEY `ProductID` (`ProductID`),
  KEY `Deliveryman_Phone` (`Deliveryman_Phone`),
  KEY `MerchantID` (`MerchantID`),
  CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Registered_Customer` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Order_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Order_ibfk_3` FOREIGN KEY (`Deliveryman_Phone`) REFERENCES `Deliveryman` (`Phone`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Order_ibfk_4` FOREIGN KEY (`MerchantID`) REFERENCES `Merchant` (`MerchantID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,'amigo1','P2','121212','M3'),(1,'amigo5','P2','121212','M3'),(2,'amigo1','P4','334455','M1'),(2,'amigo2','P1','514141','M1'),(1,'amigo3','P4','787005','M3'),(1,'amigo5','P3','787005','M2'),(2,'amigo3','P5','787005','M2'),(1,'amigo4','P1','980000','M1'),(1,'amigo2','P3','998899','M2'),(3,'amigo1','P2','998899','M3');
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Phone`
--

DROP TABLE IF EXISTS `Phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Phone` (
  `ProductID` varchar(100) NOT NULL,
  `Screen_Size` decimal(2,1) DEFAULT NULL,
  `Battery` int(11) DEFAULT NULL,
  `Storage` int(11) DEFAULT NULL,
  `RAM` int(11) DEFAULT NULL,
  `Processor` varchar(50) DEFAULT NULL,
  `Resolution` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  CONSTRAINT `Phone_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phone`
--

LOCK TABLES `Phone` WRITE;
/*!40000 ALTER TABLE `Phone` DISABLE KEYS */;
INSERT INTO `Phone` VALUES ('P2',5.6,3400,128,4,'Nextgen V4','720X1280'),('P9',6.7,4567,567,4,'SOME','1920*1080');
/*!40000 ALTER TABLE `Phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Phone_Cameras`
--

DROP TABLE IF EXISTS `Phone_Cameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Phone_Cameras` (
  `ProductID` varchar(100) NOT NULL,
  `Camera_Pixels` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`,`Camera_Pixels`),
  CONSTRAINT `Phone_Cameras_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phone_Cameras`
--

LOCK TABLES `Phone_Cameras` WRITE;
/*!40000 ALTER TABLE `Phone_Cameras` DISABLE KEYS */;
INSERT INTO `Phone_Cameras` VALUES ('P2',8),('P2',16),('P2',32),('P9',16),('P9',32);
/*!40000 ALTER TABLE `Phone_Cameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Processor`
--

DROP TABLE IF EXISTS `Processor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Processor` (
  `Name` varchar(100) NOT NULL,
  `Cores` int(11) DEFAULT NULL,
  `Clock_Speed` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Processor`
--

LOCK TABLES `Processor` WRITE;
/*!40000 ALTER TABLE `Processor` DISABLE KEYS */;
INSERT INTO `Processor` VALUES ('GOODONE',4,3.40),('GoodProcessor1',4,3.40),('GoodProcessor2',8,3.70),('PROC2',4,3.20);
/*!40000 ALTER TABLE `Processor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `ProductID` varchar(100) NOT NULL,
  `Price` int(11) DEFAULT NULL,
  `Model_Name` varchar(100) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `Model_Name` (`Model_Name`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`Model_Name`) REFERENCES `Brand` (`Model_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('P1',1000,'GoStar',23),('P10',2145,'DUB',45),('P11',2356,'NAN',4),('P2',2000,'Live',3),('P3',3000,'Vivid',90),('P4',4000,'MagicPlus',40),('P5',5000,'GenPro',100),('P6',6000,'NE',4),('P7',12222,'BRO',5),('P8',79754,'ALAK',89),('P9',2355,'JOJO',77);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Colours`
--

DROP TABLE IF EXISTS `Product_Colours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product_Colours` (
  `ProductID` varchar(100) NOT NULL,
  `Colour` varchar(50) NOT NULL,
  PRIMARY KEY (`ProductID`,`Colour`),
  CONSTRAINT `Product_Colours_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Colours`
--

LOCK TABLES `Product_Colours` WRITE;
/*!40000 ALTER TABLE `Product_Colours` DISABLE KEYS */;
INSERT INTO `Product_Colours` VALUES ('P10','GREY'),('P10','WHITE'),('P11','RED'),('P2','Black'),('P2','Green'),('P2','Silver'),('P2','White'),('P4','Black'),('P4','White'),('P9','GREEN'),('P9','RED');
/*!40000 ALTER TABLE `Product_Colours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products_Sold_By`
--

DROP TABLE IF EXISTS `Products_Sold_By`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products_Sold_By` (
  `ProductID` varchar(100) NOT NULL,
  `MerchantID` varchar(100) NOT NULL,
  PRIMARY KEY (`ProductID`,`MerchantID`),
  KEY `MerchantID` (`MerchantID`),
  CONSTRAINT `Products_Sold_By_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Products_Sold_By_ibfk_2` FOREIGN KEY (`MerchantID`) REFERENCES `Merchant` (`MerchantID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products_Sold_By`
--

LOCK TABLES `Products_Sold_By` WRITE;
/*!40000 ALTER TABLE `Products_Sold_By` DISABLE KEYS */;
INSERT INTO `Products_Sold_By` VALUES ('P1','M1'),('P10','M1'),('P11','M1'),('P4','M1'),('P8','M1'),('P10','M2'),('P11','M2'),('P3','M2'),('P5','M2'),('P2','M3'),('P4','M3'),('P5','M3'),('P8','M3'),('P10','M4'),('P6','M4'),('P7','M4'),('P9','M4');
/*!40000 ALTER TABLE `Products_Sold_By` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchase_History`
--

DROP TABLE IF EXISTS `Purchase_History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Purchase_History` (
  `Username` varchar(100) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `Amount_Paid` decimal(9,2) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`Username`,`OrderID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `Purchase_History_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Registered_Customer` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Purchase_History_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchase_History`
--

LOCK TABLES `Purchase_History` WRITE;
/*!40000 ALTER TABLE `Purchase_History` DISABLE KEYS */;
INSERT INTO `Purchase_History` VALUES ('amigo1',1,2000.00,'2015-08-08'),('amigo1',2,4000.00,'2011-08-09'),('amigo1',3,2000.00,'2019-01-01'),('amigo2',1,3000.00,'2019-01-01'),('amigo2',2,1000.00,'2018-01-09'),('amigo3',1,4000.00,'2017-08-02'),('amigo3',2,5000.00,'2014-02-04'),('amigo4',1,1000.00,'2019-02-01'),('amigo5',1,5000.00,'2018-02-02');
/*!40000 ALTER TABLE `Purchase_History` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchase_History_Products`
--

DROP TABLE IF EXISTS `Purchase_History_Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Purchase_History_Products` (
  `Username` varchar(100) NOT NULL,
  `ProductID` varchar(100) NOT NULL,
  `OrderID` int(11) NOT NULL,
  PRIMARY KEY (`Username`,`ProductID`,`OrderID`),
  KEY `ProductID` (`ProductID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `Purchase_History_Products_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Registered_Customer` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Purchase_History_Products_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Purchase_History_Products_ibfk_3` FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchase_History_Products`
--

LOCK TABLES `Purchase_History_Products` WRITE;
/*!40000 ALTER TABLE `Purchase_History_Products` DISABLE KEYS */;
INSERT INTO `Purchase_History_Products` VALUES ('amigo1','P2',1),('amigo2','P3',1),('amigo3','P4',1),('amigo4','P1',1),('amigo5','P2',1),('amigo5','P3',1),('amigo1','P4',2),('amigo2','P1',2),('amigo3','P5',2);
/*!40000 ALTER TABLE `Purchase_History_Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registered_Customer`
--

DROP TABLE IF EXISTS `Registered_Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Registered_Customer` (
  `Username` varchar(100) NOT NULL,
  `EmailID` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(50) DEFAULT NULL,
  `First_Name` varchar(100) DEFAULT NULL,
  `Last_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registered_Customer`
--

LOCK TABLES `Registered_Customer` WRITE;
/*!40000 ALTER TABLE `Registered_Customer` DISABLE KEYS */;
INSERT INTO `Registered_Customer` VALUES ('amigo1','a1@sql.com','898989','Amigo','One'),('amigo2','a2@sql.com','189724','Amigo','Two'),('amigo3','a3@sql.com','283568','Amigo','Three'),('amigo4','a4@sql.com','827461','Amigo','Four'),('amigo5','a5@sql.com','914373','Amigo','Five');
/*!40000 ALTER TABLE `Registered_Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registered_Customer_Shipping_Address`
--

DROP TABLE IF EXISTS `Registered_Customer_Shipping_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Registered_Customer_Shipping_Address` (
  `Username` varchar(100) NOT NULL,
  `Door_Number` varchar(10) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Zipcode` varchar(50) NOT NULL,
  PRIMARY KEY (`Username`,`Door_Number`,`Street`,`City`,`State`,`Zipcode`),
  CONSTRAINT `Registered_Customer_Shipping_Address_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Registered_Customer` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registered_Customer_Shipping_Address`
--

LOCK TABLES `Registered_Customer_Shipping_Address` WRITE;
/*!40000 ALTER TABLE `Registered_Customer_Shipping_Address` DISABLE KEYS */;
INSERT INTO `Registered_Customer_Shipping_Address` VALUES ('amigo1','21','US1','UC1','SQLCITY2','1111'),('amigo2','33','US1','UC1','SQLCITY','1111'),('amigo3','9','US2','UC2','SQLCITY3','1111'),('amigo4','39','US3','UC3','SQLCITY','1111'),('amigo5','98','US4','UC4','SQLCITY','1111');
/*!40000 ALTER TABLE `Registered_Customer_Shipping_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Smartwatch`
--

DROP TABLE IF EXISTS `Smartwatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Smartwatch` (
  `ProductID` varchar(100) NOT NULL,
  `Screen_Size` decimal(3,2) DEFAULT NULL,
  `Dust_Resistant` tinyint(1) DEFAULT NULL,
  `Water_Resistant` tinyint(1) DEFAULT NULL,
  `Resolution` varchar(50) DEFAULT NULL,
  `Strap_Colour` varchar(50) DEFAULT NULL,
  `Body_Colour` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  CONSTRAINT `Smartwatch_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Smartwatch`
--

LOCK TABLES `Smartwatch` WRITE;
/*!40000 ALTER TABLE `Smartwatch` DISABLE KEYS */;
INSERT INTO `Smartwatch` VALUES ('P1',1.54,1,1,'400X400','Blue','White'),('P8',5.60,1,0,'400X400','GREEN','YELLOW');
/*!40000 ALTER TABLE `Smartwatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TV`
--

DROP TABLE IF EXISTS `TV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TV` (
  `ProductID` varchar(100) NOT NULL,
  `Screen_Size` int(11) DEFAULT NULL,
  `SmartTV` tinyint(1) DEFAULT NULL,
  `Resolution` varchar(50) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  CONSTRAINT `TV_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TV`
--

LOCK TABLES `TV` WRITE;
/*!40000 ALTER TABLE `TV` DISABLE KEYS */;
INSERT INTO `TV` VALUES ('P5',65,1,'4K',80),('P7',72,1,'4K',100);
/*!40000 ALTER TABLE `TV` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-06 22:03:41
