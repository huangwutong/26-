-- MySQL dump 10.11
--
-- Host: localhost    Database: pctest
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt

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
-- Table structure for table `errornotepad`
--

DROP TABLE IF EXISTS `errornotepad`;
CREATE TABLE `errornotepad` (
  `field1` tinyint(4) default NULL,
  `ID` int(11) default NULL,
  `StuID` int(11) default NULL,
  `EID` int(11) default NULL,
  `ErrorCount` smallint(6) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `errornotepad`
--

LOCK TABLES `errornotepad` WRITE;
/*!40000 ALTER TABLE `errornotepad` DISABLE KEYS */;
/*!40000 ALTER TABLE `errornotepad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `errorpad`
--

DROP TABLE IF EXISTS `errorpad`;
CREATE TABLE `errorpad` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `stu_id` varchar(50) default NULL,
  `question_id` int(11) unsigned default NULL,
  `add_date` datetime default NULL,
  `errorcount` smallint(11) unsigned default '0',
  `test_id` int(11) unsigned default NULL,
  `mn_test_id` int(11) unsigned default NULL,
  `review_date` datetime default NULL,
  `sourcetype` tinyint(4) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=570 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `errorpad`
--

LOCK TABLES `errorpad` WRITE;
/*!40000 ALTER TABLE `errorpad` DISABLE KEYS */;
INSERT INTO `errorpad` VALUES (525,'stest',18,'2006-08-27 08:46:17',1,2,61,NULL,3),(526,'stest',19,'2006-08-27 08:46:17',1,2,61,NULL,3),(527,'stest',27,'2006-09-27 08:49:15',1,3,62,NULL,3),(528,'stest',28,'2006-09-27 08:49:15',1,3,62,NULL,3),(529,'stest',29,'2006-09-27 08:49:15',1,3,62,NULL,3),(530,'stest',30,'2006-09-27 08:49:15',1,3,62,NULL,3),(531,'stest',59,'2006-09-27 09:58:15',2,6,NULL,NULL,2),(532,'stest',60,'2006-09-27 09:58:15',2,6,NULL,NULL,2),(533,'stest',62,'2006-09-27 09:58:42',1,7,NULL,NULL,2),(534,'stest',63,'2006-09-27 09:58:42',1,7,NULL,NULL,2),(535,'stest',65,'2006-09-27 09:58:42',1,7,NULL,NULL,2),(536,'stest',66,'2006-09-27 09:58:42',1,7,NULL,NULL,2),(537,'stest',67,'2006-09-27 09:58:42',1,7,NULL,NULL,2),(538,'stest',68,'2006-09-27 09:58:42',1,7,NULL,NULL,2),(539,'stest',69,'2006-09-27 09:58:42',1,7,NULL,NULL,2),(540,'s001',63,'2006-09-27 10:02:15',1,7,NULL,NULL,2),(541,'s001',65,'2006-09-27 10:02:15',1,7,NULL,NULL,2),(542,'stest',51,'2007-01-23 14:52:22',1,6,NULL,NULL,2),(543,'stest',52,'2007-01-23 14:52:22',1,6,NULL,NULL,2),(544,'stest',53,'2007-01-23 14:52:22',1,6,NULL,NULL,2),(545,'stest',54,'2007-01-23 14:52:22',1,6,NULL,NULL,2),(546,'stest',55,'2007-01-23 14:52:22',1,6,NULL,NULL,2),(547,'stest',56,'2007-01-23 14:52:22',1,6,NULL,NULL,2),(548,'stest',57,'2007-01-23 14:52:22',1,6,NULL,NULL,2),(549,'stest',58,'2007-01-23 14:52:22',1,6,NULL,NULL,2),(550,'stest',49,'2007-01-23 15:01:45',2,0,0,NULL,1),(551,'stest',43,'2007-01-23 15:01:45',4,0,0,NULL,1),(552,'stest',48,'2007-01-23 15:01:45',4,0,0,NULL,1),(553,'stest',50,'2007-01-23 15:01:45',3,0,0,NULL,1),(554,'stest',42,'2007-01-23 15:01:45',2,0,0,NULL,1),(555,'stest',37,'2007-01-23 15:01:45',2,0,0,NULL,1),(556,'stest',33,'2007-01-23 15:01:45',4,0,0,NULL,1),(557,'stest',45,'2007-01-23 15:01:45',2,0,0,NULL,1),(558,'stest',44,'2007-01-23 15:01:45',3,0,0,NULL,1),(559,'stest',35,'2007-01-23 15:01:45',2,0,0,NULL,1),(560,'stest',39,'2007-01-23 15:06:10',3,0,0,NULL,1),(561,'stest',41,'2007-01-23 15:06:10',1,0,0,NULL,1),(562,'stest',36,'2007-01-23 15:06:10',1,0,0,NULL,1),(563,'stest',38,'2007-01-23 15:06:10',3,0,0,NULL,1),(564,'stest',32,'2007-01-23 15:06:10',3,0,0,NULL,1),(565,'stest',40,'2007-01-23 15:06:10',2,0,0,NULL,1),(566,'stest',31,'2007-01-23 15:06:10',3,0,0,NULL,1),(567,'stest',47,'2007-01-23 15:17:15',2,0,0,NULL,1),(568,'stest',46,'2007-01-23 15:17:15',2,0,0,NULL,1),(569,'stest',34,'2007-01-23 15:17:15',1,0,0,NULL,1);
/*!40000 ALTER TABLE `errorpad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `Name` varchar(30) NOT NULL default '',
  `note` char(3) NOT NULL default '',
  `ID` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES ('三级','c',3),('二级','b',2),('一级','a',1);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowpoint`
--

DROP TABLE IF EXISTS `knowpoint`;
CREATE TABLE `knowpoint` (
  `ID` int(6) unsigned NOT NULL auto_increment,
  `Name` varchar(100) default NULL,
  `note` varchar(4) default NULL,
  `subid` smallint(6) default NULL,
  `gradeid` tinyint(4) default NULL,
  `gradenote` char(3) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `knowpoint`
--

LOCK TABLES `knowpoint` WRITE;
/*!40000 ALTER TABLE `knowpoint` DISABLE KEYS */;
INSERT INTO `knowpoint` VALUES (48,'基础知识',NULL,51,NULL,'a'),(52,'计算机网络',NULL,51,NULL,'a'),(51,'excel',NULL,51,NULL,'a'),(50,'word',NULL,51,NULL,'a'),(49,'操作系统',NULL,51,NULL,'a');
/*!40000 ALTER TABLE `knowpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mn_history`
--

DROP TABLE IF EXISTS `mn_history`;
CREATE TABLE `mn_history` (
  `id` int(4) NOT NULL auto_increment,
  `stu_id` varchar(30) default NULL,
  `mn_test_id` int(11) default NULL,
  `totalmark` smallint(9) default NULL,
  `position` int(11) default NULL,
  `top10avg` float(9,3) default NULL,
  `top30avg` float(9,3) default NULL,
  `submark` varchar(255) default NULL,
  `test_date` datetime default NULL,
  `sub_num` tinyint(4) default NULL,
  `totalpeople` int(11) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `mn_history`
--

LOCK TABLES `mn_history` WRITE;
/*!40000 ALTER TABLE `mn_history` DISABLE KEYS */;
INSERT INTO `mn_history` VALUES (63,'stest',61,80,1,100.000,100.000,'计算机应用基础:80#','2006-08-27 00:00:00',1,1),(64,'stest',60,100,1,100.000,100.000,'计算机应用基础:100#','2006-07-27 00:00:00',1,1),(65,'stest',62,60,1,60.000,60.000,'计算机应用基础:60#','2006-09-27 00:00:00',1,1);
/*!40000 ALTER TABLE `mn_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mn_scores`
--

DROP TABLE IF EXISTS `mn_scores`;
CREATE TABLE `mn_scores` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `mn_test_id` int(11) default NULL,
  `score` float(9,3) default NULL,
  `stu_id` varchar(30) default NULL,
  `tea_id` int(11) default NULL,
  `test_date` datetime default NULL,
  `sub_id` int(11) default NULL,
  `test_id` int(11) default NULL,
  `test_rs` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ID` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=327 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `mn_scores`
--

LOCK TABLES `mn_scores` WRITE;
/*!40000 ALTER TABLE `mn_scores` DISABLE KEYS */;
INSERT INTO `mn_scores` VALUES (326,62,60.000,'stest',1,'2006-09-27 00:00:00',51,3,'B,B,B,B,A,D,D,B,C,C,#T,T,T,T,T,T,F,F,F,F,#10,10,10,10,10,10,0,0,0,0,'),(325,60,100.000,'stest',1,'2006-07-27 00:00:00',51,1,'B,B,B,B,A,D,A,A,A,B,#T,T,T,T,T,T,T,T,T,T,#10,10,10,10,10,10,10,10,10,10,'),(324,61,80.000,'stest',1,'2006-08-27 00:00:00',51,2,'B,B,B,B,A,D,A,C,B,B,#T,T,T,T,T,T,T,F,F,T,#10,10,10,10,10,10,10,0,0,10,');
/*!40000 ALTER TABLE `mn_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mn_test`
--

DROP TABLE IF EXISTS `mn_test`;
CREATE TABLE `mn_test` (
  `id` int(4) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `grade_note` char(3) default NULL,
  `begin_date` date default NULL,
  `end_date` date default NULL,
  `test_num` tinyint(4) default NULL,
  `test_paper` varchar(255) default NULL,
  `status` tinyint(4) default NULL,
  `subs` varchar(255) default NULL,
  `sub_num` tinyint(4) default NULL,
  `testpeople` int(11) default '0',
  `mntotalmark` smallint(6) unsigned default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `mn_test`
--

LOCK TABLES `mn_test` WRITE;
/*!40000 ALTER TABLE `mn_test` DISABLE KEYS */;
INSERT INTO `mn_test` VALUES (60,'7月　正式考试','a','2006-07-01','2006-07-31',1,'1',2,'51',1,1,100),(61,'8月　正式考试','a','2006-08-01','2006-08-31',1,'2',2,'51',1,1,100),(62,'9月　正式考试','a','2006-09-01','2006-09-30',1,'3',2,'51',1,1,100);
/*!40000 ALTER TABLE `mn_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `QuestID` varchar(12) default NULL,
  `QuestText` text,
  `Tip` text,
  `Mark` float(9,3) default NULL,
  `Answer` text,
  `QuestExplain` text,
  `TeacherID` int(6) unsigned default NULL,
  `PubDate` datetime default NULL,
  `Source` tinyint(4) unsigned default '0',
  `QuestType` tinyint(4) default NULL,
  `SubjectID` smallint(1) default NULL,
  `GID` tinyint(4) default NULL,
  `PreHard` char(1) default NULL,
  `PostHard` char(1) default NULL,
  `UsedCount` int(11) unsigned default '0',
  `CorrectCount` int(11) unsigned default '0',
  `KnowPointID1` smallint(4) default NULL,
  `KnowPointID2` smallint(4) default NULL,
  `KnowPointID3` smallint(6) default NULL,
  `gradenote` char(3) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'','十六进制数7A对应的八进制数为（B ）。<BR><input type=\"radio\" name=\"radio1\"  value=\"A\">A.144 <BR><input type=\"radio\" name=\"radio1\"  value=\"B\">B.122&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio1\"  value=\"C\">C.136 <BR><input type=\"radio\" name=\"radio1\"  value=\"D\">D.372<BR>','<BR>提示１<BR>',10.000,'B',NULL,1,'2006-08-27 08:44:51',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(2,'','计算机中,机器数的正、负号用(&nbsp;&nbsp; B )表示<BR><input type=\"radio\" name=\"radio2\"  value=\"A\">A.\"+\"和\"-\"<BR><input type=\"radio\" name=\"radio2\"  value=\"B\">B.\"0\"和\"1\"<BR><input type=\"radio\" name=\"radio2\"  value=\"C\">C.专用的指示器<BR><input type=\"radio\" name=\"radio2\"  value=\"D\">D.不能表示给定<BR>','<BR>提示2<BR>',10.000,'B',NULL,1,'2006-08-27 08:44:51',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(3,'','二进制数00111001，若它为ASCII码时，它表示的十进制数为（ B）。<BR><input type=\"radio\" name=\"radio3\"  value=\"A\">A.9<BR><input type=\"radio\" name=\"radio3\"  value=\"B\">B.57<BR><input type=\"radio\" name=\"radio3\"  value=\"C\">C.39<BR><input type=\"radio\" name=\"radio3\"  value=\"D\">D.8<BR>','<BR>提示3<BR>',10.000,'B',NULL,1,'2006-08-27 08:44:51',3,1,51,NULL,'B',NULL,1,1,48,-1,-1,'a'),(4,'','运算器的主要功能是进行（ B）运算。<BR><input type=\"radio\" name=\"radio4\"  value=\"A\">A.逻辑<BR><input type=\"radio\" name=\"radio4\"  value=\"B\">B.算术与逻辑<BR><input type=\"radio\" name=\"radio4\"  value=\"C\">C.算术<BR><input type=\"radio\" name=\"radio4\"  value=\"D\">D.数值</P>\r\n<P>','<BR>提示4<BR>',10.000,'B',NULL,1,'2006-08-27 08:44:51',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(5,'','一般情况下，在断电后，硬盘中的数据会（ A&nbsp; ）。<BR><input type=\"radio\" name=\"radio5\"  value=\"A\">A.不丢失<BR><input type=\"radio\" name=\"radio5\"  value=\"B\">B.完全丢失<BR><input type=\"radio\" name=\"radio5\"  value=\"C\">C.小部分丢失<BR><input type=\"radio\" name=\"radio5\"  value=\"D\">D.大部分丢失<BR>','<BR>提示5<BR>',10.000,'A',NULL,1,'2006-08-27 08:44:51',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(6,'','输入设备是（ D&nbsp; ）。<BR><input type=\"radio\" name=\"radio6\"  value=\"A\">A.从磁盘上读取信息的电子线路<BR><input type=\"radio\" name=\"radio6\"  value=\"B\">B.磁盘文件等<BR><input type=\"radio\" name=\"radio6\"  value=\"C\">C.键盘、鼠标和打印机等<BR><input type=\"radio\" name=\"radio6\"  value=\"D\">D.从计算机外部获取信息的设备<BR>','<BR>提示6<BR>',10.000,'D',NULL,1,'2006-08-27 08:44:51',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(7,'','没有（&nbsp; A ）的计算机被称为\"裸机\"。<BR><input type=\"radio\" name=\"radio7\"  value=\"A\">A.软件<BR><input type=\"radio\" name=\"radio7\"  value=\"B\">B.硬件<BR><input type=\"radio\" name=\"radio7\"  value=\"C\">C.外围设备<BR><input type=\"radio\" name=\"radio7\"  value=\"D\">D.CPU<BR>','<BR>提示7<BR>',10.000,'A',NULL,1,'2006-08-27 08:44:51',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(8,'','在DOS系统中，打印机的设备名是（ A ）。<BR><input type=\"radio\" name=\"radio8\"  value=\"A\">A.PRN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio8\"  value=\"B\">B.CON <BR><input type=\"radio\" name=\"radio8\"  value=\"C\">C.AUX&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio8\"  value=\"D\">D.COM1<BR>','<BR>提示8<BR>',10.000,'A',NULL,1,'2006-08-27 08:44:51',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(9,'','当提示符为A:DOSWCGUSER时，键入CD命令后，当前目录将是( A)。<BR><input type=\"radio\" name=\"radio9\"  value=\"A\">A.根目录&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio9\"  value=\"B\">B.DOS子目录<BR><input type=\"radio\" name=\"radio9\"  value=\"C\">C.WCG子目录&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio9\"  value=\"D\">D.USER子目录<BR>','<BR>提示9<BR>',10.000,'A',NULL,1,'2006-08-27 08:44:51',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(10,'','在A&gt;下，将B：EX1的文件更改文件名为EX2的命令是( B )。<BR><input type=\"radio\" name=\"radio10\"  value=\"A\">A.A&gt;REN&nbsp; EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio10\"  value=\"B\">B.A&gt;REN&nbsp; B:EX1 B:EX2<BR><input type=\"radio\" name=\"radio10\"  value=\"C\">C.A&gt;REN B:EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio10\"  value=\"D\">D.A&gt;REN&nbsp; B：EX2&nbsp; EX1<BR>','<BR>提示10</P>',10.000,'B',NULL,1,'2006-08-27 08:44:51',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(11,'','十六进制数7A对应的八进制数为（B ）。<BR><input type=\"radio\" name=\"radio11\"  value=\"A\">A.144 <BR><input type=\"radio\" name=\"radio11\"  value=\"B\">B.122&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio11\"  value=\"C\">C.136 <BR><input type=\"radio\" name=\"radio11\"  value=\"D\">D.372<BR>','<BR>提示１<BR>',10.000,'B',NULL,1,'2006-08-27 08:45:15',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(12,'','计算机中,机器数的正、负号用(&nbsp;&nbsp; B )表示<BR><input type=\"radio\" name=\"radio12\"  value=\"A\">A.\"+\"和\"-\"<BR><input type=\"radio\" name=\"radio12\"  value=\"B\">B.\"0\"和\"1\"<BR><input type=\"radio\" name=\"radio12\"  value=\"C\">C.专用的指示器<BR><input type=\"radio\" name=\"radio12\"  value=\"D\">D.不能表示给定<BR>','<BR>提示2<BR>',10.000,'B',NULL,1,'2006-08-27 08:45:15',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(13,'','二进制数00111001，若它为ASCII码时，它表示的十进制数为（ B）。<BR><input type=\"radio\" name=\"radio13\"  value=\"A\">A.9<BR><input type=\"radio\" name=\"radio13\"  value=\"B\">B.57<BR><input type=\"radio\" name=\"radio13\"  value=\"C\">C.39<BR><input type=\"radio\" name=\"radio13\"  value=\"D\">D.8<BR>','<BR>提示3<BR>',10.000,'B',NULL,1,'2006-08-27 08:45:15',3,1,51,NULL,'B',NULL,1,1,48,-1,-1,'a'),(14,'','运算器的主要功能是进行（ B）运算。<BR><input type=\"radio\" name=\"radio14\"  value=\"A\">A.逻辑<BR><input type=\"radio\" name=\"radio14\"  value=\"B\">B.算术与逻辑<BR><input type=\"radio\" name=\"radio14\"  value=\"C\">C.算术<BR><input type=\"radio\" name=\"radio14\"  value=\"D\">D.数值</P>\r\n<P>','<BR>提示4<BR>',10.000,'B',NULL,1,'2006-08-27 08:45:15',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(15,'','一般情况下，在断电后，硬盘中的数据会（ A&nbsp; ）。<BR><input type=\"radio\" name=\"radio15\"  value=\"A\">A.不丢失<BR><input type=\"radio\" name=\"radio15\"  value=\"B\">B.完全丢失<BR><input type=\"radio\" name=\"radio15\"  value=\"C\">C.小部分丢失<BR><input type=\"radio\" name=\"radio15\"  value=\"D\">D.大部分丢失<BR>','<BR>提示5<BR>',10.000,'A',NULL,1,'2006-08-27 08:45:15',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(16,'','输入设备是（ D&nbsp; ）。<BR><input type=\"radio\" name=\"radio16\"  value=\"A\">A.从磁盘上读取信息的电子线路<BR><input type=\"radio\" name=\"radio16\"  value=\"B\">B.磁盘文件等<BR><input type=\"radio\" name=\"radio16\"  value=\"C\">C.键盘、鼠标和打印机等<BR><input type=\"radio\" name=\"radio16\"  value=\"D\">D.从计算机外部获取信息的设备<BR>','<BR>提示6<BR>',10.000,'D',NULL,1,'2006-08-27 08:45:15',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(17,'','没有（&nbsp; A ）的计算机被称为\"裸机\"。<BR><input type=\"radio\" name=\"radio17\"  value=\"A\">A.软件<BR><input type=\"radio\" name=\"radio17\"  value=\"B\">B.硬件<BR><input type=\"radio\" name=\"radio17\"  value=\"C\">C.外围设备<BR><input type=\"radio\" name=\"radio17\"  value=\"D\">D.CPU<BR>','<BR>提示7<BR>',10.000,'A',NULL,1,'2006-08-27 08:45:15',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(18,'','在DOS系统中，打印机的设备名是（ A ）。<BR><input type=\"radio\" name=\"radio18\"  value=\"A\">A.PRN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio18\"  value=\"B\">B.CON <BR><input type=\"radio\" name=\"radio18\"  value=\"C\">C.AUX&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio18\"  value=\"D\">D.COM1<BR>','<BR>提示8<BR>',10.000,'A',NULL,1,'2006-08-27 08:45:15',3,1,51,NULL,'A',NULL,1,0,48,-1,-1,'a'),(19,'','当提示符为A:DOSWCGUSER时，键入CD命令后，当前目录将是( A)。<BR><input type=\"radio\" name=\"radio19\"  value=\"A\">A.根目录&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio19\"  value=\"B\">B.DOS子目录<BR><input type=\"radio\" name=\"radio19\"  value=\"C\">C.WCG子目录&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio19\"  value=\"D\">D.USER子目录<BR>','<BR>提示9<BR>',10.000,'A',NULL,1,'2006-08-27 08:45:15',3,1,51,NULL,'A',NULL,1,0,48,-1,-1,'a'),(20,'','在A&gt;下，将B：EX1的文件更改文件名为EX2的命令是( B )。<BR><input type=\"radio\" name=\"radio20\"  value=\"A\">A.A&gt;REN&nbsp; EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio20\"  value=\"B\">B.A&gt;REN&nbsp; B:EX1 B:EX2<BR><input type=\"radio\" name=\"radio20\"  value=\"C\">C.A&gt;REN B:EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio20\"  value=\"D\">D.A&gt;REN&nbsp; B：EX2&nbsp; EX1<BR>','<BR>提示10</P>',10.000,'B',NULL,1,'2006-08-27 08:45:15',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(21,'','十六进制数7A对应的八进制数为（B ）。<BR><input type=\"radio\" name=\"radio21\"  value=\"A\">A.144 <BR><input type=\"radio\" name=\"radio21\"  value=\"B\">B.122&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio21\"  value=\"C\">C.136 <BR><input type=\"radio\" name=\"radio21\"  value=\"D\">D.372<BR>','<BR>提示１<BR>',10.000,'B',NULL,1,'2006-08-27 08:45:35',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(22,'','计算机中,机器数的正、负号用(&nbsp;&nbsp; B )表示<BR><input type=\"radio\" name=\"radio22\"  value=\"A\">A.\"+\"和\"-\"<BR><input type=\"radio\" name=\"radio22\"  value=\"B\">B.\"0\"和\"1\"<BR><input type=\"radio\" name=\"radio22\"  value=\"C\">C.专用的指示器<BR><input type=\"radio\" name=\"radio22\"  value=\"D\">D.不能表示给定<BR>','<BR>提示2<BR>',10.000,'B',NULL,1,'2006-08-27 08:45:35',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(23,'','二进制数00111001，若它为ASCII码时，它表示的十进制数为（ B）。<BR><input type=\"radio\" name=\"radio23\"  value=\"A\">A.9<BR><input type=\"radio\" name=\"radio23\"  value=\"B\">B.57<BR><input type=\"radio\" name=\"radio23\"  value=\"C\">C.39<BR><input type=\"radio\" name=\"radio23\"  value=\"D\">D.8<BR>','<BR>提示3<BR>',10.000,'B',NULL,1,'2006-08-27 08:45:35',3,1,51,NULL,'B',NULL,1,1,48,-1,-1,'a'),(24,'','运算器的主要功能是进行（ B）运算。<BR><input type=\"radio\" name=\"radio24\"  value=\"A\">A.逻辑<BR><input type=\"radio\" name=\"radio24\"  value=\"B\">B.算术与逻辑<BR><input type=\"radio\" name=\"radio24\"  value=\"C\">C.算术<BR><input type=\"radio\" name=\"radio24\"  value=\"D\">D.数值</P>\r\n<P>','<BR>提示4<BR>',10.000,'B',NULL,1,'2006-08-27 08:45:35',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(25,'','一般情况下，在断电后，硬盘中的数据会（ A&nbsp; ）。<BR><input type=\"radio\" name=\"radio25\"  value=\"A\">A.不丢失<BR><input type=\"radio\" name=\"radio25\"  value=\"B\">B.完全丢失<BR><input type=\"radio\" name=\"radio25\"  value=\"C\">C.小部分丢失<BR><input type=\"radio\" name=\"radio25\"  value=\"D\">D.大部分丢失<BR>','<BR>提示5<BR>',10.000,'A',NULL,1,'2006-08-27 08:45:35',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(26,'','输入设备是（ D&nbsp; ）。<BR><input type=\"radio\" name=\"radio26\"  value=\"A\">A.从磁盘上读取信息的电子线路<BR><input type=\"radio\" name=\"radio26\"  value=\"B\">B.磁盘文件等<BR><input type=\"radio\" name=\"radio26\"  value=\"C\">C.键盘、鼠标和打印机等<BR><input type=\"radio\" name=\"radio26\"  value=\"D\">D.从计算机外部获取信息的设备<BR>','<BR>提示6<BR>',10.000,'D',NULL,1,'2006-08-27 08:45:35',3,1,51,NULL,'A',NULL,1,1,48,-1,-1,'a'),(27,'','没有（&nbsp; A ）的计算机被称为\"裸机\"。<BR><input type=\"radio\" name=\"radio27\"  value=\"A\">A.软件<BR><input type=\"radio\" name=\"radio27\"  value=\"B\">B.硬件<BR><input type=\"radio\" name=\"radio27\"  value=\"C\">C.外围设备<BR><input type=\"radio\" name=\"radio27\"  value=\"D\">D.CPU<BR>','<BR>提示7<BR>',10.000,'A',NULL,1,'2006-08-27 08:45:35',3,1,51,NULL,'A',NULL,1,0,48,-1,-1,'a'),(28,'','在DOS系统中，打印机的设备名是（ A ）。<BR><input type=\"radio\" name=\"radio28\"  value=\"A\">A.PRN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio28\"  value=\"B\">B.CON <BR><input type=\"radio\" name=\"radio28\"  value=\"C\">C.AUX&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio28\"  value=\"D\">D.COM1<BR>','<BR>提示8<BR>',10.000,'A',NULL,1,'2006-08-27 08:45:35',3,1,51,NULL,'A',NULL,1,0,48,-1,-1,'a'),(29,'','当提示符为A:DOSWCGUSER时，键入CD命令后，当前目录将是( A)。<BR><input type=\"radio\" name=\"radio29\"  value=\"A\">A.根目录&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio29\"  value=\"B\">B.DOS子目录<BR><input type=\"radio\" name=\"radio29\"  value=\"C\">C.WCG子目录&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio29\"  value=\"D\">D.USER子目录<BR>','<BR>提示9<BR>',10.000,'A',NULL,1,'2006-08-27 08:45:35',3,1,51,NULL,'A',NULL,1,0,48,-1,-1,'a'),(30,'','在A&gt;下，将B：EX1的文件更改文件名为EX2的命令是( B )。<BR><input type=\"radio\" name=\"radio30\"  value=\"A\">A.A&gt;REN&nbsp; EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio30\"  value=\"B\">B.A&gt;REN&nbsp; B:EX1 B:EX2<BR><input type=\"radio\" name=\"radio30\"  value=\"C\">C.A&gt;REN B:EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio30\"  value=\"D\">D.A&gt;REN&nbsp; B：EX2&nbsp; EX1<BR>','<BR>提示10</P>',10.000,'B',NULL,1,'2006-08-27 08:45:35',3,1,51,NULL,'A',NULL,1,0,48,-1,-1,'a'),(31,'','十六进制数7A对应的八进制数为（B ）。<BR><input type=\"radio\" name=\"radio31\"  value=\"A\">A.144 <BR><input type=\"radio\" name=\"radio31\"  value=\"B\">B.122&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio31\"  value=\"C\">C.136 <BR><input type=\"radio\" name=\"radio31\"  value=\"D\">D.372<BR>','<BR>提示１<BR>',10.000,'B',NULL,1,'2006-09-27 09:45:50',1,1,51,NULL,'A',NULL,3,0,48,49,52,'a'),(32,'','计算机中,机器数的正、负号用(&nbsp;&nbsp; B )表示<BR><input type=\"radio\" name=\"radio32\"  value=\"A\">A.\"+\"和\"-\"<BR><input type=\"radio\" name=\"radio32\"  value=\"B\">B.\"0\"和\"1\"<BR><input type=\"radio\" name=\"radio32\"  value=\"C\">C.专用的指示器<BR><input type=\"radio\" name=\"radio32\"  value=\"D\">D.不能表示给定<BR>','<BR>提示2<BR>',10.000,'B',NULL,1,'2006-09-27 09:45:50',1,1,51,NULL,'A',NULL,3,0,48,49,52,'a'),(33,'','二进制数00111001，若它为ASCII码时，它表示的十进制数为（ B）。<BR><input type=\"radio\" name=\"radio33\"  value=\"A\">A.9<BR><input type=\"radio\" name=\"radio33\"  value=\"B\">B.57<BR><input type=\"radio\" name=\"radio33\"  value=\"C\">C.39<BR><input type=\"radio\" name=\"radio33\"  value=\"D\">D.8<BR>','<BR>提示3<BR>',10.000,'B',NULL,1,'2006-09-27 09:45:50',1,1,51,NULL,'B',NULL,4,0,48,49,52,'a'),(34,'','运算器的主要功能是进行（ B）运算。<BR><input type=\"radio\" name=\"radio34\"  value=\"A\">A.逻辑<BR><input type=\"radio\" name=\"radio34\"  value=\"B\">B.算术与逻辑<BR><input type=\"radio\" name=\"radio34\"  value=\"C\">C.算术<BR><input type=\"radio\" name=\"radio34\"  value=\"D\">D.数值</P>\r\n<P>','<BR>提示4<BR>',10.000,'B',NULL,1,'2006-09-27 09:45:50',1,1,51,NULL,'A',NULL,2,1,48,49,52,'a'),(35,'','一般情况下，在断电后，硬盘中的数据会（ A&nbsp; ）。<BR><input type=\"radio\" name=\"radio35\"  value=\"A\">A.不丢失<BR><input type=\"radio\" name=\"radio35\"  value=\"B\">B.完全丢失<BR><input type=\"radio\" name=\"radio35\"  value=\"C\">C.小部分丢失<BR><input type=\"radio\" name=\"radio35\"  value=\"D\">D.大部分丢失<BR>','<BR>提示5<BR>',10.000,'A',NULL,1,'2006-09-27 09:45:50',1,1,51,NULL,'A',NULL,2,0,48,49,52,'a'),(36,'','输入设备是（ D&nbsp; ）。<BR><input type=\"radio\" name=\"radio36\"  value=\"A\">A.从磁盘上读取信息的电子线路<BR><input type=\"radio\" name=\"radio36\"  value=\"B\">B.磁盘文件等<BR><input type=\"radio\" name=\"radio36\"  value=\"C\">C.键盘、鼠标和打印机等<BR><input type=\"radio\" name=\"radio36\"  value=\"D\">D.从计算机外部获取信息的设备<BR>','<BR>提示6<BR>',10.000,'D',NULL,1,'2006-09-27 09:45:50',1,1,51,NULL,'A',NULL,2,1,48,49,52,'a'),(37,'','没有（&nbsp; A ）的计算机被称为\"裸机\"。<BR><input type=\"radio\" name=\"radio37\"  value=\"A\">A.软件<BR><input type=\"radio\" name=\"radio37\"  value=\"B\">B.硬件<BR><input type=\"radio\" name=\"radio37\"  value=\"C\">C.外围设备<BR><input type=\"radio\" name=\"radio37\"  value=\"D\">D.CPU<BR>','<BR>提示7<BR>',10.000,'A',NULL,1,'2006-09-27 09:45:50',1,1,51,NULL,'A',NULL,2,0,48,49,52,'a'),(38,'','在DOS系统中，打印机的设备名是（ A ）。<BR><input type=\"radio\" name=\"radio38\"  value=\"A\">A.PRN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio38\"  value=\"B\">B.CON <BR><input type=\"radio\" name=\"radio38\"  value=\"C\">C.AUX&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio38\"  value=\"D\">D.COM1<BR>','<BR>提示8<BR>',10.000,'A',NULL,1,'2006-09-27 09:45:50',1,1,51,NULL,'A',NULL,3,0,48,49,52,'a'),(39,'','当提示符为A:DOSWCGUSER时，键入CD命令后，当前目录将是( A)。<BR><input type=\"radio\" name=\"radio39\"  value=\"A\">A.根目录&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio39\"  value=\"B\">B.DOS子目录<BR><input type=\"radio\" name=\"radio39\"  value=\"C\">C.WCG子目录&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio39\"  value=\"D\">D.USER子目录<BR>','<BR>提示9<BR>',10.000,'A',NULL,1,'2006-09-27 09:45:50',1,1,51,NULL,'A',NULL,3,0,48,49,52,'a'),(40,'','在A&gt;下，将B：EX1的文件更改文件名为EX2的命令是( B )。<BR><input type=\"radio\" name=\"radio40\"  value=\"A\">A.A&gt;REN&nbsp; EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio40\"  value=\"B\">B.A&gt;REN&nbsp; B:EX1 B:EX2<BR><input type=\"radio\" name=\"radio40\"  value=\"C\">C.A&gt;REN B:EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio40\"  value=\"D\">D.A&gt;REN&nbsp; B：EX2&nbsp; EX1<BR>','<BR>提示10</P>',10.000,'B',NULL,1,'2006-09-27 09:45:50',1,1,51,NULL,'A',NULL,2,0,48,49,52,'a'),(41,'','十六进制数7A对应的八进制数为（B ）。<BR><input type=\"radio\" name=\"radio41\"  value=\"A\">A.144 <BR><input type=\"radio\" name=\"radio41\"  value=\"B\">B.122&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio41\"  value=\"C\">C.136 <BR><input type=\"radio\" name=\"radio41\"  value=\"D\">D.372<BR>','<BR>提示１<BR>',10.000,'B',NULL,1,'2006-09-27 09:46:16',1,1,51,NULL,'A',NULL,1,0,48,49,52,'a'),(42,'','计算机中,机器数的正、负号用(&nbsp;&nbsp; B )表示<BR><input type=\"radio\" name=\"radio42\"  value=\"A\">A.\"+\"和\"-\"<BR><input type=\"radio\" name=\"radio42\"  value=\"B\">B.\"0\"和\"1\"<BR><input type=\"radio\" name=\"radio42\"  value=\"C\">C.专用的指示器<BR><input type=\"radio\" name=\"radio42\"  value=\"D\">D.不能表示给定<BR>','<BR>提示2<BR>',10.000,'B',NULL,1,'2006-09-27 09:46:16',1,1,51,NULL,'A',NULL,3,1,48,49,52,'a'),(43,'','二进制数00111001，若它为ASCII码时，它表示的十进制数为（ B）。<BR><input type=\"radio\" name=\"radio43\"  value=\"A\">A.9<BR><input type=\"radio\" name=\"radio43\"  value=\"B\">B.57<BR><input type=\"radio\" name=\"radio43\"  value=\"C\">C.39<BR><input type=\"radio\" name=\"radio43\"  value=\"D\">D.8<BR>','<BR>提示3<BR>',10.000,'B',NULL,1,'2006-09-27 09:46:16',1,1,51,NULL,'B',NULL,4,0,48,49,52,'a'),(44,'','运算器的主要功能是进行（ B）运算。<BR><input type=\"radio\" name=\"radio44\"  value=\"A\">A.逻辑<BR><input type=\"radio\" name=\"radio44\"  value=\"B\">B.算术与逻辑<BR><input type=\"radio\" name=\"radio44\"  value=\"C\">C.算术<BR><input type=\"radio\" name=\"radio44\"  value=\"D\">D.数值</P>\r\n<P>','<BR>提示4<BR>',10.000,'B',NULL,1,'2006-09-27 09:46:16',1,1,51,NULL,'A',NULL,3,0,48,49,52,'a'),(45,'','一般情况下，在断电后，硬盘中的数据会（ A&nbsp; ）。<BR><input type=\"radio\" name=\"radio45\"  value=\"A\">A.不丢失<BR><input type=\"radio\" name=\"radio45\"  value=\"B\">B.完全丢失<BR><input type=\"radio\" name=\"radio45\"  value=\"C\">C.小部分丢失<BR><input type=\"radio\" name=\"radio45\"  value=\"D\">D.大部分丢失<BR>','<BR>提示5<BR>',10.000,'A',NULL,1,'2006-09-27 09:46:16',1,1,51,NULL,'A',NULL,2,0,48,49,52,'a'),(46,'','输入设备是（ D&nbsp; ）。<BR><input type=\"radio\" name=\"radio46\"  value=\"A\">A.从磁盘上读取信息的电子线路<BR><input type=\"radio\" name=\"radio46\"  value=\"B\">B.磁盘文件等<BR><input type=\"radio\" name=\"radio46\"  value=\"C\">C.键盘、鼠标和打印机等<BR><input type=\"radio\" name=\"radio46\"  value=\"D\">D.从计算机外部获取信息的设备<BR>','<BR>提示6<BR>',10.000,'D',NULL,1,'2006-09-27 09:46:16',1,1,51,NULL,'A',NULL,3,1,48,49,52,'a'),(47,'','没有（&nbsp; A ）的计算机被称为\"裸机\"。<BR><input type=\"radio\" name=\"radio47\"  value=\"A\">A.软件<BR><input type=\"radio\" name=\"radio47\"  value=\"B\">B.硬件<BR><input type=\"radio\" name=\"radio47\"  value=\"C\">C.外围设备<BR><input type=\"radio\" name=\"radio47\"  value=\"D\">D.CPU<BR>','<BR>提示7<BR>',10.000,'A',NULL,1,'2006-09-27 09:46:16',1,1,51,NULL,'A',NULL,3,1,48,49,52,'a'),(48,'','在DOS系统中，打印机的设备名是（ A ）。<BR><input type=\"radio\" name=\"radio48\"  value=\"A\">A.PRN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio48\"  value=\"B\">B.CON <BR><input type=\"radio\" name=\"radio48\"  value=\"C\">C.AUX&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio48\"  value=\"D\">D.COM1<BR>','<BR>提示8<BR>',10.000,'A',NULL,1,'2006-09-27 09:46:16',1,1,51,NULL,'A',NULL,4,0,48,49,52,'a'),(49,'','当提示符为A:DOSWCGUSER时，键入CD命令后，当前目录将是( A)。<BR><input type=\"radio\" name=\"radio49\"  value=\"A\">A.根目录&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio49\"  value=\"B\">B.DOS子目录<BR><input type=\"radio\" name=\"radio49\"  value=\"C\">C.WCG子目录&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio49\"  value=\"D\">D.USER子目录<BR>','<BR>提示9<BR>',10.000,'A',NULL,1,'2006-09-27 09:46:16',1,1,51,NULL,'A',NULL,3,1,48,49,52,'a'),(50,'','在A&gt;下，将B：EX1的文件更改文件名为EX2的命令是( B )。<BR><input type=\"radio\" name=\"radio50\"  value=\"A\">A.A&gt;REN&nbsp; EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio50\"  value=\"B\">B.A&gt;REN&nbsp; B:EX1 B:EX2<BR><input type=\"radio\" name=\"radio50\"  value=\"C\">C.A&gt;REN B:EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio50\"  value=\"D\">D.A&gt;REN&nbsp; B：EX2&nbsp; EX1<BR>','<BR>提示10</P>',10.000,'B',NULL,1,'2006-09-27 09:46:16',1,1,51,NULL,'A',NULL,3,0,48,49,52,'a'),(51,'','十六进制数7A对应的八进制数为（B ）。<BR><input type=\"radio\" name=\"radio51\"  value=\"A\">A.144 <BR><input type=\"radio\" name=\"radio51\"  value=\"B\">B.122&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio51\"  value=\"C\">C.136 <BR><input type=\"radio\" name=\"radio51\"  value=\"D\">D.372<BR>','<BR>提示１<BR>',10.000,'B',NULL,1,'2006-09-27 09:46:45',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(52,'','计算机中,机器数的正、负号用(&nbsp;&nbsp; B )表示<BR><input type=\"radio\" name=\"radio52\"  value=\"A\">A.\"+\"和\"-\"<BR><input type=\"radio\" name=\"radio52\"  value=\"B\">B.\"0\"和\"1\"<BR><input type=\"radio\" name=\"radio52\"  value=\"C\">C.专用的指示器<BR><input type=\"radio\" name=\"radio52\"  value=\"D\">D.不能表示给定<BR>','<BR>提示2<BR>',10.000,'B',NULL,1,'2006-09-27 09:46:45',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(53,'','二进制数00111001，若它为ASCII码时，它表示的十进制数为（ B）。<BR><input type=\"radio\" name=\"radio53\"  value=\"A\">A.9<BR><input type=\"radio\" name=\"radio53\"  value=\"B\">B.57<BR><input type=\"radio\" name=\"radio53\"  value=\"C\">C.39<BR><input type=\"radio\" name=\"radio53\"  value=\"D\">D.8<BR>','<BR>提示3<BR>',10.000,'B',NULL,1,'2006-09-27 09:46:45',2,1,51,NULL,'B',NULL,0,0,48,49,52,'a'),(54,'','运算器的主要功能是进行（ B）运算。<BR><input type=\"radio\" name=\"radio54\"  value=\"A\">A.逻辑<BR><input type=\"radio\" name=\"radio54\"  value=\"B\">B.算术与逻辑<BR><input type=\"radio\" name=\"radio54\"  value=\"C\">C.算术<BR><input type=\"radio\" name=\"radio54\"  value=\"D\">D.数值</P>\r\n<P>','<BR>提示4<BR>',10.000,'B',NULL,1,'2006-09-27 09:46:45',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(55,'','一般情况下，在断电后，硬盘中的数据会（ A&nbsp; ）。<BR><input type=\"radio\" name=\"radio55\"  value=\"A\">A.不丢失<BR><input type=\"radio\" name=\"radio55\"  value=\"B\">B.完全丢失<BR><input type=\"radio\" name=\"radio55\"  value=\"C\">C.小部分丢失<BR><input type=\"radio\" name=\"radio55\"  value=\"D\">D.大部分丢失<BR>','<BR>提示5<BR>',10.000,'A',NULL,1,'2006-09-27 09:46:45',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(56,'','输入设备是（ D&nbsp; ）。<BR><input type=\"radio\" name=\"radio56\"  value=\"A\">A.从磁盘上读取信息的电子线路<BR><input type=\"radio\" name=\"radio56\"  value=\"B\">B.磁盘文件等<BR><input type=\"radio\" name=\"radio56\"  value=\"C\">C.键盘、鼠标和打印机等<BR><input type=\"radio\" name=\"radio56\"  value=\"D\">D.从计算机外部获取信息的设备<BR>','<BR>提示6<BR>',10.000,'D',NULL,1,'2006-09-27 09:46:45',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(57,'','没有（&nbsp; A ）的计算机被称为\"裸机\"。<BR><input type=\"radio\" name=\"radio57\"  value=\"A\">A.软件<BR><input type=\"radio\" name=\"radio57\"  value=\"B\">B.硬件<BR><input type=\"radio\" name=\"radio57\"  value=\"C\">C.外围设备<BR><input type=\"radio\" name=\"radio57\"  value=\"D\">D.CPU<BR>','<BR>提示7<BR>',10.000,'A',NULL,1,'2006-09-27 09:46:45',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(58,'','在DOS系统中，打印机的设备名是（ A ）。<BR><input type=\"radio\" name=\"radio58\"  value=\"A\">A.PRN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio58\"  value=\"B\">B.CON <BR><input type=\"radio\" name=\"radio58\"  value=\"C\">C.AUX&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio58\"  value=\"D\">D.COM1<BR>','<BR>提示8<BR>',10.000,'A',NULL,1,'2006-09-27 09:46:45',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(59,'','当提示符为A:DOSWCGUSER时，键入CD命令后，当前目录将是( A)。<BR><input type=\"radio\" name=\"radio59\"  value=\"A\">A.根目录&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio59\"  value=\"B\">B.DOS子目录<BR><input type=\"radio\" name=\"radio59\"  value=\"C\">C.WCG子目录&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio59\"  value=\"D\">D.USER子目录<BR>','<BR>提示9<BR>',10.000,'A',NULL,1,'2006-09-27 09:46:45',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(60,'','在A&gt;下，将B：EX1的文件更改文件名为EX2的命令是( B )。<BR><input type=\"radio\" name=\"radio60\"  value=\"A\">A.A&gt;REN&nbsp; EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio60\"  value=\"B\">B.A&gt;REN&nbsp; B:EX1 B:EX2<BR><input type=\"radio\" name=\"radio60\"  value=\"C\">C.A&gt;REN B:EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio60\"  value=\"D\">D.A&gt;REN&nbsp; B：EX2&nbsp; EX1<BR>','<BR>提示10</P>',10.000,'B',NULL,1,'2006-09-27 09:46:45',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(61,'','十六进制数7A对应的八进制数为（B ）。<BR><input type=\"radio\" name=\"radio61\"  value=\"A\">A.144 <BR><input type=\"radio\" name=\"radio61\"  value=\"B\">B.122&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio61\"  value=\"C\">C.136 <BR><input type=\"radio\" name=\"radio61\"  value=\"D\">D.372<BR>','<BR>提示１<BR>',10.000,'B',NULL,1,'2006-09-27 09:47:01',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(62,'','计算机中,机器数的正、负号用(&nbsp;&nbsp; B )表示<BR><input type=\"radio\" name=\"radio62\"  value=\"A\">A.\"+\"和\"-\"<BR><input type=\"radio\" name=\"radio62\"  value=\"B\">B.\"0\"和\"1\"<BR><input type=\"radio\" name=\"radio62\"  value=\"C\">C.专用的指示器<BR><input type=\"radio\" name=\"radio62\"  value=\"D\">D.不能表示给定<BR>','<BR>提示2<BR>',10.000,'B',NULL,1,'2006-09-27 09:47:01',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(63,'','二进制数00111001，若它为ASCII码时，它表示的十进制数为（ B）。<BR><input type=\"radio\" name=\"radio63\"  value=\"A\">A.9<BR><input type=\"radio\" name=\"radio63\"  value=\"B\">B.57<BR><input type=\"radio\" name=\"radio63\"  value=\"C\">C.39<BR><input type=\"radio\" name=\"radio63\"  value=\"D\">D.8<BR>','<BR>提示3<BR>',10.000,'B',NULL,1,'2006-09-27 09:47:01',2,1,51,NULL,'B',NULL,0,0,48,49,52,'a'),(64,'','运算器的主要功能是进行（ B）运算。<BR><input type=\"radio\" name=\"radio64\"  value=\"A\">A.逻辑<BR><input type=\"radio\" name=\"radio64\"  value=\"B\">B.算术与逻辑<BR><input type=\"radio\" name=\"radio64\"  value=\"C\">C.算术<BR><input type=\"radio\" name=\"radio64\"  value=\"D\">D.数值</P>\r\n<P>','<BR>提示4<BR>',10.000,'B',NULL,1,'2006-09-27 09:47:01',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(65,'','一般情况下，在断电后，硬盘中的数据会（ A&nbsp; ）。<BR><input type=\"radio\" name=\"radio65\"  value=\"A\">A.不丢失<BR><input type=\"radio\" name=\"radio65\"  value=\"B\">B.完全丢失<BR><input type=\"radio\" name=\"radio65\"  value=\"C\">C.小部分丢失<BR><input type=\"radio\" name=\"radio65\"  value=\"D\">D.大部分丢失<BR>','<BR>提示5<BR>',10.000,'A',NULL,1,'2006-09-27 09:47:01',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(66,'','输入设备是（ D&nbsp; ）。<BR><input type=\"radio\" name=\"radio66\"  value=\"A\">A.从磁盘上读取信息的电子线路<BR><input type=\"radio\" name=\"radio66\"  value=\"B\">B.磁盘文件等<BR><input type=\"radio\" name=\"radio66\"  value=\"C\">C.键盘、鼠标和打印机等<BR><input type=\"radio\" name=\"radio66\"  value=\"D\">D.从计算机外部获取信息的设备<BR>','<BR>提示6<BR>',10.000,'D',NULL,1,'2006-09-27 09:47:01',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(67,'','没有（&nbsp; A ）的计算机被称为\"裸机\"。<BR><input type=\"radio\" name=\"radio67\"  value=\"A\">A.软件<BR><input type=\"radio\" name=\"radio67\"  value=\"B\">B.硬件<BR><input type=\"radio\" name=\"radio67\"  value=\"C\">C.外围设备<BR><input type=\"radio\" name=\"radio67\"  value=\"D\">D.CPU<BR>','<BR>提示7<BR>',10.000,'A',NULL,1,'2006-09-27 09:47:01',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(68,'','在DOS系统中，打印机的设备名是（ A ）。<BR><input type=\"radio\" name=\"radio68\"  value=\"A\">A.PRN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio68\"  value=\"B\">B.CON <BR><input type=\"radio\" name=\"radio68\"  value=\"C\">C.AUX&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio68\"  value=\"D\">D.COM1<BR>','<BR>提示8<BR>',10.000,'A',NULL,1,'2006-09-27 09:47:01',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(69,'','当提示符为A:DOSWCGUSER时，键入CD命令后，当前目录将是( A)。<BR><input type=\"radio\" name=\"radio69\"  value=\"A\">A.根目录&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio69\"  value=\"B\">B.DOS子目录<BR><input type=\"radio\" name=\"radio69\"  value=\"C\">C.WCG子目录&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio69\"  value=\"D\">D.USER子目录<BR>','<BR>提示9<BR>',10.000,'A',NULL,1,'2006-09-27 09:47:01',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(70,'','在A&gt;下，将B：EX1的文件更改文件名为EX2的命令是( B )。<BR><input type=\"radio\" name=\"radio70\"  value=\"A\">A.A&gt;REN&nbsp; EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio70\"  value=\"B\">B.A&gt;REN&nbsp; B:EX1 B:EX2<BR><input type=\"radio\" name=\"radio70\"  value=\"C\">C.A&gt;REN B:EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio70\"  value=\"D\">D.A&gt;REN&nbsp; B：EX2&nbsp; EX1<BR>','<BR>提示10</P>',10.000,'B',NULL,1,'2006-09-27 09:47:01',2,1,51,NULL,'A',NULL,0,0,48,49,52,'a'),(81,'','十六进制数7A对应的八进制数为（B ）。<BR><input type=\"radio\" name=\"radio81\"  value=\"A\">A.144 <BR><input type=\"radio\" name=\"radio81\"  value=\"B\">B.122&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio81\"  value=\"C\">C.136 <BR><input type=\"radio\" name=\"radio81\"  value=\"D\">D.372<BR>','<BR>提示１<BR>',10.000,'B',NULL,1,'2007-11-11 02:50:10',1,1,51,NULL,'A',NULL,0,0,48,49,49,'a'),(82,'','计算机中,机器数的正、负号用(&nbsp;&nbsp; B )表示<BR><input type=\"radio\" name=\"radio82\"  value=\"A\">A.\"+\"和\"-\"<BR><input type=\"radio\" name=\"radio82\"  value=\"B\">B.\"0\"和\"1\"<BR><input type=\"radio\" name=\"radio82\"  value=\"C\">C.专用的指示器<BR><input type=\"radio\" name=\"radio82\"  value=\"D\">D.不能表示给定<BR>','<BR>提示2<BR>',10.000,'B',NULL,1,'2007-11-11 02:50:10',1,1,51,NULL,'A',NULL,0,0,48,49,49,'a'),(83,'','二进制数00111001，若它为ASCII码时，它表示的十进制数为（ B）。<BR><input type=\"radio\" name=\"radio83\"  value=\"A\">A.9<BR><input type=\"radio\" name=\"radio83\"  value=\"B\">B.57<BR><input type=\"radio\" name=\"radio83\"  value=\"C\">C.39<BR><input type=\"radio\" name=\"radio83\"  value=\"D\">D.8<BR>','<BR>提示3<BR>',10.000,'B',NULL,1,'2007-11-11 02:50:10',1,1,51,NULL,'B',NULL,0,0,48,49,49,'a'),(84,'','运算器的主要功能是进行（ B）运算。<BR><input type=\"radio\" name=\"radio84\"  value=\"A\">A.逻辑<BR><input type=\"radio\" name=\"radio84\"  value=\"B\">B.算术与逻辑<BR><input type=\"radio\" name=\"radio84\"  value=\"C\">C.算术<BR><input type=\"radio\" name=\"radio84\"  value=\"D\">D.数值</P>\r\n<P>','<BR>提示4<BR>',10.000,'B',NULL,1,'2007-11-11 02:50:10',1,1,51,NULL,'A',NULL,0,0,48,49,49,'a'),(85,'','一般情况下，在断电后，硬盘中的数据会（ A&nbsp; ）。<BR><input type=\"radio\" name=\"radio85\"  value=\"A\">A.不丢失<BR><input type=\"radio\" name=\"radio85\"  value=\"B\">B.完全丢失<BR><input type=\"radio\" name=\"radio85\"  value=\"C\">C.小部分丢失<BR><input type=\"radio\" name=\"radio85\"  value=\"D\">D.大部分丢失<BR>','<BR>提示5<BR>',10.000,'A',NULL,1,'2007-11-11 02:50:10',1,1,51,NULL,'A',NULL,0,0,48,49,49,'a'),(86,'','输入设备是（ D&nbsp; ）。<BR><input type=\"radio\" name=\"radio86\"  value=\"A\">A.从磁盘上读取信息的电子线路<BR><input type=\"radio\" name=\"radio86\"  value=\"B\">B.磁盘文件等<BR><input type=\"radio\" name=\"radio86\"  value=\"C\">C.键盘、鼠标和打印机等<BR><input type=\"radio\" name=\"radio86\"  value=\"D\">D.从计算机外部获取信息的设备<BR>','<BR>提示6<BR>',10.000,'D',NULL,1,'2007-11-11 02:50:10',1,1,51,NULL,'A',NULL,0,0,48,49,49,'a'),(87,'','没有（&nbsp; A ）的计算机被称为\"裸机\"。<BR><input type=\"radio\" name=\"radio87\"  value=\"A\">A.软件<BR><input type=\"radio\" name=\"radio87\"  value=\"B\">B.硬件<BR><input type=\"radio\" name=\"radio87\"  value=\"C\">C.外围设备<BR><input type=\"radio\" name=\"radio87\"  value=\"D\">D.CPU<BR>','<BR>提示7<BR>',10.000,'A',NULL,1,'2007-11-11 02:50:10',1,1,51,NULL,'A',NULL,0,0,48,49,49,'a'),(88,'','在DOS系统中，打印机的设备名是（ A ）。<BR><input type=\"radio\" name=\"radio88\"  value=\"A\">A.PRN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio88\"  value=\"B\">B.CON <BR><input type=\"radio\" name=\"radio88\"  value=\"C\">C.AUX&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio88\"  value=\"D\">D.COM1<BR>','<BR>提示8<BR>',10.000,'A',NULL,1,'2007-11-11 02:50:10',1,1,51,NULL,'A',NULL,0,0,48,49,49,'a'),(89,'','当提示符为A:DOSWCGUSER时，键入CD命令后，当前目录将是( A)。<BR><input type=\"radio\" name=\"radio89\"  value=\"A\">A.根目录&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio89\"  value=\"B\">B.DOS子目录<BR><input type=\"radio\" name=\"radio89\"  value=\"C\">C.WCG子目录&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio89\"  value=\"D\">D.USER子目录<BR>','<BR>提示9<BR>',10.000,'A',NULL,1,'2007-11-11 02:50:10',1,1,51,NULL,'A',NULL,0,0,48,49,49,'a'),(90,'','在A&gt;下，将B：EX1的文件更改文件名为EX2的命令是( B )。<BR><input type=\"radio\" name=\"radio90\"  value=\"A\">A.A&gt;REN&nbsp; EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio90\"  value=\"B\">B.A&gt;REN&nbsp; B:EX1 B:EX2<BR><input type=\"radio\" name=\"radio90\"  value=\"C\">C.A&gt;REN B:EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio90\"  value=\"D\">D.A&gt;REN&nbsp; B：EX2&nbsp; EX1<BR>','<BR>提示10</P>',10.000,'B',NULL,1,'2007-11-11 02:50:10',1,1,51,NULL,'A',NULL,0,0,48,49,49,'a'),(101,'','十六进制数7A对应的八进制数为（B ）。<BR><input type=\"radio\" name=\"radio101\"  value=\"A\">A.144 <BR><input type=\"radio\" name=\"radio101\"  value=\"B\">B.122&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio101\"  value=\"C\">C.136 <BR><input type=\"radio\" name=\"radio101\"  value=\"D\">D.372<BR>','<BR>提示１<BR>',10.000,'B',NULL,1,'2007-11-11 02:53:27',1,1,51,NULL,'A',NULL,0,0,48,-1,-1,'a'),(102,'','计算机中,机器数的正、负号用(&nbsp;&nbsp; B )表示<BR><input type=\"radio\" name=\"radio102\"  value=\"A\">A.\"+\"和\"-\"<BR><input type=\"radio\" name=\"radio102\"  value=\"B\">B.\"0\"和\"1\"<BR><input type=\"radio\" name=\"radio102\"  value=\"C\">C.专用的指示器<BR><input type=\"radio\" name=\"radio102\"  value=\"D\">D.不能表示给定<BR>','<BR>提示2<BR>',10.000,'B',NULL,1,'2007-11-11 02:53:27',1,1,51,NULL,'A',NULL,0,0,48,-1,-1,'a'),(103,'','二进制数00111001，若它为ASCII码时，它表示的十进制数为（ B）。<BR><input type=\"radio\" name=\"radio103\"  value=\"A\">A.9<BR><input type=\"radio\" name=\"radio103\"  value=\"B\">B.57<BR><input type=\"radio\" name=\"radio103\"  value=\"C\">C.39<BR><input type=\"radio\" name=\"radio103\"  value=\"D\">D.8<BR>','<BR>提示3<BR>',10.000,'B',NULL,1,'2007-11-11 02:53:27',1,1,51,NULL,'B',NULL,0,0,48,-1,-1,'a'),(104,'','运算器的主要功能是进行（ B）运算。<BR><input type=\"radio\" name=\"radio104\"  value=\"A\">A.逻辑<BR><input type=\"radio\" name=\"radio104\"  value=\"B\">B.算术与逻辑<BR><input type=\"radio\" name=\"radio104\"  value=\"C\">C.算术<BR><input type=\"radio\" name=\"radio104\"  value=\"D\">D.数值</P>\r\n<P>','<BR>提示4<BR>',10.000,'B',NULL,1,'2007-11-11 02:53:27',1,1,51,NULL,'A',NULL,0,0,48,-1,-1,'a'),(105,'','一般情况下，在断电后，硬盘中的数据会（ A&nbsp; ）。<BR><input type=\"radio\" name=\"radio105\"  value=\"A\">A.不丢失<BR><input type=\"radio\" name=\"radio105\"  value=\"B\">B.完全丢失<BR><input type=\"radio\" name=\"radio105\"  value=\"C\">C.小部分丢失<BR><input type=\"radio\" name=\"radio105\"  value=\"D\">D.大部分丢失<BR>','<BR>提示5<BR>',10.000,'A',NULL,1,'2007-11-11 02:53:27',1,1,51,NULL,'A',NULL,0,0,48,-1,-1,'a'),(106,'','输入设备是（ D&nbsp; ）。<BR><input type=\"radio\" name=\"radio106\"  value=\"A\">A.从磁盘上读取信息的电子线路<BR><input type=\"radio\" name=\"radio106\"  value=\"B\">B.磁盘文件等<BR><input type=\"radio\" name=\"radio106\"  value=\"C\">C.键盘、鼠标和打印机等<BR><input type=\"radio\" name=\"radio106\"  value=\"D\">D.从计算机外部获取信息的设备<BR>','<BR>提示6<BR>',10.000,'D',NULL,1,'2007-11-11 02:53:27',1,1,51,NULL,'A',NULL,0,0,48,-1,-1,'a'),(107,'','没有（&nbsp; A ）的计算机被称为\"裸机\"。<BR><input type=\"radio\" name=\"radio107\"  value=\"A\">A.软件<BR><input type=\"radio\" name=\"radio107\"  value=\"B\">B.硬件<BR><input type=\"radio\" name=\"radio107\"  value=\"C\">C.外围设备<BR><input type=\"radio\" name=\"radio107\"  value=\"D\">D.CPU<BR>','<BR>提示7<BR>',10.000,'A',NULL,1,'2007-11-11 02:53:27',1,1,51,NULL,'A',NULL,0,0,48,-1,-1,'a'),(108,'','在DOS系统中，打印机的设备名是（ A ）。<BR><input type=\"radio\" name=\"radio108\"  value=\"A\">A.PRN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio108\"  value=\"B\">B.CON <BR><input type=\"radio\" name=\"radio108\"  value=\"C\">C.AUX&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio108\"  value=\"D\">D.COM1<BR>','<BR>提示8<BR>',10.000,'A',NULL,1,'2007-11-11 02:53:27',1,1,51,NULL,'A',NULL,0,0,48,-1,-1,'a'),(109,'','当提示符为A:DOSWCGUSER时，键入CD命令后，当前目录将是( A)。<BR><input type=\"radio\" name=\"radio109\"  value=\"A\">A.根目录&nbsp;&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio109\"  value=\"B\">B.DOS子目录<BR><input type=\"radio\" name=\"radio109\"  value=\"C\">C.WCG子目录&nbsp;&nbsp; <BR><input type=\"radio\" name=\"radio109\"  value=\"D\">D.USER子目录<BR>','<BR>提示9<BR>',10.000,'A',NULL,1,'2007-11-11 02:53:27',1,1,51,NULL,'A',NULL,0,0,48,-1,-1,'a'),(110,'','在A&gt;下，将B：EX1的文件更改文件名为EX2的命令是( B )。<BR><input type=\"radio\" name=\"radio110\"  value=\"A\">A.A&gt;REN&nbsp; EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio110\"  value=\"B\">B.A&gt;REN&nbsp; B:EX1 B:EX2<BR><input type=\"radio\" name=\"radio110\"  value=\"C\">C.A&gt;REN B:EX1&nbsp; EX2 <BR><input type=\"radio\" name=\"radio110\"  value=\"D\">D.A&gt;REN&nbsp; B：EX2&nbsp; EX1<BR>','<BR>提示10</P>',10.000,'B',NULL,1,'2007-11-11 02:53:27',1,1,51,NULL,'A',NULL,0,0,48,-1,-1,'a');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questtype`
--

DROP TABLE IF EXISTS `questtype`;
CREATE TABLE `questtype` (
  `ID` tinyint(4) unsigned NOT NULL default '0',
  `Name` varchar(60) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `questtype`
--

LOCK TABLES `questtype` WRITE;
/*!40000 ALTER TABLE `questtype` DISABLE KEYS */;
INSERT INTO `questtype` VALUES (1,'单选题'),(3,'填空题'),(4,'判断题'),(5,'主观题'),(7,'实验题'),(2,'多选题');
/*!40000 ALTER TABLE `questtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `field1` tinyint(4) default NULL,
  `ID` int(11) unsigned NOT NULL auto_increment,
  `SID` int(11) default NULL,
  `EID` int(11) default NULL,
  `Score` float(9,3) default NULL,
  `TID` smallint(4) default NULL,
  `Memo` varchar(100) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
CREATE TABLE `scores` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `test_id` int(11) default NULL,
  `score` float(9,3) default NULL,
  `stu_id` varchar(30) default NULL,
  `tea_id` int(11) default NULL,
  `test_date` datetime default NULL,
  `test_class` tinyint(4) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ID` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
INSERT INTO `scores` VALUES (22,6,100.000,'s001',1,'2006-09-27 10:01:44',2),(21,7,30.000,'stest',1,'2006-09-27 09:58:42',2),(20,6,80.000,'stest',1,'2006-09-27 09:58:15',2),(23,7,80.000,'s001',1,'2006-09-27 10:02:15',2);
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selectquest`
--

DROP TABLE IF EXISTS `selectquest`;
CREATE TABLE `selectquest` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `MainID` int(11) default NULL,
  `SelectNum` tinyint(4) unsigned default NULL,
  `Select1` varchar(255) default NULL,
  `Select2` varchar(255) default NULL,
  `Select3` varchar(255) default NULL,
  `Select4` varchar(255) default NULL,
  `Select5` varchar(255) default NULL,
  `Select6` varchar(255) default NULL,
  `Select7` varchar(255) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `selectquest`
--

LOCK TABLES `selectquest` WRITE;
/*!40000 ALTER TABLE `selectquest` DISABLE KEYS */;
/*!40000 ALTER TABLE `selectquest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_mn_test`
--

DROP TABLE IF EXISTS `stu_mn_test`;
CREATE TABLE `stu_mn_test` (
  `stu_id` int(4) default NULL,
  `mn_id` int(11) default NULL,
  `status` tinyint(4) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `stu_mn_test`
--

LOCK TABLES `stu_mn_test` WRITE;
/*!40000 ALTER TABLE `stu_mn_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `stu_mn_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `Name` varchar(12) default NULL,
  `Sex` tinyint(4) default NULL,
  `gradenote` char(3) default NULL,
  `school` varchar(80) default NULL,
  `Area` varchar(80) default NULL,
  `EnrolDate` date default NULL,
  `HistoryMark` int(11) unsigned default NULL,
  `NickName` varchar(80) default NULL,
  `Birthday` date default NULL,
  `Province` varchar(20) default NULL,
  `City` varchar(40) default NULL,
  `Address` varchar(80) default NULL,
  `PostalCode` varchar(10) default NULL,
  `HomePhone` varchar(15) default NULL,
  `MobilePhone` varchar(15) default NULL,
  `Hobby` varchar(100) default NULL,
  `userid` varchar(50) default NULL,
  `Passwd` varchar(20) default NULL,
  `Test` text,
  `Answer` text,
  `exp_mark` int(11) default '0',
  `jh_area` varchar(100) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (16,'王1',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc001','123',NULL,NULL,0,'精华教区1'),(17,'王2',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc002','123',NULL,NULL,0,'精华教区1'),(18,'王3',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc003','123',NULL,NULL,0,'精华教区1'),(19,'王4',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc004','123',NULL,NULL,0,'精华教区1'),(20,'王5',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc005','123',NULL,NULL,0,'精华教区1'),(21,'王6',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc006','123',NULL,NULL,0,'精华教区1'),(22,'王7',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc007','123',NULL,NULL,0,'精华教区1'),(23,'王8',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc008','123',NULL,NULL,0,'精华教区1'),(24,'王9',NULL,'c2','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc009','123',NULL,NULL,0,'精华教区1'),(25,'王10',NULL,'c2','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc010','123',NULL,NULL,0,'精华教区1'),(26,'王11',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc011','123',NULL,NULL,0,'精华教区1'),(27,'王12',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc012','123',NULL,NULL,0,'精华教区1'),(28,'王大明',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s11','123',NULL,NULL,0,'精华教区1'),(29,'王14',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc014','123',NULL,NULL,0,'精华教区1'),(30,'王15',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc015','123',NULL,NULL,0,'精华教区1'),(31,'王16',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc016','123',NULL,NULL,0,'精华教区1'),(32,'王17',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc017','123',NULL,NULL,0,'精华教区1'),(33,'?18',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc018','123',NULL,NULL,0,'精华教区1'),(34,'?19',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc019','123',NULL,NULL,0,'精华教区1'),(35,'?20',NULL,'c1','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'sc020','123',NULL,NULL,0,'精华教区1'),(36,'cbd',NULL,'c3','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'s123','123',NULL,NULL,0,'精华教区1'),(37,'luorf',NULL,'g3l','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'luorf','123',NULL,NULL,0,'精华教区1'),(38,'aaa',NULL,'g3l','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aaa','123',NULL,NULL,0,'精华教区1'),(39,'cbd',NULL,'g3l','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aaa','123',NULL,NULL,0,'精华教区1'),(40,'cbd',NULL,'g3l','北京理工大学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123','123',NULL,NULL,0,'精华教区1');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_bak`
--

DROP TABLE IF EXISTS `student_bak`;
CREATE TABLE `student_bak` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `Name` varchar(12) default NULL,
  `Sex` tinyint(4) default NULL,
  `gradenote` char(3) default NULL,
  `school` varchar(80) default NULL,
  `Area` varchar(80) default NULL,
  `EnrolDate` date default NULL,
  `HistoryMark` int(11) unsigned default NULL,
  `NickName` varchar(80) default NULL,
  `Birthday` date default NULL,
  `Province` varchar(20) default NULL,
  `City` varchar(40) default NULL,
  `Address` varchar(80) default NULL,
  `PostalCode` varchar(10) default NULL,
  `HomePhone` varchar(15) default NULL,
  `MobilePhone` varchar(15) default NULL,
  `Hobby` varchar(100) default NULL,
  `userid` varchar(50) default NULL,
  `Passwd` varchar(20) default NULL,
  `Test` text,
  `Answer` text,
  `exp_mark` int(11) default '0',
  `jh_area` varchar(100) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `student_bak`
--

LOCK TABLES `student_bak` WRITE;
/*!40000 ALTER TABLE `student_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `Name` varchar(100) default NULL,
  `note` char(2) default NULL,
  `ID` int(4) unsigned NOT NULL auto_increment,
  `class` varchar(5) default NULL,
  `gradenote` char(3) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('计算机应用基础',NULL,51,NULL,'a');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysadmin`
--

DROP TABLE IF EXISTS `sysadmin`;
CREATE TABLE `sysadmin` (
  `id` int(8) NOT NULL auto_increment,
  `vcUserNo` varchar(20) default NULL,
  `vcName` varchar(20) default NULL,
  `enSex` enum('M','F') default NULL,
  `vcEmail` varchar(50) default NULL,
  `vcNick` varchar(100) default NULL,
  `vcPass` varchar(50) default NULL,
  `vcQuestion` varchar(100) default NULL,
  `vcAnswer` varchar(100) default NULL,
  `vcTel` varchar(20) default NULL,
  `vcHomeAdd` varchar(100) default NULL,
  `vcZipCode` varchar(6) default NULL,
  `vcSchool` varchar(100) default NULL,
  `vcParentName` varchar(20) default NULL,
  `vcParentEmail` varchar(50) default NULL,
  `vcParentTel` varchar(20) default NULL,
  `vcProvince` varchar(20) default NULL,
  `vcTarget` varchar(255) default NULL,
  `vcAdage` varchar(255) default NULL,
  `vcOldGrade` varchar(20) default NULL,
  `vcOldClass` varchar(20) default NULL,
  `jh_area` varchar(50) default NULL,
  `gradenote` varchar(4) default NULL,
  `vcIDCard` varchar(25) default NULL,
  `vcPolitical` varchar(20) default NULL,
  `vcEducation` varchar(10) default NULL,
  `vcWorkTitle` varchar(10) default NULL,
  `vcMarriage` char(1) default NULL,
  `vcMemo` text,
  `vcWorkUnit` varchar(100) default NULL,
  `syspower` varchar(10) default NULL,
  `ModifyDate` varchar(19) default NULL,
  `daWorkDate` varchar(19) default NULL,
  `daBrith` varchar(19) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `sysadmin`
--

LOCK TABLES `sysadmin` WRITE;
/*!40000 ALTER TABLE `sysadmin` DISABLE KEYS */;
INSERT INTO `sysadmin` VALUES (11,'ad001','cbd','F','cbd@bit.edu.cn',NULL,'123',NULL,NULL,'69874583','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'','','0','0','0','a','','1','2006-08-12 06:54:27','','2006-08-09'),(12,'ad002','cbd','F','cbd@bit.edu.cn',NULL,'123',NULL,NULL,'69874583','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'','','0','0','0','memo','','1','2006-08-12 07:07:33','','2006-08-09'),(15,'cyk','edd','M','yb3545070@163.com',NULL,'123',NULL,NULL,'0831-24444444','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'','','0','0','0','','','1','2006-08-15 00:42:47','','2006-08-01'),(14,'user','中国人','F','cbd@163.com',NULL,'123',NULL,NULL,'69854521','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'','','0','0','0','ddd','','1','2006-08-12 20:27:25','2006-08-20','2006-08-07');
/*!40000 ALTER TABLE `sysadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(8) NOT NULL auto_increment,
  `vcUserNo` varchar(20) default NULL,
  `vcName` varchar(20) default NULL,
  `enSex` enum('M','F') default NULL,
  `vcEmail` varchar(50) default NULL,
  `vcNick` varchar(100) default NULL,
  `vcPass` varchar(50) default NULL,
  `vcQuestion` varchar(100) default NULL,
  `vcAnswer` varchar(100) default NULL,
  `vcTel` varchar(20) default NULL,
  `vcHomeAdd` varchar(100) default NULL,
  `vcZipCode` varchar(6) default NULL,
  `vcSchool` varchar(100) default NULL,
  `vcParentName` varchar(20) default NULL,
  `vcParentEmail` varchar(50) default NULL,
  `vcParentTel` varchar(20) default NULL,
  `vcProvince` varchar(20) default NULL,
  `vcTarget` varchar(255) default NULL,
  `vcAdage` varchar(255) default NULL,
  `vcOldGrade` varchar(20) default NULL,
  `vcOldClass` varchar(20) default NULL,
  `gradenote` varchar(4) default NULL,
  `vcIDCard` varchar(25) default NULL,
  `vcPolitical` varchar(20) default NULL,
  `vcEducation` varchar(10) default NULL,
  `vcWorkTitle` varchar(10) default NULL,
  `vcMarriage` char(1) default NULL,
  `vcMemo` text,
  `vcWorkUnit` varchar(100) default NULL,
  `ModifyDate` varchar(19) default NULL,
  `daWorkDate` varchar(19) default NULL,
  `daBrith` varchar(19) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'tea001','cbd','M','cbd@bit.edu.cn',NULL,'123',NULL,NULL,'69874583','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'','','0','0','0','001','','2006-08-12 22:10:41','','2006-08-09'),(2,'tea002','1','F','cbd@bit.edu.cn',NULL,'d',NULL,NULL,'69874584','7','8',NULL,NULL,NULL,NULL,'北京',NULL,NULL,NULL,NULL,NULL,'2','4','4','2','3','901','5','2006-08-12 22:11:56','2006-08-16','2006-08-13'),(4,'ad001','c','F','cbd@bit.edu.cn',NULL,'9',NULL,NULL,'69874583','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'','','0','0','0','','','2006-08-12 22:27:08','','2006-08-09');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `date` date default NULL,
  `testtypeid` tinyint(4) default NULL,
  `paper` text NOT NULL,
  `title` varchar(100) default NULL,
  `gradeid` tinyint(4) default NULL,
  `validtime` tinyint(4) default NULL,
  `status` tinyint(4) default NULL,
  `teaid` tinyint(4) default NULL,
  `subid` smallint(6) default NULL,
  `testnum` smallint(6) unsigned default '0',
  `answer` text,
  `knowpointid1` smallint(6) default NULL,
  `knowpointid2` smallint(6) default NULL,
  `knowpointid3` smallint(6) default NULL,
  `gradenote` char(3) default NULL,
  `mark` float(6,0) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ID` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'2006-08-27',1,'1@B@10@A#2@B@10@A#3@B@10@B#4@B@10@A#5@A@10@A#6@D@10@A#7@A@10@A#8@A@10@A#9@A@10@A#10@B@10@A#','7月　正式考试　计算机应用基础',NULL,3,3,1,51,10,NULL,48,0,0,'a',100),(2,'2006-08-27',1,'11@B@10@A#12@B@10@A#13@B@10@B#14@B@10@A#15@A@10@A#16@D@10@A#17@A@10@A#18@A@10@A#19@A@10@A#20@B@10@A#','8月　正式考试　计算机应用基础',NULL,3,3,1,51,10,NULL,48,0,0,'a',100),(3,'2006-08-27',1,'21@B@10@A#22@B@10@A#23@B@10@B#24@B@10@A#25@A@10@A#26@D@10@A#27@A@10@A#28@A@10@A#29@A@10@A#30@B@10@A#','9月　正式考试　计算机应用基础',NULL,3,3,1,51,10,NULL,48,0,0,'a',100),(4,'2006-09-27',1,'31@B@10@A#32@B@10@A#33@B@10@B#34@B@10@A#35@A@10@A#36@D@10@A#37@A@10@A#38@A@10@A#39@A@10@A#40@B@10@A#','自由测试卷1',NULL,3,4,1,51,10,NULL,48,49,52,'a',100),(5,'2006-09-27',1,'41@B@10@A#42@B@10@A#43@B@10@B#44@B@10@A#45@A@10@A#46@D@10@A#47@A@10@A#48@A@10@A#49@A@10@A#50@B@10@A#','自由测试卷2',NULL,3,4,1,51,10,NULL,48,49,52,'a',100),(6,'2006-09-27',1,'51@B@10@A#52@B@10@A#53@B@10@B#54@B@10@A#55@A@10@A#56@D@10@A#57@A@10@A#58@A@10@A#59@A@10@A#60@B@10@A#','单元测试卷 1',NULL,3,2,1,51,10,NULL,48,49,52,'a',100),(7,'2006-09-27',1,'61@B@10@A#62@B@10@A#63@B@10@B#64@B@10@A#65@A@10@A#66@D@10@A#67@A@10@A#68@A@10@A#69@A@10@A#70@B@10@A#','单元测试卷 2',NULL,3,2,1,51,10,NULL,48,49,52,'a',100),(8,'2007-01-23',1,'','',NULL,3,4,1,51,0,NULL,48,49,50,'a',0),(9,'2007-11-11',1,'81@B@10@A#82@B@10@A#83@B@10@B#84@B@10@A#85@A@10@A#86@D@10@A#87@A@10@A#88@A@10@A#89@A@10@A#90@B@10@A#','aszd',NULL,3,4,1,51,10,NULL,48,49,49,'a',100),(10,'2007-11-11',1,'101@B@10@A#102@B@10@A#103@B@10@B#104@B@10@A#105@A@10@A#106@D@10@A#107@A@10@A#108@A@10@A#109@A@10@A#110@B@10@A#','aaa',NULL,3,4,1,51,10,NULL,48,-1,-1,'a',100);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testpoint`
--

DROP TABLE IF EXISTS `testpoint`;
CREATE TABLE `testpoint` (
  `ID` tinyint(4) NOT NULL default '0',
  `Name` varchar(40) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `testpoint`
--

LOCK TABLES `testpoint` WRITE;
/*!40000 ALTER TABLE `testpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `testpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(8) NOT NULL auto_increment,
  `vcUserNo` varchar(20) default NULL,
  `vcName` varchar(20) default NULL,
  `enSex` enum('M','F') default NULL,
  `daBrith` varchar(19) default NULL,
  `vcEmail` varchar(50) default NULL,
  `vcNick` varchar(100) default NULL,
  `vcPass` varchar(50) default NULL,
  `vcQuestion` varchar(100) default NULL,
  `vcAnswer` varchar(100) default NULL,
  `vcTel` varchar(20) default NULL,
  `vcHomeAdd` varchar(100) default NULL,
  `vcZipCode` varchar(6) default NULL,
  `vcSchool` varchar(100) default NULL,
  `vcParentName` varchar(20) default NULL,
  `vcParentEmail` varchar(50) default NULL,
  `vcParentTel` varchar(20) default NULL,
  `vcProvince` varchar(20) default NULL,
  `vcTarget` varchar(255) default NULL,
  `vcAdage` varchar(255) default NULL,
  `vcOldGrade` varchar(20) default NULL,
  `vcOldClass` varchar(20) default NULL,
  `jh_area` varchar(50) default NULL,
  `gradenote` varchar(4) default NULL,
  `vcIDCard` varchar(25) default NULL,
  `vcPolitical` varchar(20) default NULL,
  `vcEducation` varchar(10) default NULL,
  `vcWorkTitle` varchar(10) default NULL,
  `vcMarriage` char(1) default NULL,
  `daWorkDate` varchar(19) default NULL,
  `vcMemo` text,
  `vcWorkUnit` varchar(100) default NULL,
  `ModifyDate` varchar(19) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=gb2312;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'s11','王大明','M','2006-08-18','cbd@163.com',NULL,'123',NULL,NULL,'69854521','','','密云中学',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Area1','b','','','0','0','0','','3132','','2006-08-26 11:28:45'),(12,'stest','王小明','F','2006-08-01','cbd@163.com',NULL,'123',NULL,NULL,'69854521','','','实验中学',NULL,NULL,NULL,'海南',NULL,NULL,NULL,NULL,'Area1','a','','','4','2','3','','备注','','2006-08-26 11:35:23'),(28,'s001','中国人','M','2006-09-27','cbd@163.com',NULL,'123',NULL,NULL,'69854521','','',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'a','','','0','0','0','','','',NULL);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2007-11-10 19:43:11
