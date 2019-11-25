# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.18)
# Database: resErvation
# Generation Time: 2019-11-25 23:24:42 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Asset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Asset`;

CREATE TABLE `Asset` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(10) DEFAULT NULL,
  `Description` varchar(100) NOT NULL,
  `CategoryId` int(10) unsigned DEFAULT NULL,
  `Pax` int(11) NOT NULL DEFAULT '2',
  `Image` varchar(100) DEFAULT NULL,
  `Comment` blob,
  `CreateDate` date NOT NULL,
  `CreateUser` varchar(10) NOT NULL DEFAULT '',
  `ModDate` date DEFAULT NULL,
  `ModUser` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkAssetCategory` (`CategoryId`),
  CONSTRAINT `fkAssetCategory` FOREIGN KEY (`CategoryId`) REFERENCES `Category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `Asset` WRITE;
/*!40000 ALTER TABLE `Asset` DISABLE KEYS */;

INSERT INTO `Asset` (`id`, `Code`, `Description`, `CategoryId`, `Pax`, `Image`, `Comment`, `CreateDate`, `CreateUser`, `ModDate`, `ModUser`)
VALUES
	(1,'R001','Room 1',NULL,2,NULL,X'546869732069732061207370656369616C20726F6F6D2E20497420686173206120646F6F7220616E642074776F2077696E646F77732E','2019-11-21','R',NULL,NULL),
	(2,'R002','Room 2',NULL,4,NULL,X'536F6D6520636F6D6D656E74206F7220696E666F20666F72207468697320726F6F6D2E','2019-11-21','R',NULL,NULL),
	(3,'R003','Room 3',NULL,3,NULL,X'576520636F756C642061646420706963747572657320696E2068657265206F7220696E20616E6F74686572206669656C642E2E2E','2019-11-21','R',NULL,NULL),
	(4,'R004','Room 4',NULL,2,NULL,X'416E6420746869732073686F756C6420626520656E6F75676820666F72206E6F772E','2019-11-21','R',NULL,NULL);

/*!40000 ALTER TABLE `Asset` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Attribute`;

CREATE TABLE `Attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `AttributeCategoryId` int(10) unsigned NOT NULL DEFAULT '1',
  `Code` varchar(10) DEFAULT NULL,
  `Attrib` varchar(255) NOT NULL DEFAULT '',
  `CreateDate` date NOT NULL,
  `CreateUser` varchar(10) NOT NULL DEFAULT '',
  `ModDate` date DEFAULT NULL,
  `ModUser` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkAttribAttribCat` (`AttributeCategoryId`),
  CONSTRAINT `fkAttribAttribCat` FOREIGN KEY (`AttributeCategoryId`) REFERENCES `AttributeCategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;



# Dump of table AttributeCategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AttributeCategory`;

CREATE TABLE `AttributeCategory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Description` varchar(50) NOT NULL DEFAULT '',
  `CreateDate` date NOT NULL,
  `CreateUser` varchar(10) NOT NULL DEFAULT '',
  `ModDate` date DEFAULT NULL,
  `ModUser` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `AttributeCategory` WRITE;
/*!40000 ALTER TABLE `AttributeCategory` DISABLE KEYS */;

INSERT INTO `AttributeCategory` (`id`, `Description`, `CreateDate`, `CreateUser`, `ModDate`, `ModUser`)
VALUES
	(1,'Asset','2019-11-21','R',NULL,NULL),
	(2,'Client','2019-11-21','R',NULL,NULL),
	(3,'Reservation','2019-11-21','R',NULL,NULL);

/*!40000 ALTER TABLE `AttributeCategory` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table AttributeValue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AttributeValue`;

CREATE TABLE `AttributeValue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `AttribId` int(11) unsigned NOT NULL DEFAULT '0',
  `AssetId` int(11) unsigned NOT NULL DEFAULT '0',
  `AttribVal` int(11) NOT NULL DEFAULT '0',
  `CreateDate` date NOT NULL,
  `CreateUser` varchar(10) NOT NULL DEFAULT '',
  `ModDate` date DEFAULT NULL,
  `ModUser` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkAttribValAttrib` (`AttribId`),
  KEY `fkAttribValAssetId` (`AssetId`),
  CONSTRAINT `fkAttribValAssetId` FOREIGN KEY (`AssetId`) REFERENCES `Asset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkAttribValAttrib` FOREIGN KEY (`AttribId`) REFERENCES `Attribute` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



# Dump of table Category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Category`;

CREATE TABLE `Category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Code` varchar(10) DEFAULT NULL,
  `Description` varchar(255) NOT NULL DEFAULT '',
  `CreateDate` date NOT NULL,
  `CreateUser` varchar(10) NOT NULL DEFAULT '',
  `ModDate` date DEFAULT NULL,
  `ModUser` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;

INSERT INTO `Category` (`id`, `Code`, `Description`, `CreateDate`, `CreateUser`, `ModDate`, `ModUser`)
VALUES
	(1,'RS','Single','2019-11-21','R',NULL,NULL),
	(2,'RD','Double','2019-11-21','R',NULL,NULL),
	(3,'SM','Smoking','2019-11-21','R',NULL,NULL),
	(4,'NS','Non-Smoking','2019-11-21','R',NULL,NULL);

/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Client
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Client`;

CREATE TABLE `Client` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SName` varchar(50) NOT NULL DEFAULT '',
  `FName` varchar(50) NOT NULL DEFAULT '',
  `Tel` varchar(25) DEFAULT '',
  `Email` varchar(100) DEFAULT NULL,
  `ResAddress` varchar(255) DEFAULT NULL,
  `CreateDate` date NOT NULL,
  `CreateUser` varchar(10) NOT NULL DEFAULT '',
  `ModDate` date DEFAULT NULL,
  `ModUser` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dxName` (`SName`),
  KEY `dxFName` (`FName`),
  KEY `dxClientTel` (`Tel`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;

INSERT INTO `Client` (`id`, `SName`, `FName`, `Tel`, `Email`, `ResAddress`, `CreateDate`, `CreateUser`, `ModDate`, `ModUser`)
VALUES
	(1,'Smith','Josephine','+2712345678','jo@smith.co.za','Somepalce Else, Another Town, 1234','2019-11-21','R',NULL,NULL);

/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Res
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Res`;

CREATE TABLE `Res` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `AssetId` int(11) unsigned NOT NULL,
  `ClientId` int(10) unsigned NOT NULL,
  `ReserveDate` date NOT NULL,
  `Comment` blob,
  `CreateDate` date NOT NULL,
  `CreateUser` varchar(10) NOT NULL DEFAULT '',
  `ModDate` date DEFAULT NULL,
  `ModUser` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dxClient` (`ClientId`),
  KEY `dxAsset` (`AssetId`),
  KEY `dxStart` (`ReserveDate`),
  CONSTRAINT `fkResAsset` FOREIGN KEY (`id`) REFERENCES `Asset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fkResClient` FOREIGN KEY (`ClientId`) REFERENCES `Client` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
