/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2000                    */
/* Created on:     2008-8-2 16:22:50                            */
/*==============================================================*/

--创建Ns物流系统数据库
use master

if exists (select *
	    from  sysdatabases
	   where  name = 'NsStorage')
   drop database NsStorage
go

create database NsStorage
go

--应用Ns物流数据库
use NsStorage
go

--创建Ns物流系统数据表
if exists (select 1
            from  sysobjects
           where  id = object_id('AfficheInfo')
            and   type = 'U')
   drop table AfficheInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BillInfo')
            and   type = 'U')
   drop table BillInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BillState')
            and   type = 'U')
   drop table BillState
go

if exists (select 1
            from  sysobjects
           where  id = object_id('BranchInfo')
            and   type = 'U')
   drop table BranchInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CargoVector')
            and   type = 'U')
   drop table CargoVector
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CargoInfo')
            and   type = 'U')
   drop table CargoInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CustomerInfo')
            and   type = 'U')
   drop table CustomerInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Department')
            and   type = 'U')
   drop table Department
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DirverInfo')
            and   type = 'U')
   drop table DirverInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('RoleInfo')
            and   type = 'U')
   drop table RoleInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SystemLog')
            and   type = 'U')
   drop table SystemLog
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TrafficLog')
            and   type = 'U')
   drop table TrafficLog
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TruckInfo')
            and   type = 'U')
   drop table TruckInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TruckLog')
            and   type = 'U')
   drop table TruckLog
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TruckModel')
            and   type = 'U')
   drop table TruckModel
go

if exists (select 1
            from  sysobjects
           where  id = object_id('UserInfo')
            and   type = 'U')
   drop table UserInfo
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Operation')
            and   type = 'U')
   drop table Operation
go

/*==============================================================*/
/* Table: Operation       操作链接表                            */
/*==============================================================*/
create table Operation (
   OpID		        int		    identity,
   OpFID		int		    null,
   OpName		varchar(100)	    null,
   OpUrl		varchar(300)	    null,
   constraint PK_OPERATION primary key (OpID)
)
go

/*==============================================================*/
/* Table: AfficheInfo     站内公告表                            */
/*==============================================================*/
create table AfficheInfo (
   AffichelD            int                  identity,
   UserID               int                  null,
   AfficheTitle         varchar(100)         null,
   AfficheContent       varchar(2000)        null,
   AfficheData          varchar(100)         null,
   BranchID             int                  null,
   constraint PK_AFFICHEINFO primary key (AffichelD)
)
go

/*==============================================================*/
/* Table: BillInfo       货票信息表                             */
/*==============================================================*/
create table BillInfo (
   BillID               int                  identity(100000,1),
   SendID               int                  null,
   ReceiveID            int                  null,
   TruckLine            varchar(100)         null,
   PayerName            varchar(100)         null,
   UserID               int                  null,
   BillData             varchar(100)         null,
   BillStateID          int                  null,
   BillMemo             varchar(500)         null,
   SendBranchID         int                  null,
   ReceiveBranchID	int		     null,
   constraint PK_BILLINFO primary key (BillID)
)
go

/*==============================================================*/
/* Table: BillState       货票状态表                           */
/*==============================================================*/
create table BillState (
   BillStateID          int                  identity(1000,1),
   BillStateName        varchar(100)         null,
   constraint PK_BILLSTATE primary key (BillStateID)
)
go

/*==============================================================*/
/* Table: BranchInfo     分公司(仓库)表                         */
/*==============================================================*/
create table BranchInfo (
   BranchID             int                  identity(100,1),
   BranchName           varchar(100)         null,
   BranchLinkMan        varchar(100)         null,
   BranchPhone          varchar(100)         null,
   BranchAddress        varchar(100)         null,
   BranchEmail          varchar(100)         null,
   constraint PK_BRANCHINFO primary key (BranchID)
)
go

/*==============================================================*/
/* Table: CargoInfo      货物信息表                             */
/*==============================================================*/
create table CargoInfo (
   CargoID              int                  identity(1000,1),
   CargoName            varchar(100)         null,
   CargoWeight          varchar(100)         null,
   CargoBulk            varchar(100)         null,
   CargoNum             varchar(100)         null,
   CargoUnit            varchar(100)         null,
   CargoValue           varchar(100)         null,
   CargoFreight         varchar(100)         null,
   CargoAmends          varchar(100)         null,
   CargoMemo            varchar(100)         null,
   CargoState		int		     default 0,
   BranchID             int                  null,
   CargoStartData	varchar(100)	     null,
   CargoEndData		varchar(100)	     null
   constraint PK_CARGOINFO primary key (CargoID)
)
go

/*==============================================================*/
/* Table: CargoVector    货物集合表                             */
/*==============================================================*/
create table CargoVector(
   CVID              int                  identity(1000,1),
   CargoID           int		  null,
   BillID            int		  null
   constraint PK_CARGOVECTOR primary key (CVID)
)
go

/*==============================================================*/
/* Table: CustomerInfo    客户信息表                            */
/*==============================================================*/
create table CustomerInfo (
   CustomerID           int                  identity(1000,1),
   CustomerName         varchar(100)         null,
   CustomerLinkMan      varchar(100)         null,
   CustomerSex          varchar(100)         null,
   CustomerPhone        varchar(100)         null,
   CustomerFax          varchar(100)         null,
   CustomerPostID       varchar(100)         null,
   CustomerEmail        varchar(100)         null,
   CustomerRegData      varchar(100)         null,
   BranchID             int                  null,
   constraint PK_CUSTOMERINFO primary key (CustomerID)
)
go

/*==============================================================*/
/* Table: DepartmentInfo    部门信息表                          */
/*==============================================================*/
create table DepartmentInfo (
   DepartmentID         int                  identity,
   DepartmentName       varchar(100)         null,
   constraint PK_DEPARTMENT primary key (DepartmentID)
)
go

/*==============================================================*/
/* Table: DriverInfo    司机信息表                              */
/*==============================================================*/
create table DriverInfo (
   DriverID             int                  identity(1000,1),
   BranchID             int                  null,
   DriverName           varchar(100)         null,
   DriverAge            varchar(100)         null,
   DriverSex            varchar(100)         null,
   DriverPhoto          varchar(100)         null,
   DriverDriveCardID    varchar(100)         null,
   DriverCardID         varchar(100)         null,
   DriverPhone          varchar(100)         null,
   DriverMemo           varchar(500)         null,
   DriverIsVacancy      int                  default 0,
   constraint PK_DIRVERINFO primary key (DriverID)
)
go

/*==============================================================*/
/* Table: RoleInfo     角色信息表                               */
/*==============================================================*/
create table RoleInfo (
   RoleID               int                  identity(1000,1),
   RoleName             varchar(100)         null,
   RoleClient           int                  default 0,
   RoleTicket           int                  default 0,
   RoleBranch           int                  default 0,
   RoleTraffic          int                  default 0,
   RoleQuery            int                  default 0,
   RoleBasicInfo        int                  default 0,
   constraint PK_ROLEINFO primary key (RoleID)
)
go

/*==============================================================*/
/* Table: SystemLog    系统日志表                               */
/*==============================================================*/
create table SystemLog (
   SystemLogID          int                  identity,
   UserID               int                  null,
   SystemLogMemo        varchar(100)         null,
   BranchID             int                  null,
   constraint PK_SYSTEMLOG primary key (SystemLogID)
)
go

/*==============================================================*/
/* Table: TrafficLog    运输记录表(关系表)                      */
/*==============================================================*/
create table TrafficLog (
   TrafficLogID         int                  identity,
   BillID               int                  null,
   TLID                 int                  null,
   BranchID             int                  null,
   constraint PK_TRAFFICLOG primary key (TrafficLogID)
)
go

/*==============================================================*/
/* Table: TruckInfo    车辆信息表                               */
/*==============================================================*/
create table TruckInfo (
   TruckID              int                  identity(1000,1),
   TruckNum             varchar(100)         null,
   TruckEngineNum       varchar(100)         null,
   TruckRunNum          varchar(100)         null,
   TruckInsuranceNum    varchar(100)         null,
   TMID                 int                  null,
   TruckColor           varchar(100)         null,
   TruckPhoto           varchar(100)         null,
   TruckBuyData         varchar(100)         null,
   BranchID             int                  null,
   TruckIsVacancy       int                  default 0,
   constraint PK_TRUCKINFO primary key (TruckID)
)
go

/*==============================================================*/
/* Table: TruckLog     车次信息表                               */
/*==============================================================*/
create table TruckLog (
   TLID                 int                  identity(1000,1),
   DriverID             int                  null,
   TruckID              int                  null,
   TLStartData          varchar(100)         null,
   TLArrive             varchar(100)         null,
   BranchID             int                  null,
   constraint PK_TRUCKLOG primary key (TLID)
)
go

/*==============================================================*/
/* Table: TruckModel   车辆型号信息表                           */
/*==============================================================*/
create table TruckModel (
   TMID                 int                  identity,
   TMName               varchar(100)         null,
   TMWeight             varchar(100)         null,
   TMCubage             varchar(100)         null,
   TMPassenger          int                  default 2,
   constraint PK_TRUCKMODEL primary key (TMID)
)
go

/*==============================================================*/
/* Table: UserInfo     用户信息表                               */
/*==============================================================*/
create table UserInfo (
   UserID               int                  identity(10000,1),
   BranchID             int                  null,
   UserName             varchar(100)         null,
   UserRName            varchar(100)         null,
   UserPassword         varchar(100)         null,
   UserSex              varchar(100)         null,
   DepartmentID         int                  null,
   UserPhone            varchar(100)         null,
   UserCardID           varchar(100)         null,
   RoleID               int                  null,
   UserLoginNum         varchar(100)         default 0,
   UserLoginData        varchar(100)         null,
   UserRegData          varchar(100)         null,
   constraint PK_USERINFO primary key (UserID)
)
go

/*==============================================================*/
/* 建立主外键关系                                               */
/*==============================================================*/

--建立用户信息表与分公司(仓库)表,部门表以及角色信息表之间的主外键关系
alter table UserInfo add constraint fk_UI_BranchID foreign key (BranchID) references BranchInfo(BranchID)

alter table UserInfo add constraint fk_UI_DepartmentID foreign key (DepartmentID) references DepartmentInfo(DepartmentID)

alter table UserInfo add constraint fk_UI_RoleID foreign key (RoleID) references RoleInfo(RoleID)
go

--建立客户信息表与分公司(仓库)表之间的主外键关系
alter table CustomerInfo add constraint fk_CI_BranchID foreign key (BranchID) references BranchInfo(BranchID)
go

--建立车辆信息表与车辆型号信息表以及分公司(仓库)表之间的主外键关系
alter table TruckInfo add constraint fk_TI_TMID foreign key (TMID) references TruckModel(TMID)

alter table TruckInfo add constraint fk_TI_BranchID foreign key (BranchID) references BranchInfo(BranchID)
go

--建立司机信息表与分公司(仓库)表之间的主外键关系
alter table DriverInfo add constraint fk_DI_BranchID foreign key (BranchID) references BranchInfo(BranchID)
go

--建立车次信息表与司机信息表，车辆信息表以及分公司(仓库)表之间的主外键关系
alter table TruckLog add constraint fk_TL_DriverID foreign key (DriverID) references DriverInfo(DriverID)

alter table TruckLog add constraint fk_TL_TruckID foreign key (TruckID) references TruckInfo(TruckID)

alter table TruckLog add constraint fk_TL_BranchID foreign key (BranchID) references BranchInfo(BranchID)
go

--建立货物信息表与分公司(仓库)表之间的主外键关系
alter table CargoInfo add constraint fk_CargoInfo_BranchID foreign key (BranchID) references BranchInfo(BranchID)
go

--建立货物集合表与货物信息表之间的主外键关系
alter table CargoVector add constraint fk_CargoVector_CargoInfo foreign key (CargoID) references CargoInfo(CargoID)
alter table CargoVector add constraint fk_CargoVector_BillInfo foreign key (BillID) references BillInfo(BillID)

--建立货票信息表与货物信息表，客户表(两条主外键关系),用户信息表,货票状态表以及分公司(仓库)表(两条主外键关系)之间的主外键关系
alter table BillInfo add constraint fk_BI_SendID foreign key (SendID) references CustomerInfo(CustomerID)

alter table BillInfo add constraint fk_BI_ReceiveID foreign key (ReceiveID) references CustomerInfo(CustomerID)

alter table BillInfo add constraint fk_BI_UserID foreign key (UserID) references UserInfo(UserID)

alter table BillInfo add constraint fk_BI_BillStateID foreign key (BillStateID) references BillState(BillStateID)

alter table BillInfo add constraint fk_BI_SendBranchID foreign key (SendBranchID) references BranchInfo(BranchID)

alter table BillInfo add constraint fk_BI_ReceiveBranchID foreign key (ReceiveBranchID) references BranchInfo(BranchID)
go

--建立运输记录表与货票信息表，车次信息表已经分公司(仓库)表之间的主外键关系
alter table TrafficLog add constraint fk_TrafficLog_BillID foreign key (BillID) references BillInfo(BillID)

alter table TrafficLog add constraint fk_TrafficLog_TLID foreign key (TLID) references TruckLog(TLID)

alter table TrafficLog add constraint fk_TrafficLog_BranchID foreign key (BranchID) references BranchInfo(BranchID)
go

--建立站内公告表与用户信息表以及分公司(仓库)表之间的主外键关系
alter table AfficheInfo add constraint fk_AI_UserID foreign key (UserID) references UserInfo(UserID)

alter table AfficheInfo add constraint fk_AI_BranchID foreign key (BranchID) references BranchInfo(BranchID)
go

--建立系统日志表与用户信息表以及分公司(仓库)表之间的主外键关系
alter table SystemLog add constraint fk_SL_UserID foreign key (UserID) references UserInfo(UserID)

alter table SystemLog add constraint fk_SL_BranchID foreign key (BranchID) references BranchInfo(BranchID)
go

/*==============================================================*/
/* 添加系统基础信息                                             */
/*==============================================================*/

--添加操作链接表信息
insert into Operation values(0,'客户服务','http://localhost:8080/prjNsLogistics/#')
insert into Operation values(0,'仓库管理','http://localhost:8080/prjNsLogistics/#')
insert into Operation values(0,'物流运输','http://localhost:8080/prjNsLogistics/#')
insert into Operation values(0,'综合查询','http://localhost:8080/prjNsLogistics/#')
insert into Operation values(0,'系统设置','http://localhost:8080/prjNsLogistics/#')
insert into Operation values(0,'分公司业绩统计','../jfreeCharBranch.do')

insert into Operation values(1,'客户录入','../Yasak/Yasak_CustomerInfo.html')
insert into Operation values(1,'客户查询','../Mars/CustomerResult.html')
insert into Operation values(1,'新增业务','../Yasak/BillInfo.html')
insert into Operation values(1,'业务操作','../Yasak/MainTags.html')
insert into Operation values(1,'公告发布','../Yasak/Affiche.html')

insert into Operation values(2,'货物信息列表','../Moster/MoCargoList.html')
insert into Operation values(2,'货物集合列表','../Moster/MoCargoVCList.html')
insert into Operation values(2,'入货签收','../Moster/MoBillList.html')
insert into Operation values(2,'到岸调度','../Moster/MoTraBillList.html')
insert into Operation values(2,'入库清点','../Moster/MoBillCheckList.html')
insert into Operation values(2,'调度分拣','../Moster/MoSortingBillList.html')
insert into Operation values(2,'仓库出库','CargoTidy.html')
insert into Operation values(2,'仓库查询','../Moster/MoCargoSelectList.html')

insert into Operation values(3,'调度管理','TruckInfo.html')
insert into Operation values(3,'调度查询','../Mars/BillshareResult.html')

insert into Operation values(4,'客户查询','../Mars/CustomerResult.html')
insert into Operation values(4,'仓库查询','../Mars/BranchResult.html')
insert into Operation values(4,'调度查询','../Mars/BillshareResult.html')
insert into Operation values(4,'车辆查询','../Mars/TruckResult.html')
insert into Operation values(4,'人员查询','../Mars/UserResult.html')
insert into Operation values(4,'司机查询','../Mars/DriverResult.html')
insert into Operation values(4,'业务查询','../Mars/BillsResult.html')
insert into Operation values(4,'客户统计','../jfreeCharCustomer.do')

insert into Operation values(5,'车辆型号管理','../Carmack/TruckModel.html')
insert into Operation values(5,'车辆信息管理','../Carmack/TruckInfo.html')
insert into Operation values(5,'员工信息管理','../Carmack/UserInfo.html')
insert into Operation values(5,'司机信息管理','../Carmack/DriverInfo.html')
insert into Operation values(5,'公司信息管理','../Carmack/BranchInfo.html')
insert into Operation values(5,'系统日志查看','../Carmack/SystemLog.html')


--添加角色信息表信息
insert into RoleInfo values('超级管理员',1,1,1,1,1,1)
insert into RoleInfo values('客户服务人员',1,0,0,0,0,0)
insert into RoleInfo values('仓库管理人员',0,0,1,0,0,0)
insert into RoleInfo values('配送管理人员',0,0,0,1,0,0)
insert into RoleInfo values('经理',1,1,1,1,1,1)
insert into RoleInfo values('业务督察人员',0,0,0,0,1,0)
go

--添加分公司(仓库)表信息
insert into BranchInfo values('盛唐物流','李耳','01086030618','北京市长安街211号','opt-China@163.com')
insert into BranchInfo values('龙城仓储中心','李世民','03516030618','山西省太原市迎泽大街211号','opt-Taiyuan@163.com')
insert into BranchInfo values('古城仓储中心','许巍','02985855485','陕西省西安市光华路211号','opt-Xian@163.com')
insert into BranchInfo values('黑土地仓储中心','赵本山','04316031679','吉林省长春市人民大道211号','opt-Changchun@163.com')
insert into BranchInfo values('稽郡仓储中心','周迅','05707025888','浙江杭州石桥路211号','opt-Hangzhou@163.com')
insert into BranchInfo values('天府仓储中心','诸葛亮','02875241156','四川省成都市金泉路211号','opt-Chengdu@163.com')
insert into BranchInfo values('罗布泊仓储中心','李白','09716031188','青海省西宁市南关街211号','opt-Qinghai@163.com')
go

--添加公司部门表信息
insert into DepartmentInfo values('客服部')
insert into DepartmentInfo values('仓储部')
insert into DepartmentInfo values('配送部')
insert into DepartmentInfo values('经理办公室')
insert into DepartmentInfo values('其他')
go

--添加用户信息表信息
insert into UserInfo values(101,'admin','胡哥','123','男',5,'13572275851','14010819580603195x',1000,'0','2008-08-01','2008-08-02')
insert into UserInfo values(101,'client','业务员','123','男',1,'13572275852','14010819580604195x',1001,'0','2008-08-01','2008-08-02')
insert into UserInfo values(101,'branch','搬货的','123','男',2,'13572275854','14010819580606195x',1002,'0','2008-08-01','2008-08-02')
insert into UserInfo values(101,'traffic','开车的','123','男',3,'13572275855','14010819580607195x',1003,'0','2008-08-01','2008-08-02')
insert into UserInfo values(101,'manager','经理','123','男',4,'13572275856','14010819580608195x',1004,'0','2008-08-01','2008-08-02')
insert into UserInfo values(100,'oversee','总公司督察','123','男',5,'13572275857','14010819580609195x',1005,'0','2008-08-01','2008-08-02')
go

--添加客户信息表信息
insert into CustomerInfo values('突厥乳业集团','突利大汗','男','07328726394','07328726395','410000','TuJv@163.com','2008-08-02',101)
insert into CustomerInfo values('越女剑矿产集团','苗人凤','女','03728726394','03728726395','140000','Yvnv@163.com','2008-08-02',101)
insert into CustomerInfo values('同福客栈','佟湘玉','女','0298726394','0298726395','710000','Tfkz@163.com','2008-08-02',101)
insert into CustomerInfo values('不同福客栈','湘佟玉','女','0298726394','0298726395','710000','Tfkz@163.com','2008-08-02',101)
insert into CustomerInfo values('明觉寺保镖公司','朱重八','男','0298726394','0298726395','170000','Mjs@163.com','2008-08-02',101)
insert into CustomerInfo values('同不福客栈','佟玉湘','女','0298726394','0298726395','710000','Tfkz@163.com','2008-08-02',101)
insert into CustomerInfo values('同福不客栈','湘玉佟','女','0298726394','0298726395','710000','Tfkz@163.com','2008-08-02',101)
go

--添加货物信息表信息
insert into CargoInfo values('曼联真品训练服','5','50','100','1','240','8000','2000','夏季训练','0',101,'20080817','')
insert into CargoInfo values('大众布加迪威龙','5','50','100','1','240','8000','2000','好车','0',101,'20080817','')
insert into CargoInfo values('郑智战靴','5','50','100','1','240','8000','2000','真臭','0',101,'20080817','')
insert into CargoInfo values('奥运福娃','5','50','100','1','240','8000','2000','吉祥物','0',101,'20080817','')
insert into CargoInfo values('神舟七号','5','50','100','1','240','8000','2000','好东西','0',101,'20080817','')
insert into CargoInfo values('和氏璧','5','50','100','1','240','8000','2000','宝玉','0',101,'20080817','')
insert into CargoInfo values('神农尺','5','50','100','1','240','8000','2000','神器','0',101,'20080817','')
insert into CargoInfo values('轩辕剑','5','50','100','1','240','8000','2000','神器','0',101,'20080817','')
insert into CargoInfo values('葵花点穴手图谱','5','50','100','1','240','8000','2000','武功秘笈','0',101,'20080817','')
insert into CargoInfo values('武林外传周边','5','50','100','1','240','8000','2000','动漫周边','0',101,'20080817','')
insert into CargoInfo values('百威啤酒','5','50','100','1','240','8000','2000','好喝','0',101,'20080817','')
go

--添加货票状态表信息
insert into BillState values('Send_客服已接单,等待入库')
insert into BillState values('Send_入库已确认')
insert into BillState values('Send_货物清点完毕，等待调度')
insert into BillState values('Send_调度装配完毕,货已发出')
insert into BillState values('Receive_货已到岸,未签收')
insert into BillState values('Receive_货已签收,未入库')
insert into BillState values('Receive_分拣完毕,已入库')
insert into BillState values('Receive_客服通知客户,等待提货')
insert into BillState values('Receive_客户验收,付款提货')
go

--添加货票信息表信息
insert into BillInfo values(1000,1001,'太原-杭州','宋缺',10000,'20080816',1001,'破冰之旅',101,105)
go

--添加货物集合表信息
insert into CargoVector values(1000,100000)
insert into CargoVector values(1001,100000)
insert into CargoVector values(1002,100000)
insert into CargoVector values(1003,100000)
go

--添加车辆型号信息表信息
insert into TruckModel values('卡马兹Kamaz','40','80',3)
insert into TruckModel values('太脱拉Tatra','30','70',2)
insert into TruckModel values('解放Faw','25','65',2)
insert into TruckModel values('福田Foton','15','40',1)
go

--添加车辆信息表信息
insert into TruckInfo values('晋A00286','KA4837448936','86999','ST597896777',1,'红色','http://localhost:8000/update/photo/car/xxx','2008-07-13',101,0)
insert into TruckInfo values('晋A00287','TT4837448936','87000','ST597896778',2,'白色','http://localhost:8000/update/photo/car/xxx','2008-07-13',101,0)
insert into TruckInfo values('晋A00288','Fa4837448936','87001','ST597896779',3,'银色','http://localhost:8000/update/photo/car/xxx','2008-07-13',101,0)
insert into TruckInfo values('晋A00289','FO4837448936','87002','ST597896780',4,'蓝色','http://localhost:8000/update/photo/car/xxx','2008-07-13',101,0)
go

--添加司机信息表信息
insert into DriverInfo values(101,'詹姆斯邦德','35','男','http://localhost:8000/update/photo/driver/xxx','DC140108198506031952','140108198506031952','13575578547','特技驾驶员',0)
insert into DriverInfo values(101,'小马哥','34','男','http://localhost:8000/update/photo/driver/xxx','DC140108198506031953','140108198506031953','13575578548','特技驾驶员',0)
insert into DriverInfo values(101,'韩寒','24','男','http://localhost:8000/update/photo/driver/xxx','DC140108198506031954','140108198506031954','13575578549','特技驾驶员',0)
go

--添加公告信息表信息
insert into AfficheInfo values(10000,'龙门大吉','热烈庆祝龙门镖局开业大吉！','20080803',101)
insert into AfficheInfo values(10000,'欢迎新客户','热烈欢迎突厥乳业成为我公司第一位客户！','20080803',101)
insert into AfficheInfo values(10000,'欢迎新客户','热烈欢迎越女剑矿业成为我公司第二位客户！','20080804',101)
insert into AfficheInfo values(10000,'欢迎新客户','热烈欢迎同福客栈成为我公司第三位客户！','20080805',101)
insert into AfficheInfo values(10000,'欢迎新客户','热烈欢迎不同福客栈成为我公司第四位客户！','20080806',101)
insert into AfficheInfo values(10000,'奥运喝彩','热烈庆祝北京奥运会开幕','20080808',101)
insert into AfficheInfo values(10000,'首金诞生','恭贺女子举重队为中国奥运代表队勇夺首金','20080809',101)
insert into AfficheInfo values(10000,'雄霸奥运金牌榜','中国奥运代表团力压众多劲敌在金牌榜中独占鳌头','20080810',101)
insert into AfficheInfo values(10000,'突破100','随之拳击金牌的诞生，我国奥运军团已经为祖国勇夺100枚奥运奖牌','20080824',101)
go

/*==============================================================*/
/* 查询数据库所有信息                                           */
/*==============================================================*/
select * from UserInfo
select * from RoleInfo
select * from BranchInfo
select * from DepartmentInfo
select * from CustomerInfo
select * from TruckModel
select * from TruckInfo
select * from DriverInfo
select * from TruckLog
select * from CargoInfo
select * from BillState
select * from BillInfo
select * from TrafficLog
select * from AfficheInfo
select * from CargoVector
select * from SystemLog
select * from Operation
go










