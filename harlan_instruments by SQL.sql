/*
MySQL Data Transfer
Source Host: localhost
Source Database: harlan_instruments
Target Host: localhost
Target Database: harlan_instruments
Date: 09-Dec-19 5:03:34 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `Customer_Id` int(10) NOT NULL,
  `Customer_Name` varchar(30) DEFAULT NULL,
  `Customer_Address` varchar(50) DEFAULT NULL,
  `Customer_Gender` char(8) DEFAULT NULL,
  `Customer_Age` varchar(2) DEFAULT NULL,
  `Customer_Contact_No` varchar(15) DEFAULT NULL,
  `Customer_Email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for instrument
-- ----------------------------
DROP TABLE IF EXISTS `instrument`;
CREATE TABLE `instrument` (
  `Instrument_Code` varchar(10) NOT NULL,
  `Instrument_Catagory` varchar(20) DEFAULT NULL,
  `Instrument_Brand` varchar(15) DEFAULT NULL,
  `Instrument_Name` varchar(25) DEFAULT NULL,
  `Instrument_Type` varchar(15) DEFAULT NULL,
  `Instrument_Color` char(12) DEFAULT NULL,
  `Instrument_Size` varchar(10) DEFAULT NULL,
  `Instrument_Warrenty` varchar(10) DEFAULT NULL,
  `Instrument_Discount` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`Instrument_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for instrument_order
-- ----------------------------
DROP TABLE IF EXISTS `instrument_order`;
CREATE TABLE `instrument_order` (
  `Instrument_Order_Code` int(12) NOT NULL,
  `Instrument_Code` varchar(10) DEFAULT NULL,
  `Order_Id` int(10) DEFAULT NULL,
  PRIMARY KEY (`Instrument_Order_Code`),
  KEY `Instrument_Code` (`Instrument_Code`),
  KEY `Order_Id` (`Order_Id`),
  CONSTRAINT `instrument_order_ibfk_1` FOREIGN KEY (`Instrument_Code`) REFERENCES `instrument` (`Instrument_Code`),
  CONSTRAINT `instrument_order_ibfk_2` FOREIGN KEY (`Order_Id`) REFERENCES `orders` (`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `Order_Id` int(10) NOT NULL,
  `Order_Date` date DEFAULT NULL,
  `Order_Quantity` int(5) DEFAULT NULL,
  `Order_Total_Cost` int(10) DEFAULT NULL,
  `Order_Payment_Type` varchar(10) DEFAULT NULL,
  `Customer_Id` int(10) DEFAULT NULL,
  PRIMARY KEY (`Order_Id`),
  KEY `Customer_Id` (`Customer_Id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `Service_Id` int(12) NOT NULL,
  `Service_Name` varchar(15) DEFAULT NULL,
  `Service_Type` varchar(12) DEFAULT NULL,
  `Service_Schedule` varchar(15) DEFAULT NULL,
  `Service_Issue_Date` date DEFAULT NULL,
  `Service_Return_Date` date DEFAULT NULL,
  `Staff_Id` int(10) DEFAULT NULL,
  `Order_Id` int(10) DEFAULT NULL,
  PRIMARY KEY (`Service_Id`),
  KEY `Staff_Id` (`Staff_Id`),
  KEY `Order_Id` (`Order_Id`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`),
  CONSTRAINT `service_ibfk_2` FOREIGN KEY (`Order_Id`) REFERENCES `orders` (`Order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `Staff_Id` int(10) NOT NULL,
  `Staff_Name` varchar(30) DEFAULT NULL,
  `Staff_Address` varchar(50) DEFAULT NULL,
  `Staff_Gender` char(8) DEFAULT NULL,
  `Staff_Age` varchar(3) DEFAULT NULL,
  `Staff_Contact_No` varchar(15) DEFAULT NULL,
  `Staff_Email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Staff_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `customer` VALUES ('230', 'John Herring', '8/1 New York', 'Male', '40', '(844) 373-3051', 'Herringjohn05@gmail.com');
INSERT INTO `customer` VALUES ('240', 'Cary Robinson', '13/A Boise', 'Male', '23', '(844) 733-7051', 'caryjohn100@gmail.com');
INSERT INTO `customer` VALUES ('270', 'Willy Wonka', '2/c Los Angeles', 'Female', '20', '(844) 502-8056', 'Wonkawilly30@gmail.com');
INSERT INTO `instrument` VALUES ('a3881', 'Modern Violin', 'Gibson', 'Violin', 'Croomy', 'Black', 'Small', '2 years', '10%');
INSERT INTO `instrument` VALUES ('b2777', 'Bass Guitar', 'Signature', 'Guitar', 'Handy', 'Gray', 'Medium', '2 years', '15%');
INSERT INTO `instrument` VALUES ('e8887', 'ILLY Cello', 'Jaica', 'Cello', 'Smoothy', 'Red', 'Medium', '3 years', '12%');
INSERT INTO `instrument` VALUES ('z9992', 'Brass Instrument', 'Piccolo', 'Trumpet', 'Jazz', 'Met', 'Large', '5 years', '17%');
INSERT INTO `instrument_order` VALUES ('1', 'b2777', '33');
INSERT INTO `instrument_order` VALUES ('2', 'a3881', '33');
INSERT INTO `instrument_order` VALUES ('3', 'e8887', '76');
INSERT INTO `instrument_order` VALUES ('4', 'z9992', '11');
INSERT INTO `instrument_order` VALUES ('5', 'e8887', '11');
INSERT INTO `orders` VALUES ('11', '2019-10-28', '2', '4700', 'In Cash', '270');
INSERT INTO `orders` VALUES ('33', '2019-12-04', '2', '3000', 'In Cash', '230');
INSERT INTO `orders` VALUES ('76', '2019-11-08', '1', '2000', 'In Card', '240');
INSERT INTO `service` VALUES ('3121', 'Delivery', 'Stick', '1 Week', '2019-12-02', '2019-12-09', '101', '11');
INSERT INTO `service` VALUES ('3434', 'Repair', 'String', '2 Weeks', '2019-11-22', '2019-12-04', '163', '33');
INSERT INTO `service` VALUES ('3439', 'Repair', 'Fluet', '1 Week', '2019-11-20', '2019-11-27', '163', '33');
INSERT INTO `service` VALUES ('3878', 'Delivery', 'String', '2 Days', '2019-12-02', '2019-12-04', '101', '76');
INSERT INTO `service` VALUES ('4343', 'Delivery', 'String', '5 Days', '2019-12-01', '2019-12-05', '154', '33');
INSERT INTO `service` VALUES ('6766', 'Repair', 'Fluet', '10 Days', '2019-11-25', '2019-12-05', '154', '11');
INSERT INTO `staff` VALUES ('101', 'Anita Magneson', '6/cNew South Wales', 'Female', '23', '(844) 655-2251', 'Magneson22@gmail.com');
INSERT INTO `staff` VALUES ('154', 'Ben Roberts', '8/N Florida', 'Male', '25', '(844) 855-5614', 'Johnsonbenny@gmail.com');
INSERT INTO `staff` VALUES ('163', 'Gary Crowley', '14/A Texus', 'Male', '30', '(844) 628-2761', 'Crowly10@gmail.com');
