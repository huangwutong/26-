/*
MySQL Data Transfer
Source Host: localhost
Source Database: hotel
Target Host: localhost
Target Database: hotel
Date: 2009-5-7 7:48:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for message
-- ----------------------------
CREATE TABLE `message` (
  `id` int(11) NOT NULL auto_increment,
  `topic` varchar(255) default NULL,
  `content` text,
  `dates` date default NULL,
  `type` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for order
-- ----------------------------
CREATE TABLE `order` (
  `id` int(11) NOT NULL auto_increment,
  `orderId` int(11) NOT NULL,
  `addressId` int(11) default NULL,
  `roomType` varchar(255) default NULL,
  `roomNum` int(11) default NULL,
  `inTime` date default NULL,
  `outTime` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Table structure for order_main
-- ----------------------------
CREATE TABLE `order_main` (
  `orderId` int(11) NOT NULL auto_increment,
  `Contatct` int(11) default NULL,
  `tel` varchar(255) default NULL,
  PRIMARY KEY  (`orderId`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Table structure for roommain
-- ----------------------------
CREATE TABLE `roommain` (
  `Id` int(255) NOT NULL auto_increment,
  `roomType` varchar(255) NOT NULL,
  `leftRoom` int(11) default NULL,
  `roomNum` int(11) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
CREATE TABLE `rooms` (
  `Id` int(11) NOT NULL auto_increment,
  `num` varchar(255) default NULL,
  `roomType` int(11) default NULL,
  `price` double default NULL,
  `img` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user` (
  `userId` int(11) NOT NULL auto_increment,
  `userName` varchar(255) NOT NULL,
  `sex` int(11) default NULL,
  `tel` varchar(255) default NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) default NULL,
  `regDate` date default NULL,
  `jifen` int(11) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `message` VALUES ('4', 'fnbh', '[Ljava.lang.String;@1e384de', '2009-05-06', 'news');
INSERT INTO `message` VALUES ('3', 'sdfgsdfg', 'dfghdfgh', '2009-04-08', 'news');
INSERT INTO `message` VALUES ('5', 'ghjfghj', 'ghjghjghkhgjkhjk,hjk,hj,khakjsdfnasbdfnbsdnbf snb sdb fjsgdfgsdfg', '2009-05-06', 'news');
INSERT INTO `roommain` VALUES ('1', '单人间', '20', '20');
INSERT INTO `roommain` VALUES ('2', '双人间', '20', '20');
INSERT INTO `roommain` VALUES ('3', '多人间', '10', '5');
INSERT INTO `roommain` VALUES ('4', '商务间', '10', '3');
INSERT INTO `roommain` VALUES ('5', '豪华间', '10', '5');
INSERT INTO `roommain` VALUES ('6', '总统套房', '5', '2');
INSERT INTO `user` VALUES ('1', '123456', '1', '5446565', '123456', '123@qq.com', 'accp400', '2009-04-16', null);
INSERT INTO `user` VALUES ('2', 'accp001', '1', 'sdfg', '123456', '123@qq.com', 'asd', '2009-04-16', null);
INSERT INTO `user` VALUES ('4', '654321', '1', '544656', '123', '383928', 'bb', '2009-04-16', '0');
INSERT INTO `user` VALUES ('5', 'aaa', '0', '544656', '123', '383928', '383928', '2009-04-16', '0');
INSERT INTO `user` VALUES ('6', 'longwu', '1', '544656', '123456', '123@qq', 'longwu', '2009-04-20', '0');
