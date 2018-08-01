CREATE TABLE `tbs001` (
  `Tbs001_inc` int unsigned NOT NULL auto_increment,
  `Id` varchar(20) NOT NULL,
  `nickname` varchar(40) not null,
  `pwd` Varchar(60) NOT NULL,
  `Email` Varchar(60) NOT NULL,
  `Name` Varchar(40),
  `Address` Varchar(100),
   zipcode char(6),
  `Tel` Varchar(40),
   fax varchar(40),
  `Mobilephone` Varchar(40),
  `birthday` date,
  `vocation` varchar(40),
  `Create_time` Datetime NOT NULL,
  `Log_time` Datetime NOT NULL,
  `Type` int NOT NULL default 0,
  `Status` Char(2) NOT NULL,
  PRIMARY KEY  (`tbs001_inc`,`id`,`nickname`)
) TYPE=MyISAM;

CREATE TABLE `tbs002` (
  `Tbs002_inc` int unsigned NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL,
  `parentid` int NOT NULL default 0,
  Is_banner char(2) not null default '00',
   Sort int not null default 100,
  `Status` Char(2) NOT NULL default '00',
  PRIMARY KEY  (`tbs002_inc`)
) TYPE=MyISAM;


CREATE TABLE `tbs003` (
  `Tbs003_inc` int unsigned NOT NULL auto_increment,
  `Tbs001_inc` int NOT NULL,
   Tbs002_inc int NOT NULL,
  `parentid` int NOT NULL,
   author varchar(40) not null,
   Title varchar(100) not null,
   url varchar(150) not null default '0',
   Is_banner char(2) not null default '00',
   Article_type char(2) not null default '00',
   pick varchar(100) ,
   Content text not null,
   Create_time Datetime not null ,
   type Char(2) default '00',
   url_type Char(1) not null default 0,
   Sort int not null default 100,
  `Status` Char(2) NOT NULL default '00',
  PRIMARY KEY  (`tbs003_inc`)
) TYPE=MyISAM;

CREATE TABLE tbs004 (
  Tbs004_inc int unsigned NOT NULL auto_increment,
  Tbs001_inc int NOT NULL,
   nickname varchar(40),
  Tbs003_inc int NOT NULL,
   Content Text not null,
   ip varchar(20) not null,
   sort int not null default 100,
   Create_time Datetime not null ,
  Status Char(2) NOT NULL default '00',
  PRIMARY KEY  (tbs004_inc)
) TYPE=MyISAM;


CREATE TABLE `tbs005` (
  `Tbs005_inc` int unsigned NOT NULL auto_increment,
  `id` varchar(20) NOT NULL,
   title varchar(100) not null,
   Content Text not null,
   Low_valid_date date not null,
   Hight_valid_date date not null,
   sort int not null default 100,
   Create_time Datetime not null ,
  `Status` Char(2) NOT NULL default '00',
  PRIMARY KEY  (`tbs005_inc`)
) TYPE=MyISAM;

CREATE TABLE `tbs006` (
  `Tbs006_inc` int unsigned NOT NULL auto_increment,
  `id` varchar(20) NOT NULL,
   brief varchar(200) not null,
   web_url varchar(150) not null,
   image_url varchar(150) not null,
   type char(2) not null,
   sort int not null,
   Create_time Datetime not null ,
  `Status` Char(2) NOT NULL default '00',
  PRIMARY KEY  (`tbs006_inc`)
) TYPE=MyISAM;





CREATE TABLE `tbs051` (
  `Tbs051_inc` int unsigned NOT NULL auto_increment,
  `Catalog_id` int NOT NULL,
  `name` varchar(255) not null,
  `Keywords` Varchar(50) NOT NULL,
   brief varchar(200) not null,
  `Product_intr` Text NOT NULL,
  `manufacturer` Varchar(100),
   market_price int,
  `Price` int,
  `Member_price` int,
   cost_price int,
  `Currency_id` Char(5) not null,
  `Type` Char(2)  not null,
   position char(2) not null,
  `is_supply` Char(2)  not null default '00',
  `Create_id` Char(20),
  `Create_date` DATETIME NOT NULL,
   update_date Datetime,
   update_id varchar(20),
   Sort int default 100,
  `Status` Char(2) NOT NULL,
  PRIMARY KEY  (`tbs051_inc`)
) TYPE=MyISAM;



CREATE TABLE `tbs052` (
  `Tbs052_inc` int unsigned NOT NULL auto_increment,  
  `Tbs051_inc` int,  
   Img_url varchar(150),
   brief varchar(200),
   Position char(10),
  `Create_id` Char(20),
  `Create_time` DATEtime NOT NULL,
   Sort int default 100,
  `Status` Char(2) NOT NULL,
  PRIMARY KEY  (`tbs052_inc`)
) TYPE=MyISAM;


CREATE TABLE `tbs053` (
  `Tbs053_inc` int unsigned NOT NULL auto_increment,  
  `Tbs051_inc` int,  
   title varchar(50),
   content text,
   Ip varchar(20),
  `Create_id` Char(20),
  `Create_time` DATEtime NOT NULL,
  `update_time` DATEtime NOT NULL,
   Sort int default 100,
  `Status` Char(2) NOT NULL,
  PRIMARY KEY  (`tbs053_inc`)
) TYPE=MyISAM;


CREATE TABLE `tbs053` (
  `Tbs053_inc` int unsigned NOT NULL auto_increment,  
  `Tbs052_inc` int,  
   Title varchar(50),
   Content varchar(255),
  `id` varchar(20),
  `Create_date` DATE NOT NULL,
   Sort int default 100,
  `Status` Char(2) NOT NULL,
  PRIMARY KEY  (`tbs053_inc`)
) TYPE=MyISAM;

CREATE TABLE `tap001` (
  `Tap001_inc` int unsigned NOT NULL auto_increment,
   tbs051_inc int not null,
  `Goodsname` varchar(255) NOT NULL,
   Member_rice int not null,
   Access_price int not null,
   Cost_price int not null,
   Ordernum int not null,
   Membertotalprice int not null,
   Totalprice int not null,
   costtotalprice int not null,
   Confirm_type Char(2) not null,
   Pay_type Char(2) not null,
   remark text,   
  `nickname` varchar(40) not null, 
  `Email` Varchar(60) NOT NULL,
  `Name` Varchar(40),
  `Address` Varchar(100),
   zipcode char(6),
  `Tel` Varchar(40),
   fax varchar(40),
  `Mobilephone` Varchar(40),
  `Create_time` Datetime NOT NULL,
   Create_id varchar(20) not null,
  `update_time` Datetime NOT NULL,
   update_id varchar(20),
  `reason` text,
   sendgoods char(2),
  `Status` Char(5) NOT NULL,
  PRIMARY KEY  (`tap001_inc`)
) TYPE=MyISAM;



CREATE TABLE `tcd001` (
  `Tcd001_inc` int unsigned NOT NULL auto_increment,  
  `Name` varchar(50) not null,  
   Sort int not null default 100,   
  `Is_banner` char(2) not null,
   Positon char(10) not null,
   Parentid int not null,
   Create_time datetime not null,
   create_id varchar(20) not null,
  `Status` Char(2) NOT NULL,
  PRIMARY KEY  (`tcd001_inc`)
) TYPE=MyISAM;



CREATE TABLE `tcd002` ( 
   id char(2) not null,
  `Name` varchar(50) not null, 
  `Status` Char(2) NOT NULL,
  PRIMARY KEY  (id)
) TYPE=MyISAM;

CREATE TABLE `tcd003` (
   typeid char(2) not null,  
  `Name` varchar(50) not null,   
  `Status` Char(2) NOT NULL,
  PRIMARY KEY  (typeid)
) TYPE=MyISAM;



CREATE TABLE `tcd004` (
   typeid char(5) not null,  
  `Name` varchar(50) not null,   
  `Status` Char(2) NOT NULL,
  PRIMARY KEY  (typeid)
) TYPE=MyISAM;


CREATE TABLE `tsy001` (
  `Tsy001_inc` int unsigned NOT NULL auto_increment,  
  `id` varchar(20),  
   Name varchar(50),
   pwd varchar(60),
  `Create_date` DATE NOT NULL,
   type int default 0,
   Sort int default 100,
  `Status` Char(2) NOT NULL,
  PRIMARY KEY  (`tsy001_inc`,id)
) TYPE=MyISAM;





