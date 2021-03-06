/****** Object:  Database BookShop    Script Date: 2005-01-17 19:40:55 ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'BookShop')
	DROP DATABASE [BookShop]
GO

CREATE DATABASE [BookShop]  ON (NAME = N'BookShop_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\BookShop_Data.MDF' , SIZE = 2, FILEGROWTH = 10%) LOG ON (NAME = N'BookShop_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\BookShop_Log.LDF' , SIZE = 1, FILEGROWTH = 10%)
GO

exec sp_dboption N'BookShop', N'autoclose', N'false'
GO

exec sp_dboption N'BookShop', N'bulkcopy', N'false'
GO

exec sp_dboption N'BookShop', N'trunc. log', N'true'
GO

exec sp_dboption N'BookShop', N'torn page detection', N'true'
GO

exec sp_dboption N'BookShop', N'read only', N'false'
GO

exec sp_dboption N'BookShop', N'dbo use', N'false'
GO

exec sp_dboption N'BookShop', N'single', N'false'
GO

exec sp_dboption N'BookShop', N'autoshrink', N'true'
GO

exec sp_dboption N'BookShop', N'ANSI null default', N'false'
GO

exec sp_dboption N'BookShop', N'recursive triggers', N'false'
GO

exec sp_dboption N'BookShop', N'ANSI nulls', N'false'
GO

exec sp_dboption N'BookShop', N'concat null yields null', N'false'
GO

exec sp_dboption N'BookShop', N'cursor close on commit', N'false'
GO

exec sp_dboption N'BookShop', N'default to local cursor', N'false'
GO

exec sp_dboption N'BookShop', N'quoted identifier', N'false'
GO

exec sp_dboption N'BookShop', N'ANSI warnings', N'false'
GO

exec sp_dboption N'BookShop', N'auto create statistics', N'true'
GO

exec sp_dboption N'BookShop', N'auto update statistics', N'true'
GO

use [BookShop]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_books_category]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[books] DROP CONSTRAINT FK_books_category
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_customers_distinction]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[customers] DROP CONSTRAINT FK_customers_distinction
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_books_supplier]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[books] DROP CONSTRAINT FK_books_supplier
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_feedback_books1]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[feedback] DROP CONSTRAINT FK_feedback_books1
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_salebook_books]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[salebook] DROP CONSTRAINT FK_salebook_books
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_salebook_customers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[salebook] DROP CONSTRAINT FK_salebook_customers
GO

/****** Object:  Table [dbo].[feedback]    Script Date: 2005-01-17 19:40:55 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[feedback]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[feedback]
GO

/****** Object:  Table [dbo].[salebook]    Script Date: 2005-01-17 19:40:55 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[salebook]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[salebook]
GO

/****** Object:  Table [dbo].[books]    Script Date: 2005-01-17 19:40:55 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[books]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[books]
GO

/****** Object:  Table [dbo].[customers]    Script Date: 2005-01-17 19:40:55 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[customers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[customers]
GO

/****** Object:  Table [dbo].[category]    Script Date: 2005-01-17 19:40:55 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[category]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[category]
GO

/****** Object:  Table [dbo].[distinction]    Script Date: 2005-01-17 19:40:55 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[distinction]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[distinction]
GO

/****** Object:  Table [dbo].[supplier]    Script Date: 2005-01-17 19:40:55 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[supplier]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[supplier]
GO

/****** Object:  Table [dbo].[visit]    Script Date: 2005-01-17 19:40:55 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[visit]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[visit]
GO

/****** Object:  Table [dbo].[vouch]    Script Date: 2005-01-17 19:40:55 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[vouch]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[vouch]
GO

/****** Object:  Login user    Script Date: 2005-01-17 19:40:55 ******/
if not exists (select * from master.dbo.syslogins where loginname = N'user')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'Restaurant', @loginlang = N'简体中文'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'user', null, @logindb, @loginlang
END
GO

/****** Object:  User dbo    Script Date: 2005-01-17 19:40:55 ******/
/****** Object:  Table [dbo].[category]    Script Date: 2005-01-17 19:40:55 ******/
CREATE TABLE [dbo].[category] (
	[idcategory] [int] IDENTITY (1, 1) NOT NULL ,
	[categoryname] [varchar] (20) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[distinction]    Script Date: 2005-01-17 19:40:56 ******/
CREATE TABLE [dbo].[distinction] (
	[iddistinction] [smallint] NOT NULL ,
	[limitprice] [money] NOT NULL ,
	[discount] [float] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[supplier]    Script Date: 2005-01-17 19:40:56 ******/
CREATE TABLE [dbo].[supplier] (
	[idsupplier] [int] IDENTITY (1, 1) NOT NULL ,
	[suppliername] [varchar] (20) NOT NULL ,
	[sname] [varchar] (20) NOT NULL ,
	[phone] [varchar] (20) NOT NULL ,
	[address] [varchar] (80) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[visit]    Script Date: 2005-01-17 19:40:56 ******/
CREATE TABLE [dbo].[visit] (
	[visitid] [int] IDENTITY (1, 1) NOT NULL ,
	[visitip] [varchar] (20) NOT NULL ,
	[degree] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[vouch]    Script Date: 2005-01-17 19:40:56 ******/
CREATE TABLE [dbo].[vouch] (
	[vouchid] [int] IDENTITY (1, 1) NOT NULL ,
	[bookname] [varchar] (50) NOT NULL ,
	[vote] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[books]    Script Date: 2005-01-17 19:40:56 ******/
CREATE TABLE [dbo].[books] (
	[idbook] [varchar] (14) NOT NULL ,
	[idcategory] [int] NOT NULL ,
	[bookname] [varchar] (40) NOT NULL ,
	[author] [varchar] (20) NOT NULL ,
	[idsupplier] [int] NOT NULL ,
	[outday] [datetime] NOT NULL ,
	[details] [ntext] NULL ,
	[cost] [money] NOT NULL ,
	[price] [money] NOT NULL ,
	[imageurl] [varchar] (50) NULL ,
	[stock] [int] NOT NULL ,
	[active] [bit] NOT NULL ,
	[hotdeal] [bit] NOT NULL ,
	[sale] [int] NOT NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[customers]    Script Date: 2005-01-17 19:40:56 ******/
CREATE TABLE [dbo].[customers] (
	[idcustomer] [varchar] (14) NOT NULL ,
	[username] [varchar] (20) NOT NULL ,
	[password] [varchar] (20) NOT NULL ,
	[iddistinction] [smallint] NOT NULL ,
	[phone] [varchar] (20) NOT NULL ,
	[state] [varchar] (20) NOT NULL ,
	[city] [varchar] (20) NOT NULL ,
	[address] [varchar] (80) NOT NULL ,
	[zip] [varchar] (10) NOT NULL ,
	[email] [varchar] (40) NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[feedback]    Script Date: 2005-01-17 19:40:56 ******/
CREATE TABLE [dbo].[feedback] (
	[idbook] [varchar] (14) NOT NULL ,
	[vote] [int] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[salebook]    Script Date: 2005-01-17 19:40:56 ******/
CREATE TABLE [dbo].[salebook] (
	[idsale] [int] IDENTITY (1, 1) NOT NULL ,
	[idbook] [varchar] (14) NOT NULL ,
	[idcustomer] [varchar] (14) NOT NULL ,
	[saletime] [smalldatetime] NOT NULL ,
	[quantity] [int] NOT NULL ,
	[disprice] [money] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[category] WITH NOCHECK ADD 
	CONSTRAINT [PK_category] PRIMARY KEY  CLUSTERED 
	(
		[idcategory]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[distinction] WITH NOCHECK ADD 
	CONSTRAINT [DF_distinction_price] DEFAULT (0) FOR [limitprice],
	CONSTRAINT [DF_distinction_discount] DEFAULT (10) FOR [discount],
	CONSTRAINT [PK_distinction] PRIMARY KEY  CLUSTERED 
	(
		[iddistinction]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[supplier] WITH NOCHECK ADD 
	CONSTRAINT [PK_supplier] PRIMARY KEY  CLUSTERED 
	(
		[idsupplier]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[visit] WITH NOCHECK ADD 
	CONSTRAINT [DF_visit_degree] DEFAULT (1) FOR [degree],
	CONSTRAINT [PK_visit] PRIMARY KEY  CLUSTERED 
	(
		[visitid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[vouch] WITH NOCHECK ADD 
	CONSTRAINT [DF_vouch_vote] DEFAULT (1) FOR [vote],
	CONSTRAINT [PK_vouch] PRIMARY KEY  CLUSTERED 
	(
		[vouchid]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[books] WITH NOCHECK ADD 
	CONSTRAINT [DF_books_idcategory] DEFAULT (0) FOR [idcategory],
	CONSTRAINT [DF_books_stock] DEFAULT (0) FOR [stock],
	CONSTRAINT [DF_books_active] DEFAULT (0) FOR [active],
	CONSTRAINT [DF_books_hotdeal] DEFAULT (0) FOR [hotdeal],
	CONSTRAINT [DF_books_sales] DEFAULT (0) FOR [sale],
	CONSTRAINT [PK_books] PRIMARY KEY  CLUSTERED 
	(
		[idbook]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[customers] WITH NOCHECK ADD 
	CONSTRAINT [DF_customers_distinction] DEFAULT (0) FOR [iddistinction],
	CONSTRAINT [PK_customers] PRIMARY KEY  CLUSTERED 
	(
		[idcustomer]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[feedback] WITH NOCHECK ADD 
	CONSTRAINT [DF_feedback_vote] DEFAULT (0) FOR [vote],
	CONSTRAINT [PK_feedback] PRIMARY KEY  CLUSTERED 
	(
		[idbook]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[salebook] WITH NOCHECK ADD 
	CONSTRAINT [PK_salebook] PRIMARY KEY  CLUSTERED 
	(
		[idsale]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[books] ADD 
	CONSTRAINT [FK_books_category] FOREIGN KEY 
	(
		[idcategory]
	) REFERENCES [dbo].[category] (
		[idcategory]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_books_supplier] FOREIGN KEY 
	(
		[idsupplier]
	) REFERENCES [dbo].[supplier] (
		[idsupplier]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[customers] ADD 
	CONSTRAINT [FK_customers_distinction] FOREIGN KEY 
	(
		[iddistinction]
	) REFERENCES [dbo].[distinction] (
		[iddistinction]
	) ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[feedback] ADD 
	CONSTRAINT [FK_feedback_books1] FOREIGN KEY 
	(
		[idbook]
	) REFERENCES [dbo].[books] (
		[idbook]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [dbo].[salebook] ADD 
	CONSTRAINT [FK_salebook_books] FOREIGN KEY 
	(
		[idbook]
	) REFERENCES [dbo].[books] (
		[idbook]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_salebook_customers] FOREIGN KEY 
	(
		[idcustomer]
	) REFERENCES [dbo].[customers] (
		[idcustomer]
	) ON UPDATE CASCADE 
GO

