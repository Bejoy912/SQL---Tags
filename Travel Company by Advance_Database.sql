/*
MySQL Data Transfer
Source Host: localhost
Source Database: cis_2
Target Host: localhost
Target Database: cis_2
Date: 19-Aug-20 5:21:07 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `CustomerNumber` varchar(7) NOT NULL,
  `CustomerName` varchar(25) DEFAULT NULL,
  `CustomerTelephone` varchar(12) DEFAULT NULL,
  `ReturningCustomer` char(3) DEFAULT NULL,
  `Address` varchar(65) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for customerproduct
-- ----------------------------
DROP TABLE IF EXISTS `customerproduct`;
CREATE TABLE `customerproduct` (
  `CustomerProductId` varchar(12) NOT NULL,
  `CustomerNumber` varchar(7) DEFAULT NULL,
  `ProductCode` varchar(12) DEFAULT NULL,
  `ActiveDate` varchar(40) DEFAULT '',
  `Quantity` int(5) DEFAULT NULL,
  PRIMARY KEY (`CustomerProductId`),
  KEY `FK_1` (`CustomerNumber`),
  KEY `FK_2` (`ProductCode`),
  CONSTRAINT `FK_1` FOREIGN KEY (`CustomerNumber`) REFERENCES `customer` (`CustomerNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_2` FOREIGN KEY (`ProductCode`) REFERENCES `product` (`ProductCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `LocationCode` varchar(12) NOT NULL,
  `LocationName` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`LocationCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ProductCode` varchar(12) NOT NULL,
  `ProductName` varchar(50) DEFAULT NULL,
  `LocationCode` varchar(12) DEFAULT NULL,
  `ProductTypeCode` char(5) DEFAULT NULL,
  `Price` float(10,0) DEFAULT NULL,
  PRIMARY KEY (`ProductCode`),
  KEY `FK_3` (`LocationCode`),
  KEY `FK_4` (`ProductTypeCode`),
  CONSTRAINT `FK_3` FOREIGN KEY (`LocationCode`) REFERENCES `location` (`LocationCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_4` FOREIGN KEY (`ProductTypeCode`) REFERENCES `producttype` (`ProductTypeCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for producttype
-- ----------------------------
DROP TABLE IF EXISTS `producttype`;
CREATE TABLE `producttype` (
  `ProductTypeCode` char(5) NOT NULL,
  `ProductTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProductTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `customer` VALUES ('00127', 'Dave Higgins', '0209 8888888', 'Yes', '27 Acacia Avenue, Upper Farringdon, Rutlandshire, R1 877', 'Customer diabetic');
INSERT INTO `customerproduct` VALUES ('100/00127', '00127', '01/2004/01', '01-06-04 to 17-06-04', '1');
INSERT INTO `customerproduct` VALUES ('101/00127', '00127', 'BTH/03', 'Not Active', '1');
INSERT INTO `customerproduct` VALUES ('102/00127', '00127', 'BTH/04', 'Not Active', '1');
INSERT INTO `customerproduct` VALUES ('103/00127', '00127', '01/2004/02', '18-06-04 to 29-06-04', '1');
INSERT INTO `customerproduct` VALUES ('104/00127', '00127', 'FE/05', 'Not Active', '1');
INSERT INTO `customerproduct` VALUES ('105/00127', '00127', 'AC/06', 'Not Active', '1');
INSERT INTO `location` VALUES ('CUBA', 'Cuba');
INSERT INTO `location` VALUES ('HAW', 'Hawaii');
INSERT INTO `location` VALUES ('NZ', 'North Island in New Zealand');
INSERT INTO `location` VALUES ('SARD', 'Sardinia');
INSERT INTO `location` VALUES ('STKITTS', 'St kitts and Nevis');
INSERT INTO `product` VALUES ('01/2004/01', 'Holiday 1', 'CUBA', 'HOL', '1250');
INSERT INTO `product` VALUES ('01/2004/02', 'Holiday 1', 'SARD', 'HOL', '1200');
INSERT INTO `product` VALUES ('AC/06', 'All weather clothing', 'NZ', 'EH', '1500');
INSERT INTO `product` VALUES ('BTH/03', 'Boat Hire', 'STKITTS', 'BH', '1700');
INSERT INTO `product` VALUES ('BTH/04', 'Boat Hire', 'HAW', 'BH', '1750');
INSERT INTO `product` VALUES ('FE/05', 'Fishing Equipment', 'HAW', 'EH', '2000');
INSERT INTO `producttype` VALUES ('BH', 'Boat Hire');
INSERT INTO `producttype` VALUES ('EH', 'Equipment Hire');
INSERT INTO `producttype` VALUES ('HOL', 'Holiday Package');
