-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.12


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema paperstock
--

CREATE DATABASE IF NOT EXISTS paperstock;
USE paperstock;

--
-- Definition of table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mill_id` int(10) unsigned NOT NULL,
  `opening_stock` double NOT NULL,
  `purchase` double DEFAULT NULL,
  `used` double DEFAULT NULL,
  `closing_stock` double NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `financial_year` varchar(15) NOT NULL,
  `remarks` varchar(75) NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `FK_activity_1` (`mill_id`),
  CONSTRAINT `FK_activity_1` FOREIGN KEY (`mill_id`) REFERENCES `milldetails` (`sno`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity`
--

/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` (`sno`,`mill_id`,`opening_stock`,`purchase`,`used`,`closing_stock`,`createdon`,`financial_year`,`remarks`) VALUES 
 (24,1,0,50,NULL,50,'2016-12-17 20:37:39','2016-2017','testing'),
 (25,1,50,NULL,30,20,'2016-12-17 23:13:17','2016-2017','testing'),
 (26,1,20,NULL,20,0,'2016-12-18 08:39:21','2016-2017','testing'),
 (27,3,0,167,NULL,167,'2016-12-18 16:50:49','2016-2017','Testing'),
 (28,4,0,89,NULL,89,'2016-12-18 23:19:37','2016-2017','testing'),
 (29,4,89,10,NULL,99,'2016-12-18 23:21:57','2016-2017',''),
 (30,17,0,110,NULL,110,'2016-12-18 23:32:55','2016-2017','testing');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;


--
-- Definition of table `auth`
--

DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(45) NOT NULL,
  `pass` varchar(25) NOT NULL,
  `rights` tinyint(1) NOT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `financialYear` varchar(15) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth`
--

/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` (`sno`,`uname`,`pass`,`rights`,`createdon`,`financialYear`) VALUES 
 (1,'admin','admin123',1,'2016-12-09 08:25:57','2016-2017');
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;


--
-- Definition of table `milldetails`
--

DROP TABLE IF EXISTS `milldetails`;
CREATE TABLE `milldetails` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `millname` varchar(55) NOT NULL,
  `gsm` varchar(45) NOT NULL,
  `grade` varchar(45) NOT NULL,
  `size` varchar(15) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `mailid` varchar(45) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `createdon` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `milldetails`
--

/*!40000 ALTER TABLE `milldetails` DISABLE KEYS */;
INSERT INTO `milldetails` (`sno`,`millname`,`gsm`,`grade`,`size`,`address`,`mailid`,`phone`,`remarks`,`createdon`) VALUES 
 (1,'CARBONLESS','50','CFB WT','9-inch','Chennai','maniarasan08@gmail.com','78','Testing','2016-12-17 17:38:26'),
 (2,'CARBONLESS','50','CFB PINK','9-inch','Chennai','','9176107053','nocomments','2016-12-17 11:18:57'),
 (3,'TNPL','50','CREAMWOVE','34-inch','chennai',NULL,NULL,'no comments','2016-12-08 23:27:51'),
 (4,'SPB','57','MAPLITHO','32.5-inch','chennai',NULL,NULL,'no comments','2016-12-08 23:27:51'),
 (10,'CARBONLESS','50','CFB WT','10-inch','Chennai-45','maniarasan08@gmail.com','9176107053','dummy record','2016-12-15 07:17:46'),
 (11,'CARBONLESS','50','CFB WT','12-inch','','maniarasan08@gmail.com','9176107053','','2016-12-17 17:39:15'),
 (12,'CARBONLESS','50','CFB WT','12-inch','','','9176107053','','2016-12-17 16:11:31'),
 (13,'CARBONLESS','50','CFB WT','19-inch','','','9176107053','','2016-12-17 16:14:26'),
 (14,'CARBONLESS','50','CFB WT','19-inch','','','9176107053','','2016-12-17 16:15:18'),
 (15,'CARBONLESS','50','CFB WT','19-inch','','','9176107053','','2016-12-17 16:15:38'),
 (16,'CARBONLESS','50','CFB WT','19-inch','','','9176107053','','2016-12-17 16:16:26'),
 (17,'CARBONLESS','51','CFB WT','9-inch','','','9176107053','','2016-12-18 11:58:38');
/*!40000 ALTER TABLE `milldetails` ENABLE KEYS */;


--
-- Definition of table `stockdetails`
--

DROP TABLE IF EXISTS `stockdetails`;
CREATE TABLE `stockdetails` (
  `sno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `stock` double NOT NULL,
  `financial_year` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mill_id` int(10) unsigned NOT NULL,
  `lastupdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sno`),
  KEY `FK_stockdetails_1` (`mill_id`),
  CONSTRAINT `FK_stockdetails_1` FOREIGN KEY (`mill_id`) REFERENCES `milldetails` (`sno`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stockdetails`
--

/*!40000 ALTER TABLE `stockdetails` DISABLE KEYS */;
INSERT INTO `stockdetails` (`sno`,`stock`,`financial_year`,`timestamp`,`mill_id`,`lastupdated`) VALUES 
 (10,0,'2016-2017','2016-12-18 08:39:21',1,'2016-12-18 08:39:21'),
 (11,167,'2016-2017','2016-12-18 16:50:49',3,'2016-12-18 16:50:49'),
 (12,99,'2016-2017','2016-12-18 23:23:59',4,'2016-12-18 23:23:57'),
 (13,110,'2016-2017','2016-12-18 23:32:56',17,'2016-12-18 23:32:56');
/*!40000 ALTER TABLE `stockdetails` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
