use master
go
--在D盘建一个文件夹

--建数据库
if exists(select * from sysdatabases where name='Eatery_DB')
drop database Eatery_DB
go
create database Eatery_DB                 
on
(
	name = Eatery_DB_dat,
	filename = 'C:\Eatery_DB.mdf',
	size = 1MB,
	maxsize = 100MB,
	filegrowth = 1%
)
log on 
(
	name = Eatery_DB_log,
	filename = 'C:\Eatery_DB.ldf',
	size = 1MB,
	maxsize = 100MB,
	filegrowth = 1%
)
go

use Eatery_DB
go


--创建管理员表--

if exists (select * from sysobjects where name='ManageInfo')
drop table ManageInfo
go
create table ManageInfo
(
	m_id      int primary key identity(1,1) not null,   	--管理员id
	m_name    varchar(20) not null,		      	    	--姓名
	m_pass	  varchar(50) not null,				--密码	
	m_age	  int ,				      	    	--年龄	
	m_sex 	  int ,				      		--性别(1代表男，2代表女)
	m_tel     varchar(20),			     		--联系电话
	m_address varchar(150),			      		--住址
	m_email	  varchar(50)			      		--电子邮件
)
go

--创建用户表

if exists (select * from sysobjects where name='UserInfo')
drop table UserInfo
go
create table UserInfo
(
	u_id      int primary key identity(1,1) not null,   	--用户id
	u_name    varchar(20) not null,		      	    	--用户名
	u_pass	  varchar(50) not null,				--密码	
	u_realName varchar(20),					--真实姓名
	u_paperCode varchar(50),				--证件号码 
	u_age	  int ,				      	    	--年龄	
	u_sex 	  int ,				      		--性别(1代表男，2代表女)
	u_tel     varchar(20),			     		--联系电话
	u_address varchar(150),			      		--住址
	u_email	  varchar(50)			      		--电子邮件
)
go

--创建积分表
if exists (select * from sysobjects where name='Credit')
drop table Credit
go
create table Credit
(
	c_id	 int primary key identity(1,1) not null,   	--积分id
	u_id	 int,						--用户id(外键)
	u_count	 int						--积分数			
)


--创建企业表
if exists (select * from sysobjects where name='EnterpriseInfo')
drop table EnterpriseInfo
go
create table EnterpriseInfo
(
	e_id      int primary key identity(1,1) not null,   	--企业id
	e_name    varchar(20) not null,		      	    	--用户名
	e_pass	  varchar(50) not null,				--密码	
	e_companyName varchar(50),				--公司名称
	e_linkMan varchar(50),					--联系人 
	e_tel     varchar(20),			     		--联系电话
	e_address varchar(150),			      		--地址
	e_email	  varchar(50),			      		--电子邮件
)
go

--创建餐饮大分类表
if exists (select * from sysobjects where name='FoodBigType')
drop table FoodBigType
go
create table FoodBigType
(
	fbt_id 	int primary key identity(1,1) not null,   		--餐饮大分类id
	fbt_name	varchar(50) not null				--大分类名称  
)
go

--创建餐饮小分类表
if exists (select * from sysobjects where name='FoodSmallType')
drop table FoodSmallType
go
create table FoodSmallType
(
	fst_id	 	int primary key identity(1,1) not null,		--餐饮类型id
	fst_name	varchar(50) not null,				--小分类名称
	fbt_id  	int						--大分类id
)
go


--创建餐饮表
if exists (select * from sysobjects where name='FoodInfo')
drop table FoodInfo
go
create table FoodInfo
(
	f_id 	int primary key identity(1,1) not null,   	--餐饮id
	f_name  varchar(50) not null,				--餐饮名称
	f_price money not null,					--餐饮单价
	fst_id  int,	 					--餐饮类型(外键)
	f_from  varchar(50), 					--产地
	f_image varchar(50),   					--图标
	f_state int,						--餐饮的状态(0代表原始状态，1代表设置为最新推荐,代表2代表设置为热买菜品,) 
	e_id 	int,						--所属企业(外键)
	f_date	datetime	 				--餐饮时间
)
go

--订单主表
if exists (select * from sysobjects where name='OrderInfo')
drop table OrderInfo
go
create table OrderInfo
(
	o_id	int primary key identity(1,1) not null,		--订单主表id
	f_id	int,						--餐饮id(外键)
	o_count int,						--数量
	u_id	int,						--用户id(外键)
	e_id	int,						--企业id(外键)
	o_state int,						--定单状态(1.未完成,2.已完成)
	o_time	datetime					--订单时间					 	 
)
go

--订单附表
if exists (select * from sysobjects where name='OrderAccessorily')
drop table OrderAccessorily
go
create table OrderAccessorily
(
	oa_id	int primary key identity(1,1) not null,		--订单附表id
	o_id	int,						--订单主表id(外键)
	oa_totalprice money					--商品总价 
)
go

--创建投诉表
if exists (select * from sysobjects where name='ComplainInfo')
drop table ComplainInfo
go
create table ComplainInfo
(
	ci_id	int primary key identity(1,1) not null,		--投诉表id
	ci_idea	varchar(200),					--投诉意见
	u_id	int 						--用户id
	
)


--------------------------------向各表添加关系--------------------------------------


--积分表与用户表之间的关系
alter table Credit add
constraint FK_CUID foreign key(u_id)  references  UserInfo(u_id)


--餐饮表与餐饮类型表,所属企业表之间的关系
alter table FoodInfo add
constraint FK_FSTID foreign key(fst_id)  references  FoodSmallType(fst_id),
constraint FK_FEID foreign key(e_id)  references  EnterpriseInfo(e_id)



--订单主表与用户表、餐饮表之间,企业表的关系
alter table OrderInfo add
constraint FK_OUID foreign key(u_id)  references  UserInfo(u_id),
constraint FK_OFID foreign key(f_id)  references  FoodInfo(f_id),
constraint FK_OEID foreign key(e_id)  references  EnterpriseInfo(e_id)

--餐饮小分类与餐饮大分类之间的关系
alter table FoodSmallType add
constraint FK_FBTID foreign key(fbt_id)  references  FoodBigType(fbt_id)

--投诉表与用户表之间的关系
alter table ComplainInfo add
constraint FK_CIUID foreign key(u_id)  references  UserInfo(u_id)

---------------------------------向各表添加测试数据------------------------------------------


--管理员表
insert into ManageInfo values ('admin','admin',20,1,'88888888','西安市东郊青龙寺','henryyuangang@163.com')

select * from ManageInfo


--用户表
insert into UserInfo values ('zhangsan','202CB962AC59075B964B07152D234B70','张三','010123456789',20,1,'66666666','西安市东大街26#','zhangsan@163.com')
select * from UserInfo


--企业表
insert into EnterpriseInfo values ('华为1','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为2','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为3','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为4','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为5','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为6','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为7','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为8','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为9','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为10','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为11','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为12','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为13','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
insert into EnterpriseInfo values ('华为14','202CB962AC59075B964B07152D234B70','化为科技有限公司','李四','55555555','西安市科技街56#','huawei126.com')
select * from EnterpriseInfo

--积分表
insert into Credit values (1,20)

select * from Credit

--餐饮大分类表

insert into FoodBigType values ('快餐')
insert into FoodBigType values ('中餐')
insert into FoodBigType values ('西餐')
insert into FoodBigType values ('日餐')
insert into FoodBigType values ('韩餐')

select * from FoodBigType

--餐饮小分类表
insert into FoodSmallType values ('汉堡',1)
insert into FoodSmallType values ('面食',1)
insert into FoodSmallType values ('饺子',1)
insert into FoodSmallType values ('混沌',1)
insert into FoodSmallType values ('包子',1)
insert into FoodSmallType values ('盒饭',1)
insert into FoodSmallType values ('米线',1)
insert into FoodSmallType values ('川菜',2)
insert into FoodSmallType values ('鲁菜',2)
insert into FoodSmallType values ('徽菜',2)
insert into FoodSmallType values ('火锅',2)
insert into FoodSmallType values ('东北菜',2)
insert into FoodSmallType values ('湘菜',2)

select * from  FoodSmallType


--餐饮表

insert into FoodInfo values ('宫暴鸡叮',3.50,1,'西安','food/image/xgongbaojiding.gif',1,1,'2006-7-6')
insert into FoodInfo values ('锅保肉',3.50,1,'西安','food/image/xguobaorou.gif',1,1,'2006-6-2')
insert into FoodInfo values ('家常吨菜',13.50,4,'台北','food/image/xjiachangduncai.gif',1,1,'2006-6-4')
insert into FoodInfo values ('变牛肉',13.50,4,'台北','food/image/xbanniurou.gif',1,1,'2006-2-6')
insert into FoodInfo values ('红烧排骨',13.50,4,'台北','food/image/200652315121638498.jpg',2,1,'2006-3-6')
insert into FoodInfo values ('火腿汉堡',13.50,4,'台北','food/image/20065109373618555.jpg',2,1,'2006-6-9')
insert into FoodInfo values ('糖醋里脊',13.50,4,'台北','food/image/20065109344051414.jpg',2,1,'2006-6-26')
insert into FoodInfo values ('红烧豆腐',13.50,4,'台北','food/image/2006381002495861.jpg',2,1,'2006-6-16')
insert into FoodInfo values ('籽然牛肉',13.50,4,'台北','food/image/xziranniurou.gif',2,1,'2006-6-12')
insert into FoodInfo values ('樱桃肉',13.50,4,'台北','food/image/xyingtaorou.gif',2,1,'2006-6-21')

select * from FoodInfo order by f_date desc

--投诉表
insert into ComplainInfo values('sfs',1)
select * from ComplainInfo



--定单表

insert into orderinfo values (2,3,1,1,1,'2008-7-5')
insert into orderinfo values (1,20,1,1,2,'2008-7-5')

select * from orderinfo

	
select * from foodbigtype



 