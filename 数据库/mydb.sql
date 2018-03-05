/*
Navicat MySQL Data Transfer

Source Server         : 1
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : mydb

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-06-06 16:19:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for back_camera
-- ----------------------------
DROP TABLE IF EXISTS `back_camera`;
CREATE TABLE `back_camera` (
  `number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of back_camera
-- ----------------------------
INSERT INTO `back_camera` VALUES ('1', '2100万', '500.00');
INSERT INTO `back_camera` VALUES ('2', '1600万', '400.00');
INSERT INTO `back_camera` VALUES ('3', '1300万', '350.00');
INSERT INTO `back_camera` VALUES ('4', '800万', '300.00');
INSERT INTO `back_camera` VALUES ('5', '500万', '200.00');
INSERT INTO `back_camera` VALUES ('6', '400万', '100.00');

-- ----------------------------
-- Table structure for cpu
-- ----------------------------
DROP TABLE IF EXISTS `cpu`;
CREATE TABLE `cpu` (
  `number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpu
-- ----------------------------
INSERT INTO `cpu` VALUES ('2', '骁龙820', '600.00');
INSERT INTO `cpu` VALUES ('5', '骁龙810', '400.00');
INSERT INTO `cpu` VALUES ('6', '骁龙801', '350.00');
INSERT INTO `cpu` VALUES ('3', '三星', '500.00');
INSERT INTO `cpu` VALUES ('1', '苹果', '700.00');
INSERT INTO `cpu` VALUES ('7', '联发科', '300.00');
INSERT INTO `cpu` VALUES ('4', 'intel', '450.00');
INSERT INTO `cpu` VALUES ('8', 'Nvidia', '200.00');

-- ----------------------------
-- Table structure for cpu_number
-- ----------------------------
DROP TABLE IF EXISTS `cpu_number`;
CREATE TABLE `cpu_number` (
  `number` int(11) NOT NULL,
  `cpu_number` int(11) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpu_number
-- ----------------------------
INSERT INTO `cpu_number` VALUES ('1', '8', null);
INSERT INTO `cpu_number` VALUES ('2', '4', null);
INSERT INTO `cpu_number` VALUES ('3', '2', null);
INSERT INTO `cpu_number` VALUES ('4', '1', null);

-- ----------------------------
-- Table structure for fore_camera
-- ----------------------------
DROP TABLE IF EXISTS `fore_camera`;
CREATE TABLE `fore_camera` (
  `number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fore_camera
-- ----------------------------
INSERT INTO `fore_camera` VALUES ('1', '1300万', '400.00');
INSERT INTO `fore_camera` VALUES ('2', '800万', '300.00');
INSERT INTO `fore_camera` VALUES ('3', '500万', '200.00');
INSERT INTO `fore_camera` VALUES ('4', '400万', '100.00');
INSERT INTO `fore_camera` VALUES ('5', '200万', '50.00');

-- ----------------------------
-- Table structure for inch
-- ----------------------------
DROP TABLE IF EXISTS `inch`;
CREATE TABLE `inch` (
  `number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inch
-- ----------------------------
INSERT INTO `inch` VALUES ('1', '6.0英寸以上', '300.00');
INSERT INTO `inch` VALUES ('2', '5.6-5.9英寸', '270.00');
INSERT INTO `inch` VALUES ('3', '5.1-5.4英寸', '250.00');
INSERT INTO `inch` VALUES ('4', '5.0英寸', '230.00');
INSERT INTO `inch` VALUES ('5', '4.5-4.9英寸', '200.00');
INSERT INTO `inch` VALUES ('6', '4.1-4.5英寸', '180.00');
INSERT INTO `inch` VALUES ('7', '4.0英寸以下', '150.00');

-- ----------------------------
-- Table structure for phone
-- ----------------------------
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `cpu` varchar(255) DEFAULT NULL,
  `cpu_number` int(11) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `rom` varchar(255) DEFAULT NULL,
  `fore_camera` varchar(255) DEFAULT NULL,
  `back_camera` varchar(255) DEFAULT NULL,
  `inch` varchar(255) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `max_money` double(255,0) DEFAULT NULL,
  `total_money` double(255,0) DEFAULT NULL,
  `cpu_money` double(255,0) DEFAULT NULL,
  `ram_money` double(255,0) DEFAULT NULL,
  `rom_money` double(255,0) DEFAULT NULL,
  `fore_camera_money` double(255,0) DEFAULT NULL,
  `back_camera_money` double(255,0) DEFAULT NULL,
  `inch_money` double(255,0) DEFAULT NULL,
  `resolution_money` double(255,0) DEFAULT NULL,
  `weight1` int(11) DEFAULT NULL,
  `weight2` int(11) DEFAULT NULL,
  `weight3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phone
-- ----------------------------
INSERT INTO `phone` VALUES ('三星', '2', '512M', '4G', '500万', '500万', '4.0英寸以下', 'SVGA', '2000', '1800', '500', '30', '20', '200', '200', '150', '200', '0', '0', '0');
INSERT INTO `phone` VALUES ('骁龙801', '1', '2G', '4G', '400万', '2100万', '6.0英寸以上', 'WVGA', '2000', '1720', '350', '150', '20', '100', '500', '300', '300', '0', '0', '0');
INSERT INTO `phone` VALUES ('intel', '2', '512M', '8G', '200万', '800万', '4.1-4.5英寸', 'WXGA', '2000', '1995', '450', '30', '35', '50', '300', '180', '500', '0', '0', '0');
INSERT INTO `phone` VALUES ('骁龙820', '4', '768M', '8G', '200万', '2100万', '4.1-4.5英寸', 'SVGA', '4000', '3415', '600', '50', '35', '50', '500', '180', '200', '0', '0', '0');
INSERT INTO `phone` VALUES ('联发科', '8', '1G', '16G', '1300万', '1600万', '4.0英寸以下', 'WXGA', '4000', '4000', '300', '100', '50', '400', '400', '150', '500', '0', '0', '0');
INSERT INTO `phone` VALUES ('intel', '4', '4G', '64G', '800万', '2100万', '5.6-5.9英寸', 'QVGA', '4000', '3530', '450', '300', '110', '300', '500', '270', '250', '0', '0', '0');
INSERT INTO `phone` VALUES ('Nvidia', '4', '1G', '64G', '200万', '500万', '5.0英寸', 'WVGA', '2100', '1790', '200', '100', '110', '50', '200', '230', '300', '0', '0', '0');
INSERT INTO `phone` VALUES ('联发科', '2', '4G', '64G', '1300万', '400万', '4.0英寸以下', 'QVGA', '2100', '1910', '300', '300', '110', '400', '100', '150', '250', '0', '0', '0');
INSERT INTO `phone` VALUES ('骁龙810', '1', '2G', '4G', '400万', '1600万', '5.1-5.4英寸', 'WXGA', '2100', '1820', '400', '150', '20', '100', '400', '250', '500', '0', '0', '0');

-- ----------------------------
-- Table structure for ram
-- ----------------------------
DROP TABLE IF EXISTS `ram`;
CREATE TABLE `ram` (
  `number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ram
-- ----------------------------
INSERT INTO `ram` VALUES ('1', '4G', '300.00');
INSERT INTO `ram` VALUES ('2', '3G', '200.00');
INSERT INTO `ram` VALUES ('3', '2G', '150.00');
INSERT INTO `ram` VALUES ('4', '1G', '100.00');
INSERT INTO `ram` VALUES ('5', '768M', '50.00');
INSERT INTO `ram` VALUES ('6', '512M', '30.00');

-- ----------------------------
-- Table structure for resolution
-- ----------------------------
DROP TABLE IF EXISTS `resolution`;
CREATE TABLE `resolution` (
  `number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resolution
-- ----------------------------
INSERT INTO `resolution` VALUES ('1', 'WXGA', '500.00');
INSERT INTO `resolution` VALUES ('2', 'QCIF', '400.00');
INSERT INTO `resolution` VALUES ('3', 'WVGA', '300.00');
INSERT INTO `resolution` VALUES ('4', 'QVGA', '250.00');
INSERT INTO `resolution` VALUES ('5', 'SVGA', '200.00');

-- ----------------------------
-- Table structure for rom
-- ----------------------------
DROP TABLE IF EXISTS `rom`;
CREATE TABLE `rom` (
  `number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rom
-- ----------------------------
INSERT INTO `rom` VALUES ('1', '128G', '160.00');
INSERT INTO `rom` VALUES ('2', '64G', '110.00');
INSERT INTO `rom` VALUES ('3', '32G', '80.00');
INSERT INTO `rom` VALUES ('4', '16G', '50.00');
INSERT INTO `rom` VALUES ('5', '8G', '35.00');
INSERT INTO `rom` VALUES ('6', '4G', '20.00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `name` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('chenwen', null, '0', '123', '123@qq.com');
INSERT INTO `user` VALUES ('chenwenyan', null, '0', '12345', '12345@qq.com');
INSERT INTO `user` VALUES ('chenwenyan', '1234', '0', '12345', '12345@qq.com');
INSERT INTO `user` VALUES ('chenwen', '123', '0', '12345', '12345@qq.com');
INSERT INTO `user` VALUES ('场', '123', '0', '12345', '12345@qq.com');
INSERT INTO `user` VALUES ('wang', '1234', '1', '12345', '12345@qq.com');
