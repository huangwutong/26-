set nocount    on

use master
declare @dttm varchar(55)
select  @dttm=convert(varchar,getdate(),113)
raiserror('Starting installation of PowerMusic Database at %s ....',1,1,@dttm) with nowait

GO

if exists (select * from sysdatabases where name='PowerMusic')
begin
  raiserror('Dropping existing PowerMusic database ....',0,1)
  DROP database PowerMusic
end
GO

CHECKPOINT
go

raiserror('Creating PowerMusic database....',0,1)
go

create DATABASE PowerMusic
on
(
  name= PowerMusic_Data,
  filename = 'C:\Program Files\Microsoft SQL Server\MSSQL\data\PowerMusic_Data.mdf',
  size = 50,
  filegrowth = 10%	
)
log on
(
  name= PowerMusic_Log,
  filename = 'C:\Program Files\Microsoft SQL Server\MSSQL\data\PowerMusic_Log.ldf',
  size = 10,
  filegrowth = 10%	
)
GO

CHECKPOINT

GO

USE PowerMusic

GO

if db_name() <> 'PowerMusic'
   raiserror('Error , "USE PowerMusic" failed!  Killing the SPID now.'
            ,22,127) with log

GO

execute sp_dboption 'PowerMusic','trunc. log on chkpt.' ,'true'
checkpoint
go
