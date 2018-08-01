-- Create table
drop table TCHARGE;
create table TCHARGE
(
  CHARGE_CODE VARCHAR2(20) not null,
  CHARGE_NAME VARCHAR2(10),
  CHARGE      NUMBER(6,2)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TCHARGE
  add primary key (CHARGE_CODE)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


-- Create table
drop table TCHARGE_RULE;
create table TCHARGE_RULE
(
  FUNC_ID     VARCHAR2(10) not null,
  CHARGE_CODE VARCHAR2(10),
  FUNC_NAME   VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 

alter table TCHARGE_RULE
  add constraint CHAG_ID_FK foreign key (CHARGE_CODE)
  references TCHARGE (CHARGE_CODE);


-- Create table
drop table TCUSTOMER;
create table TCUSTOMER
(
  CUSTOMER_ID       NUMBER(8) not null,
  ID_TYPE           VARCHAR2(10),
  ID_NUMBER         VARCHAR2(20),
  CUSTOMER_NAME     VARCHAR2(20),
  CUSTOMER_BIRTYDAY VARCHAR2(50),
  CUSTOMER_SEX      VARCHAR2(20),
  CUSTOMER_ADDRESS  VARCHAR2(50)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TCUSTOMER
  add primary key (CUSTOMER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

-- Create table
drop table TMOBILES;
create table TMOBILES
(
  MOBILE_NUMBER VARCHAR2(11) not null,
  MOBILE_TYPE   VARCHAR2(20),
  CARD_NUMBER   VARCHAR2(20),
  IS_AVAILABLE  VARCHAR2(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TMOBILES
  add primary key (MOBILE_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );


-- Create table
drop table TOPERATOR;
create table TOPERATOR
(
  OPERATOR_ID   NUMBER(8) not null,
  OPERATOR_NAME VARCHAR2(20),
  OPERATOR_PWD  VARCHAR2(20),
  IS_ADMIN      NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TOPERATOR
  add primary key (OPERATOR_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

-- Create table
drop table TUSER;
create table TUSER
(
  USER_ID        NUMBER(8) not null,
  MOBILE_NUMBER  VARCHAR2(11),
  ROAMING_STATUS VARCHAR2(20),
  COM_LEVEL      VARCHAR2(20),
  CUSTOMER_ID    NUMBER(20)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TUSER
  add primary key (USER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table TUSER
  add constraint COSTM_ID_FK foreign key (CUSTOMER_ID)
  references TCUSTOMER (CUSTOMER_ID);
alter table TUSER
  add constraint MOBILE_ID_FK foreign key (MOBILE_NUMBER)
  references TMOBILES (MOBILE_NUMBER);

---------Add an administrator----------
insert into TOperator values('1','管理员','1','1');
insert into TOperator values('2','admin','admin','1');
--------新增一个普通操作员------------
insert into TOperator values('3','user','user','0');

-----Init the TCharge------------
insert into TCharge values('A','开户费',10);
insert into TCharge values('B','漫游费',5);
insert into TCharge values('C','押金',100);
insert into TCharge values('D','入网费',50);
insert into TCharge values('E','选号费',10);

commit;
