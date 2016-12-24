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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity`
--

/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` (`sno`,`mill_id`,`opening_stock`,`purchase`,`used`,`closing_stock`,`createdon`,`financial_year`,`remarks`) VALUES 
 (1,1,0,131,NULL,131,'2016-12-24 12:13:58','2016-2017','Imported from excel'),
 (2,2,0,73,NULL,73,'2016-12-24 12:14:13','2016-2017','Imported from excel'),
 (3,3,0,38,NULL,38,'2016-12-24 12:14:19','2016-2017','Imported from excel'),
 (4,4,0,562,NULL,562,'2016-12-24 12:14:26','2016-2017','Imported from excel'),
 (5,5,0,71,NULL,71,'2016-12-24 12:14:32','2016-2017','Imported from excel'),
 (6,6,0,37,NULL,37,'2016-12-24 12:14:41','2016-2017','Imported from excel'),
 (7,7,0,46,NULL,46,'2016-12-24 12:14:50','2016-2017','Imported from excel'),
 (8,8,0,40,NULL,40,'2016-12-24 12:14:54','2016-2017','Imported from excel'),
 (9,9,0,77,NULL,77,'2016-12-24 12:14:58','2016-2017','Imported from excel'),
 (10,10,0,14,NULL,14,'2016-12-24 12:15:36','2016-2017','Imported from excel'),
 (11,11,0,2749,NULL,2749,'2016-12-24 12:15:53','2016-2017','Imported from excel'),
 (12,12,0,124,NULL,124,'2016-12-24 12:15:59','2016-2017','Imported from excel'),
 (13,13,0,90,NULL,90,'2016-12-24 12:16:29','2016-2017','Imported from excel'),
 (14,14,0,35,NULL,35,'2016-12-24 12:16:36','2016-2017','Imported from excel'),
 (15,15,0,52,NULL,52,'2016-12-24 12:16:55','2016-2017','Imported from excel'),
 (16,16,0,56,NULL,56,'2016-12-24 12:17:02','2016-2017','Imported from excel'),
 (17,17,0,562,NULL,562,'2016-12-24 12:17:06','2016-2017','Imported from excel'),
 (18,18,0,63,NULL,63,'2016-12-24 12:17:10','2016-2017','Imported from excel'),
 (19,19,0,4917,NULL,4917,'2016-12-24 12:17:13','2016-2017','Imported from excel'),
 (20,20,0,2282,NULL,2282,'2016-12-24 12:17:16','2016-2017','Imported from excel'),
 (21,21,0,482,NULL,482,'2016-12-24 12:17:19','2016-2017','Imported from excel'),
 (22,22,0,800,NULL,800,'2016-12-24 12:17:22','2016-2017','Imported from excel'),
 (23,23,0,1514,NULL,1514,'2016-12-24 12:17:26','2016-2017','Imported from excel'),
 (24,24,0,13,NULL,13,'2016-12-24 12:17:29','2016-2017','Imported from excel'),
 (25,25,0,550,NULL,550,'2016-12-24 12:17:33','2016-2017','Imported from excel'),
 (26,26,0,308,NULL,308,'2016-12-24 12:17:53','2016-2017','Imported from excel'),
 (27,27,0,948,NULL,948,'2016-12-24 12:17:56','2016-2017','Imported from excel'),
 (28,28,0,510,NULL,510,'2016-12-24 12:18:00','2016-2017','Imported from excel'),
 (29,29,0,289,NULL,289,'2016-12-24 12:18:03','2016-2017','Imported from excel'),
 (30,30,0,6451,NULL,6451,'2016-12-24 12:18:07','2016-2017','Imported from excel'),
 (31,31,0,1569,NULL,1569,'2016-12-24 12:18:18','2016-2017','Imported from excel'),
 (32,32,0,214,NULL,214,'2016-12-24 12:18:23','2016-2017','Imported from excel'),
 (33,33,0,53,NULL,53,'2016-12-24 12:18:27','2016-2017','Imported from excel'),
 (34,34,0,83,NULL,83,'2016-12-24 12:18:32','2016-2017','Imported from excel'),
 (35,35,0,3621,NULL,3621,'2016-12-24 12:18:41','2016-2017','Imported from excel'),
 (36,36,0,140,NULL,140,'2016-12-24 12:18:44','2016-2017','Imported from excel'),
 (37,37,0,99,NULL,99,'2016-12-24 12:18:47','2016-2017','Imported from excel'),
 (38,38,0,13,NULL,13,'2016-12-24 12:18:50','2016-2017','Imported from excel'),
 (39,39,0,1965,NULL,1965,'2016-12-24 12:18:54','2016-2017','Imported from excel'),
 (40,40,0,727,NULL,727,'2016-12-24 12:19:00','2016-2017','Imported from excel'),
 (41,41,0,75,NULL,75,'2016-12-24 12:19:06','2016-2017','Imported from excel'),
 (42,42,0,28,NULL,28,'2016-12-24 12:19:10','2016-2017','Imported from excel'),
 (43,43,0,17,NULL,17,'2016-12-24 12:19:13','2016-2017','Imported from excel'),
 (44,44,0,20,NULL,20,'2016-12-24 12:19:17','2016-2017','Imported from excel'),
 (45,45,0,163,NULL,163,'2016-12-24 12:19:37','2016-2017','Imported from excel'),
 (46,46,0,126,NULL,126,'2016-12-24 12:19:40','2016-2017','Imported from excel'),
 (47,47,0,287,NULL,287,'2016-12-24 12:19:42','2016-2017','Imported from excel'),
 (48,48,0,483,NULL,483,'2016-12-24 12:19:46','2016-2017','Imported from excel'),
 (49,49,0,146,NULL,146,'2016-12-24 12:19:49','2016-2017','Imported from excel'),
 (50,50,0,365,NULL,365,'2016-12-24 12:22:57','2016-2017','Imported from excel'),
 (51,51,0,60,NULL,60,'2016-12-24 12:23:00','2016-2017','Imported from excel'),
 (52,52,0,297,NULL,297,'2016-12-24 12:23:02','2016-2017','Imported from excel'),
 (53,53,0,435,NULL,435,'2016-12-24 12:23:06','2016-2017','Imported from excel'),
 (54,54,0,230,NULL,230,'2016-12-24 12:23:09','2016-2017','Imported from excel'),
 (55,55,0,3361,NULL,3361,'2016-12-24 12:23:12','2016-2017','Imported from excel'),
 (56,56,0,220,NULL,220,'2016-12-24 12:23:15','2016-2017','Imported from excel'),
 (57,57,0,424,NULL,424,'2016-12-24 12:23:19','2016-2017','Imported from excel'),
 (58,58,0,30,NULL,30,'2016-12-24 12:23:23','2016-2017','Imported from excel'),
 (59,59,0,815,NULL,815,'2016-12-24 12:23:26','2016-2017','Imported from excel'),
 (60,60,0,73,NULL,73,'2016-12-24 12:23:29','2016-2017','Imported from excel'),
 (61,61,0,98,NULL,98,'2016-12-24 12:23:32','2016-2017','Imported from excel'),
 (62,62,0,2683,NULL,2683,'2016-12-24 12:23:35','2016-2017','Imported from excel'),
 (63,63,0,11388,NULL,11388,'2016-12-24 12:23:37','2016-2017','Imported from excel'),
 (64,64,0,157,NULL,157,'2016-12-24 12:23:40','2016-2017','Imported from excel'),
 (65,65,0,1889,NULL,1889,'2016-12-24 12:23:43','2016-2017','Imported from excel'),
 (66,66,0,600,NULL,600,'2016-12-24 12:23:46','2016-2017','Imported from excel'),
 (67,67,0,46,NULL,46,'2016-12-24 12:23:49','2016-2017','Imported from excel'),
 (68,68,0,3330,NULL,3330,'2016-12-24 12:23:53','2016-2017','Imported from excel'),
 (69,69,0,820,NULL,820,'2016-12-24 12:23:55','2016-2017','Imported from excel'),
 (70,70,0,42,NULL,42,'2016-12-24 12:23:58','2016-2017','Imported from excel'),
 (71,71,0,141,NULL,141,'2016-12-24 12:24:01','2016-2017','Imported from excel'),
 (72,72,0,671,NULL,671,'2016-12-24 12:24:04','2016-2017','Imported from excel'),
 (73,73,0,116,NULL,116,'2016-12-24 12:24:07','2016-2017','Imported from excel'),
 (74,74,0,268,NULL,268,'2016-12-24 12:24:09','2016-2017','Imported from excel'),
 (75,75,0,119,NULL,119,'2016-12-24 12:24:12','2016-2017','Imported from excel'),
 (76,76,0,148,NULL,148,'2016-12-24 12:24:14','2016-2017','Imported from excel'),
 (77,77,0,30,NULL,30,'2016-12-24 12:24:17','2016-2017','Imported from excel');
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `milldetails`
--

/*!40000 ALTER TABLE `milldetails` DISABLE KEYS */;
INSERT INTO `milldetails` (`sno`,`millname`,`gsm`,`grade`,`size`,`address`,`mailid`,`phone`,`remarks`,`createdon`) VALUES 
 (1,'CARBONLESS','50','CFB WT','9-inch','','','','imported from excel','2016-12-24 12:13:54'),
 (2,'CARBONLESS','50','CFB PINK','9-inch','','','','imported from excel','2016-12-24 12:14:13'),
 (3,'CARBONLESS','50','CFB PINK','10-inch','','','','imported from excel','2016-12-24 12:14:19'),
 (4,'TNPL','50','CREAMWOVE','34-inch','','','','imported from excel','2016-12-24 12:14:26'),
 (5,'CARBONLESS','50','CFB BLUE','9-inch','','','','imported from excel','2016-12-24 12:14:32'),
 (6,'CARBONLESS','55','CF GREEN','9-inch','','','','imported from excel','2016-12-24 12:14:41'),
 (7,'CARBONLESS','55','CB WT','9-inch','','','','imported from excel','2016-12-24 12:14:50'),
 (8,'CARBONLESS','55','CFB YELLOW','9-inch','','','','imported from excel','2016-12-24 12:14:54'),
 (9,'CARBONLESS','55','CF WT','9-inch','','','','imported from excel','2016-12-24 12:14:58'),
 (10,'CARBONLESS','55','CF WT','15-inch','','','','imported from excel','2016-12-24 12:15:36'),
 (11,'CARBONLESS','55','CF WT','17-inch','','','','imported from excel','2016-12-24 12:15:53'),
 (12,'CARBONLESS','55','CB GREEN','9-inch','','','','imported from excel','2016-12-24 12:15:59'),
 (13,'CARBONLESS','55','CF YELLOW','9-inch','','','','imported from excel','2016-12-24 12:16:29'),
 (14,'CARBONLESS','55','CB YELLOW','9-inch','','','','imported from excel','2016-12-24 12:16:36'),
 (15,'CARBONLESS','55','CB BLUE','9-inch','','','','imported from excel','2016-12-24 12:16:55'),
 (16,'CARBONLESS','55','CF WT','8 1/2-inch','','','','imported from excel','2016-12-24 12:17:02'),
 (17,'SPB','57.0','MAPLITHO','32.5-inch','','','','imported from excel','2016-12-24 12:17:06'),
 (18,'CARBONLESS','57.0','CF WT','15-inch','','','','imported from excel','2016-12-24 12:17:10'),
 (19,'CARBONLESS','105.0','CB WT','17-inch','','','','imported from excel','2016-12-24 12:17:13'),
 (20,'CARBONLESS','105.0','CB WT','9-inch','','','','imported from excel','2016-12-24 12:17:16'),
 (21,'CARBONLESS','55.0','CF WT','17-inch','','','','imported from excel','2016-12-24 12:17:19'),
 (22,'CARBONLESS','60.0','CF WT','9-inch','','','','imported from excel','2016-12-24 12:17:22'),
 (23,'TNPL','56.0','CREAMWOVE','33 1/2-inch','','','','imported from excel','2016-12-24 12:17:26'),
 (24,'TNPL','56.0','CREAMWOVE','16 3/4-inch','','','','imported from excel','2016-12-24 12:17:29'),
 (25,'TNPL','58.0','MAPLITHO','34-inch','','','','imported from excel','2016-12-24 12:17:32'),
 (26,'TNPL','58.0','MAPLITHO','17-inch','','','','imported from excel','2016-12-24 12:17:53'),
 (27,'SARVALAKSHMI','60.0','MAPLITHO','30-inch','','','','imported from excel','2016-12-24 12:17:56'),
 (28,'CARBONLESS','67.0','CF WT','9-inch','','','','imported from excel','2016-12-24 12:18:00'),
 (29,'SPB','70.0','MAPLITHO- REEM','23x36-inch','','','','imported from excel','2016-12-24 12:18:03'),
 (30,'TNPL ( Karis offset printers )','68.0','MAPLITHO','33 1/2-inch','','','','imported from excel','2016-12-24 12:18:07'),
 (31,'TNPL','68.0','MAPLITHO','33-inch','','','','imported from excel','2016-12-24 12:18:18'),
 (32,'TNPL','68.0','MAPLITHO','16 1/2-inch','','','','imported from excel','2016-12-24 12:18:23'),
 (33,'TNPL','70.0','MAPLITHO','17-inch','','','','imported from excel','2016-12-24 12:18:27'),
 (34,'CARBONLESS','75.0','CB WT','10-inch','','','','imported from excel','2016-12-24 12:18:32'),
 (35,'SPB','75.0','MAPLITHO','15-inch','','','','imported from excel','2016-12-24 12:18:41'),
 (36,'CARBONLESS','75.0','CF WT','9-inch','','','','imported from excel','2016-12-24 12:18:44'),
 (37,'CARBONLESS','80.0','CB WT','9-inch','','','','imported from excel','2016-12-24 12:18:47'),
 (38,'TNPL','80.0','MAPLITHO','17-inch','','','','imported from excel','2016-12-24 12:18:50'),
 (39,'FINE PAPER SOURCE PVT LTD','75.0','UNCOATED PAPER D','17 1/4-inch','','','','imported from excel','2016-12-24 12:18:54'),
 (40,'FINE PAPER SOURCE PVT LTD','80.0','UNCOATED PAPER D','8.5-inch','','','','imported from excel','2016-12-24 12:19:00'),
 (41,'FINE PAPER SOURCE PVT LTD','80.0','UNCOATED PAPER D','11.7x16.5-inch','','','','imported from excel','2016-12-24 12:19:06'),
 (42,'FINE PAPER SOURCE PVT LTD','80.0','UNCOATED PAPER D','15-inch','','','','imported from excel','2016-12-24 12:19:10'),
 (43,'TNPL','90.0','MAPLITHO','17-inch','','','','imported from excel','2016-12-24 12:19:13'),
 (44,'FINE PAPER SOURCE PVT LTD','90.0','UNCOATED PAPER D','8.1/2-inch','','','','imported from excel','2016-12-24 12:19:17'),
 (45,'WESTCOAST','95.0','MICR','15-inch','','','','imported from excel','2016-12-24 12:19:36'),
 (46,'JK-MICR','95.0','MICR','9-inch','','','','imported from excel','2016-12-24 12:19:40'),
 (47,'JK-MICR','95.0','MICR','17.1/2-inch','','','','imported from excel','2016-12-24 12:19:42'),
 (48,'WESTCOAST','100.0','MAPLITHO','30-inch','','','','imported from excel','2016-12-24 12:19:46'),
 (49,'CARBONLESS','100.0','CB WT','15-inch','','','','imported from excel','2016-12-24 12:19:49'),
 (50,'CARBONLESS','105.0','CB WT','8.1/2-inch','','','','imported from excel','2016-12-24 12:22:57'),
 (51,'JK-PARCHMENT','105.0','PARCHMENT','9.1/2-inch','','','','imported from excel','2016-12-24 12:23:00'),
 (52,'JK-PARCHMENT','105.0','PARCHMENT','11-inch','','','','imported from excel','2016-12-24 12:23:02'),
 (53,'JK-PARCHMENT','105.0','PARCHMENT','15-inch','','','','imported from excel','2016-12-24 12:23:06'),
 (54,'WESTCOAST','105.0','PARCHMENT','18-inch','','','','imported from excel','2016-12-24 12:23:09'),
 (55,'JK-PARCHMENT','105.0','PARCHMENT','10-inch','','','','imported from excel','2016-12-24 12:23:12'),
 (56,'CARBONLESS','105.0','CB WT','10-inch','','','','imported from excel','2016-12-24 12:23:15'),
 (57,'SPB','110.0','MAPLITHO','9-inch','','','','imported from excel','2016-12-24 12:23:19'),
 (58,'N/S','110.0','MAPLITHO','11-inch','','','','imported from excel','2016-12-24 12:23:23'),
 (59,'FINE PAPER SOURCE PVT LTD','110.0','YELLOW-D','34-inch','','','','imported from excel','2016-12-24 12:23:26'),
 (60,'FINE PAPER SOURCE PVT LTD','110.0','YELLOW-D','8.1/2-inch','','','','imported from excel','2016-12-24 12:23:29'),
 (61,'FINE PAPER SOURCE PVT LTD','120.0','UNCOATED PAPER D','11 1/4 -inch','','','','imported from excel','2016-12-24 12:23:32'),
 (62,'SPB','110.0','MAPLITHO','14.3/4-inch','','','','imported from excel','2016-12-24 12:23:35'),
 (63,'SPB','110.0','MAPLITHO','17.3/4-inch','','','','imported from excel','2016-12-24 12:23:37'),
 (64,'SPB','120.0','MAPLITHO','10-inch','','','','imported from excel','2016-12-24 12:23:40'),
 (65,'SPB','120.0','MAPLITHO','14.3/4-inch','','','','imported from excel','2016-12-24 12:23:43'),
 (66,'SPB','120.0','MAPLITHO','16-inch','','','','imported from excel','2016-12-24 12:23:46'),
 (67,'N/S','120.0','MAPLITHO','12-inch','','','','imported from excel','2016-12-24 12:23:49'),
 (68,'FINE PAPER SOURCE PVT LTD','115.0','MAPLITHO','16-inch','','','','imported from excel','2016-12-24 12:23:53'),
 (69,'FINE PAPER SOURCE PVT LTD','135.0','UNCOATED PAPER D','14.6-inch','','','','imported from excel','2016-12-24 12:23:55'),
 (70,'DURGA','140.0','BOARDPAPER','9-inch','','','','imported from excel','2016-12-24 12:23:58'),
 (71,'WESTCOAST','140.0','MAPLITHO','11-inch','','','','imported from excel','2016-12-24 12:24:01'),
 (72,'AZHAGU','140.0','MAPLITHO','12-inch','','','','imported from excel','2016-12-24 12:24:04'),
 (73,'ASIAN REPRO','197.0','CYBER PRINT','9.1/2-inch','','','','imported from excel','2016-12-24 12:24:07'),
 (74,'WESTCOAST','140.0','MAPLITHO','10-inch','','','','imported from excel','2016-12-24 12:24:09'),
 (75,'ALLIED PAPER','150.0','BOPP SYN','9.25-inch','','','','imported from excel','2016-12-24 12:24:12'),
 (76,'ALLIED PAPER','197.0','BOPP SYN','9.25-inch','','','','imported from excel','2016-12-24 12:24:14'),
 (77,'DURGA','160.0','BOARDPAPER','15-inch','','','','imported from excel','2016-12-24 12:24:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stockdetails`
--

/*!40000 ALTER TABLE `stockdetails` DISABLE KEYS */;
INSERT INTO `stockdetails` (`sno`,`stock`,`financial_year`,`timestamp`,`mill_id`,`lastupdated`) VALUES 
 (1,131,'2016-2017','2016-12-24 12:14:01',1,'2016-12-24 12:14:01'),
 (2,73,'2016-2017','2016-12-24 12:14:13',2,'2016-12-24 12:14:13'),
 (3,38,'2016-2017','2016-12-24 12:14:19',3,'2016-12-24 12:14:19'),
 (4,562,'2016-2017','2016-12-24 12:14:26',4,'2016-12-24 12:14:26'),
 (5,71,'2016-2017','2016-12-24 12:14:32',5,'2016-12-24 12:14:32'),
 (6,37,'2016-2017','2016-12-24 12:14:41',6,'2016-12-24 12:14:41'),
 (7,46,'2016-2017','2016-12-24 12:14:50',7,'2016-12-24 12:14:50'),
 (8,40,'2016-2017','2016-12-24 12:14:54',8,'2016-12-24 12:14:54'),
 (9,77,'2016-2017','2016-12-24 12:14:58',9,'2016-12-24 12:14:58'),
 (10,14,'2016-2017','2016-12-24 12:15:36',10,'2016-12-24 12:15:36'),
 (11,2749,'2016-2017','2016-12-24 12:15:53',11,'2016-12-24 12:15:53'),
 (12,124,'2016-2017','2016-12-24 12:15:59',12,'2016-12-24 12:15:59'),
 (13,90,'2016-2017','2016-12-24 12:16:29',13,'2016-12-24 12:16:29'),
 (14,35,'2016-2017','2016-12-24 12:16:36',14,'2016-12-24 12:16:36'),
 (15,52,'2016-2017','2016-12-24 12:16:55',15,'2016-12-24 12:16:55'),
 (16,56,'2016-2017','2016-12-24 12:17:02',16,'2016-12-24 12:17:02'),
 (17,562,'2016-2017','2016-12-24 12:17:06',17,'2016-12-24 12:17:06'),
 (18,63,'2016-2017','2016-12-24 12:17:10',18,'2016-12-24 12:17:10'),
 (19,4917,'2016-2017','2016-12-24 12:17:13',19,'2016-12-24 12:17:13'),
 (20,2282,'2016-2017','2016-12-24 12:17:16',20,'2016-12-24 12:17:16'),
 (21,482,'2016-2017','2016-12-24 12:17:19',21,'2016-12-24 12:17:19'),
 (22,800,'2016-2017','2016-12-24 12:17:22',22,'2016-12-24 12:17:22'),
 (23,1514,'2016-2017','2016-12-24 12:17:26',23,'2016-12-24 12:17:26'),
 (24,13,'2016-2017','2016-12-24 12:17:29',24,'2016-12-24 12:17:29'),
 (25,550,'2016-2017','2016-12-24 12:17:33',25,'2016-12-24 12:17:33'),
 (26,308,'2016-2017','2016-12-24 12:17:53',26,'2016-12-24 12:17:53'),
 (27,948,'2016-2017','2016-12-24 12:17:56',27,'2016-12-24 12:17:56'),
 (28,510,'2016-2017','2016-12-24 12:18:00',28,'2016-12-24 12:18:00'),
 (29,289,'2016-2017','2016-12-24 12:18:03',29,'2016-12-24 12:18:03'),
 (30,6451,'2016-2017','2016-12-24 12:18:07',30,'2016-12-24 12:18:07'),
 (31,1569,'2016-2017','2016-12-24 12:18:18',31,'2016-12-24 12:18:18'),
 (32,214,'2016-2017','2016-12-24 12:18:23',32,'2016-12-24 12:18:23'),
 (33,53,'2016-2017','2016-12-24 12:18:28',33,'2016-12-24 12:18:28'),
 (34,83,'2016-2017','2016-12-24 12:18:32',34,'2016-12-24 12:18:32'),
 (35,3621,'2016-2017','2016-12-24 12:18:41',35,'2016-12-24 12:18:41'),
 (36,140,'2016-2017','2016-12-24 12:18:44',36,'2016-12-24 12:18:44'),
 (37,99,'2016-2017','2016-12-24 12:18:47',37,'2016-12-24 12:18:47'),
 (38,13,'2016-2017','2016-12-24 12:18:50',38,'2016-12-24 12:18:50'),
 (39,1965,'2016-2017','2016-12-24 12:18:54',39,'2016-12-24 12:18:54'),
 (40,727,'2016-2017','2016-12-24 12:19:00',40,'2016-12-24 12:19:00'),
 (41,75,'2016-2017','2016-12-24 12:19:06',41,'2016-12-24 12:19:06'),
 (42,28,'2016-2017','2016-12-24 12:19:10',42,'2016-12-24 12:19:10'),
 (43,17,'2016-2017','2016-12-24 12:19:14',43,'2016-12-24 12:19:14'),
 (44,20,'2016-2017','2016-12-24 12:19:17',44,'2016-12-24 12:19:17'),
 (45,163,'2016-2017','2016-12-24 12:19:37',45,'2016-12-24 12:19:37'),
 (46,126,'2016-2017','2016-12-24 12:19:40',46,'2016-12-24 12:19:40'),
 (47,287,'2016-2017','2016-12-24 12:19:43',47,'2016-12-24 12:19:43'),
 (48,483,'2016-2017','2016-12-24 12:19:46',48,'2016-12-24 12:19:46'),
 (49,146,'2016-2017','2016-12-24 12:19:49',49,'2016-12-24 12:19:49'),
 (50,365,'2016-2017','2016-12-24 12:22:57',50,'2016-12-24 12:22:57'),
 (51,60,'2016-2017','2016-12-24 12:23:00',51,'2016-12-24 12:23:00'),
 (52,297,'2016-2017','2016-12-24 12:23:02',52,'2016-12-24 12:23:02'),
 (53,435,'2016-2017','2016-12-24 12:23:06',53,'2016-12-24 12:23:06'),
 (54,230,'2016-2017','2016-12-24 12:23:09',54,'2016-12-24 12:23:09'),
 (55,3361,'2016-2017','2016-12-24 12:23:12',55,'2016-12-24 12:23:12'),
 (56,220,'2016-2017','2016-12-24 12:23:15',56,'2016-12-24 12:23:15'),
 (57,424,'2016-2017','2016-12-24 12:23:19',57,'2016-12-24 12:23:19'),
 (58,30,'2016-2017','2016-12-24 12:23:23',58,'2016-12-24 12:23:23'),
 (59,815,'2016-2017','2016-12-24 12:23:26',59,'2016-12-24 12:23:26'),
 (60,73,'2016-2017','2016-12-24 12:23:29',60,'2016-12-24 12:23:29'),
 (61,98,'2016-2017','2016-12-24 12:23:32',61,'2016-12-24 12:23:32'),
 (62,2683,'2016-2017','2016-12-24 12:23:35',62,'2016-12-24 12:23:35'),
 (63,11388,'2016-2017','2016-12-24 12:23:37',63,'2016-12-24 12:23:37'),
 (64,157,'2016-2017','2016-12-24 12:23:40',64,'2016-12-24 12:23:40'),
 (65,1889,'2016-2017','2016-12-24 12:23:43',65,'2016-12-24 12:23:43'),
 (66,600,'2016-2017','2016-12-24 12:23:46',66,'2016-12-24 12:23:46'),
 (67,46,'2016-2017','2016-12-24 12:23:49',67,'2016-12-24 12:23:49'),
 (68,3330,'2016-2017','2016-12-24 12:23:53',68,'2016-12-24 12:23:53'),
 (69,820,'2016-2017','2016-12-24 12:23:55',69,'2016-12-24 12:23:55'),
 (70,42,'2016-2017','2016-12-24 12:23:58',70,'2016-12-24 12:23:58'),
 (71,141,'2016-2017','2016-12-24 12:24:01',71,'2016-12-24 12:24:01'),
 (72,671,'2016-2017','2016-12-24 12:24:04',72,'2016-12-24 12:24:04'),
 (73,116,'2016-2017','2016-12-24 12:24:07',73,'2016-12-24 12:24:07'),
 (74,268,'2016-2017','2016-12-24 12:24:09',74,'2016-12-24 12:24:09'),
 (75,119,'2016-2017','2016-12-24 12:24:12',75,'2016-12-24 12:24:12'),
 (76,148,'2016-2017','2016-12-24 12:24:14',76,'2016-12-24 12:24:14'),
 (77,30,'2016-2017','2016-12-24 12:24:17',77,'2016-12-24 12:24:17');
/*!40000 ALTER TABLE `stockdetails` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
