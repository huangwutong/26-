USE PowerMusic
go
/* -- Creating Objects for PowerMusic*/

raiserror('Now at the create table section ....',0,1)
Go

if exists (select * from dbo.sysobjects where id = object_id(N'FK_NewsInfo') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE NewsInfo DROP CONSTRAINT FK_NewsInfo
go

if exists (select * from dbo.sysobjects where id = object_id(N'FK_MusicInfo') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE MusicInfo DROP CONSTRAINT FK_MusicInfo
go

if exists (select * from dbo.sysobjects where id = object_id(N'FK_MessageInfo') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE MessageInfo DROP CONSTRAINT FK_MessageInfo
go

if exists(select * from dbo.sysobjects where name = 'UserInfo')
drop table UserInfo
go

if exists(select * from dbo.sysobjects where name = 'AdminInfo')
drop table AdminInfo
go

if exists(select * from dbo.sysobjects where name = 'MessageInfo')
drop table MessageInfo
go

if exists(select * from dbo.sysobjects where name = 'MusicInfo')
drop table MusicInfo
go

if exists(select * from dbo.sysobjects where name = 'SingerInfo')
drop table SingerInfo
go

if exists(select * from dbo.sysobjects where name = 'NewsInfo')
drop table NewsInfo
go

if exists(select * from dbo.sysobjects where name = 'dbMusicInfo')
drop table dbMusicInfo
go

if exists(select * from dbo.sysobjects where name = 'sp_getpage')
drop Procedure sp_getpage

go

raiserror('Creating table UserInfo....',0,1)
create table UserInfo
(
  UserID int IDENTITY(1,1),
  UserName varchar(30) constraint PK_UserInfo primary key,
  UserPassword varchar(30) not null,
  UserEmail varchar(100) not null constraint UN_EMAIL unique,
  UserSex varchar(10) not null,
  UserQQ varchar(30) null,
  UserRule int default 0, 
  RegTime datetime default(getdate())
)
go

raiserror('Creating table AdminInfo....',0,1)
create table AdminInfo
(
  AdminID int IDENTITY(1,1),
  AdminName varchar(30) constraint PK_AdminInfo primary key,
  AdminPassword varchar(30) not null,
  RegTime datetime default(getdate())
)
go

raiserror('Creating  table MusicInfo....',0,1)
create table MusicInfo
(
  MusicID int IDENTITY(1,1),
  MusicName varchar(30) not null,
  MusicType varchar(30) not null,
  SingerName varchar(30) not null,
  SubmitTime datetime default(getdate())
)
GO

raiserror('Creating  table SingerInfo....',0,1)
create table SingerInfo
(
  SingerID int IDENTITY(1,1),
  SingerName varchar(30) constraint PK_SingerInfo primary key,
  SingerSex varchar(30)
)
GO

raiserror('Creating  table MessageInfo....',0,1)
create table MessageInfo
(
    MessageID int IDENTITY(1,1),
    MessageTitle varchar(50) not null,
    UserName varchar(30) not null,
    SubmitTime datetime default(getdate()),
    MessageContent varchar(3000) not null
)
go

raiserror('Creating  table NewsInfo....',0,1)
create table NewsInfo
(
    NewsID int IDENTITY(1,1),
    NewsTitle varchar(50) not null,
    AdminName varchar(30) not null,
    SubmitTime datetime default(getdate()),
    NewsContent varchar(3000) not null
)
go

raiserror('Creating  table dbMusicInfo....',0,1)
create table dbMusicInfo
(
    dbMusicID int IDENTITY(1,1),
    dbMusicName varchar(30) constraint PK_dbMusicInfo primary key,
    dbMusicType varchar(30) not null,
    SingerName varchar(30) not null,
    dbMusicContent image,
    SubmitTime datetime default(getdate())
)
go

alter table MusicInfo add
	constraint FK_MusicInfo foreign key 
    	(SingerName) references SingerInfo(SingerName)
    	ON DELETE CASCADE  ON UPDATE CASCADE 
go


alter table NewsInfo add
	constraint FK_NewsInfo foreign key 
    	(AdminName) references AdminInfo(AdminName)
    	ON DELETE CASCADE  ON UPDATE CASCADE 
go

raiserror('Creating  the pagination  Procedure....',0,1)
go
CREATE Procedure sp_getpage
(
@PageSize int, --每页的记录条数 
@PageNumber int, --当前页面
@QuerySql varchar(1000),--部分查询字符串,如* From Test order by id desc
@KeyField varchar(500) 
)
AS
Begin

Declare @SqlTable AS varchar(1000)
Declare @SqlText AS Varchar(1000)
Declare @SqlCount AS Varchar(1000)

Set @SqlTable='Select Top '+CAST(@PageNumber*@PageSize AS varchar(30))+' '+@QuerySql
Set @SqlText='Select Top '+Cast(@PageSize AS varchar(30))+' * From '+'('+@SqlTable+') As TembTbA '+'Where '+@KeyField+' Not In (Select Top '+CAST((@PageNumber-1)*@PageSize AS varchar(30))+' '+@KeyField+' From '+'('+@SqlTable+') AS TempTbB)'
Exec(@SqlText)

End
GO
insert into AdminInfo values('admin','admin','')
raiserror('Database is now ready for use...',0,1)
go
