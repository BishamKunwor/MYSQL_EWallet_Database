-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: digital_wallet
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `accountID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double DEFAULT 0,
  `money_limit` double DEFAULT NULL,
  `account_type` varchar(255) NOT NULL,
  `billing_history` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`accountID`),
  UNIQUE KEY `billing_history` (`billing_history`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,80000,10000000,'Verified','p001, pk024'),(2,160000,10000000,'Verified','p051'),(3,320000,10000000,'Verified','ps141, ps5412, pka44'),(4,680000,10000000,'Verified','a041, as522'),(5,80000,10000000,'non-authenticated','d295s, bs596'),(6,9000,10000000,'non-authenticated',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountservicesdetails`
--

DROP TABLE IF EXISTS `accountservicesdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountservicesdetails` (
  `accountserviceID` int(11) NOT NULL AUTO_INCREMENT,
  `serviceID` int(11) DEFAULT NULL,
  `accountID` int(11) DEFAULT NULL,
  PRIMARY KEY (`accountserviceID`),
  KEY `serviceID` (`serviceID`),
  KEY `accountID` (`accountID`),
  CONSTRAINT `accountservicesdetails_ibfk_1` FOREIGN KEY (`serviceID`) REFERENCES `services` (`serviceID`),
  CONSTRAINT `accountservicesdetails_ibfk_2` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountservicesdetails`
--

LOCK TABLES `accountservicesdetails` WRITE;
/*!40000 ALTER TABLE `accountservicesdetails` DISABLE KEYS */;
INSERT INTO `accountservicesdetails` VALUES (1,11,1),(2,10,2),(3,6,3),(4,9,4),(5,4,5);
/*!40000 ALTER TABLE `accountservicesdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `serviceID` int(11) NOT NULL AUTO_INCREMENT,
  `service_type` varchar(255) NOT NULL,
  `offers` varchar(255) DEFAULT 'No Offers',
  PRIMARY KEY (`serviceID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Top Up','5% cashback'),(2,'Antivirus','10% cashback'),(3,'Movies','2% cashback'),(4,'Food and Hospitality','15% cashback'),(5,'Electricity Bill','No Offers'),(6,'Internet Bill','No Offers'),(7,'Khanepani Bill','No Offers'),(8,'Online Shopping','No Offers'),(9,'Scan and Pay','No Offers'),(10,'Stock Payment','No Offers'),(11,'Insurance Payment','No Offers');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `transactionID` int(11) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `accountID` int(11) DEFAULT NULL,
  `date_time` date DEFAULT NULL,
  `transaction_charge` double DEFAULT 0,
  PRIMARY KEY (`transactionID`),
  KEY `accountID` (`accountID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,5000,4,'2021-04-22',0),(2,5000,1,'2021-04-22',0),(3,10000,1,'2021-04-22',100),(4,50000,2,'2021-04-21',100),(5,10000,3,'2021-04-21',100),(6,65000,3,'2021-04-22',100),(7,25000,3,'2021-04-23',100),(8,15000,4,'2021-04-21',100),(9,35000,5,'2021-04-22',100),(10,40000,5,'2021-04-23',100);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT 'Kathmandu',
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Ramesh Kunwor','9854125412','Maitidevi','rameshkunwor@gmail.com'),(2,'Rajesh Kunwor','9854125566','New Baneshwor','rajeshkumarkunwor@gmail.com'),(3,'Vansh Gupta','9854196512','Gaaur','guptavansh@gmail.com'),(4,'Parash Niraula','9856125417','Basundhara','niraula212@gmail.com'),(5,'Jeevan Bhatta','98541259418','Pepsicola','kapadi@gmail.com'),(6,'Dheeraz Shah','9854457414','Tinkune','sahdzre@gmail.com'),(7,'Bishal Shah','9854267412','Sinamangal','bishal82@gmail.com'),(8,'Bishal Dhungana','9855795415','New Baneshwor','dhungana131@gmail.com'),(9,'Bibek Thapa','9854125578','Kamalpokhari','thapabibek@gmail.com'),(10,'Gaurav Gandhi','9854124573','New Road','gandhibhai@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccountdetails`
--

DROP TABLE IF EXISTS `useraccountdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccountdetails` (
  `useraccountID` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `accountID` int(11) DEFAULT NULL,
  PRIMARY KEY (`useraccountID`),
  KEY `uid` (`uid`),
  KEY `accountID` (`accountID`),
  CONSTRAINT `useraccountdetails_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `useraccountdetails_ibfk_2` FOREIGN KEY (`accountID`) REFERENCES `account` (`accountID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccountdetails`
--

LOCK TABLES `useraccountdetails` WRITE;
/*!40000 ALTER TABLE `useraccountdetails` DISABLE KEYS */;
INSERT INTO `useraccountdetails` VALUES (1,1,4),(2,2,4),(3,3,6),(4,4,3),(5,5,3),(6,6,1),(7,7,2),(8,8,2),(9,9,5),(10,10,5);
/*!40000 ALTER TABLE `useraccountdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-22 18:17:28
