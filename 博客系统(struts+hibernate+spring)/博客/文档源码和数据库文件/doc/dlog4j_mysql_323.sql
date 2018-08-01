/*==============================================================*/
/* Database name:  WebDlog数据库结构                                 */
/* DBMS name:      MySQL 3.23                                   */
/* Created on:     2004-10-8 15:38:53                           */
/*==============================================================*/


drop table if exists dlog_attachment;

drop table if exists dlog_bookmark;

drop table if exists dlog_category;

drop table if exists dlog_draft;

drop table if exists dlog_edit_track;

drop table if exists dlog_favorite;

drop table if exists dlog_iptrack;

drop table if exists dlog_journal;

drop table if exists dlog_message;

drop table if exists dlog_param;

drop table if exists dlog_reference;

drop table if exists dlog_reply;

drop table if exists dlog_site;

drop table if exists dlog_user;

drop table if exists dlog_visit;

/*==============================================================*/
/* Table: dlog_attachment                                       */
/*==============================================================*/
create table if not exists dlog_attachment
(
   att_id                         int                            not null,
   logid                          int,
   att_type                       int                            not null,
   att_urltype                    int                            not null,
   att_url                        varchar(50)                    not null,
   primary key (att_id)
);

/*==============================================================*/
/* Table: dlog_bookmark                                         */
/*==============================================================*/
create table if not exists dlog_bookmark
(
   markid                         int                            not null,
   logid                          int,
   siteid                         int,
   userid                         int,
   marktype                       int                            not null,
   createTime                     timestamp                      not null,
   markorder                      int                            not null,
   primary key (markid)
);

/*==============================================================*/
/* Table: dlog_category                                         */
/*==============================================================*/
create table if not exists dlog_category
(
   catid                          int                            not null,
   siteid                         int,
   catname                        varchar(40)                    not null,
   iconurl                        varchar(20),
   cattype                        int                            not null,
   sortOrder                      int                            not null,
   primary key (catid)
);

/*==============================================================*/
/* Table: dlog_draft                                            */
/*==============================================================*/
create table if not exists dlog_draft
(
   draftid                        int                            not null,
   siteid                         int,
   userid                         int,
   author                         varchar(50),
   author_url                     varchar(100),
   title                          varchar(100),
   content                        text,
   saveTime                       timestamp                      not null,
   refUrl                         varchar(100),
   weather                        varchar(20)                    not null,
   moodLevel                      int,
   useFace                        int                            not null,
   useUbb                         int                            not null,
   showFormerly                   int                            not null,
   primary key (draftid)
);

/*==============================================================*/
/* Table: dlog_edit_track                                       */
/*==============================================================*/
create table if not exists dlog_edit_track
(
   track_id                       int                            not null,
   logid                          int,
   userid                         int,
   modifytime                     timestamp                      not null,
   primary key (track_id)
);

/*==============================================================*/
/* Table: dlog_favorite                                         */
/*==============================================================*/
create table if not exists dlog_favorite
(
   favid                          int                            not null,
   siteid                         int,
   title                          varchar(100)                   not null,
   detail                         text,
   url                            varchar(250)                   not null,
   in_new_wnd                     int                            not null,
   createTime                     timestamp                      not null,
   sortOrder                      int                            not null,
   primary key (favid)
);

/*==============================================================*/
/* Table: dlog_iptrack                                          */
/*==============================================================*/
create table if not exists dlog_iptrack
(
   trackid                        int                            not null,
   userid                         int                            not null,
   ipaddr                         char(15)                       not null,
   loginTime                      timestamp                      not null,
   primary key (trackid)
);

/*==============================================================*/
/* Table: dlog_journal                                          */
/*==============================================================*/
create table if not exists dlog_journal
(
   logid                          int                            not null,
   catid                          int,
   siteid                         int,
   userid                         int,
   author                         varchar(50),
   author_url                     varchar(100),
   title                          varchar(100),
   content                        text,
   logkeys                        varchar(40),
   logTime                        timestamp                      not null,
   refUrl                         varchar(100),
   weather                        varchar(20)                    not null,
   moodLevel                      int,
   useFace                        int                            not null,
   useUbb                         int                            not null,
   showFormerly                   int                            not null,
   replyNotify                    int,
   viewcount                      int                            not null,
   replyCount                     int                            not null,
   delete_time                    timestamp,
   "status"                       int                            not null,
   primary key (logid)
);

/*==============================================================*/
/* Table: dlog_message                                          */
/*==============================================================*/
create table if not exists dlog_message
(
   msgid                          int                            not null,
   fromUserId                     int                            not null,
   toUserId                       int                            not null,
   content                        text                           not null,
   ishtml                         int                            not null,
   sendTime                       timestamp                      not null,
   readTime                       timestamp,
   "status"                       int                            not null,
   primary key (msgid)
);

/*==============================================================*/
/* Table: dlog_param                                            */
/*==============================================================*/
create table if not exists dlog_param
(
   p_id                           int                            not null,
   siteid                         int,
   p_name                         varchar(20)                    not null,
   p_desc                         varchar(100),
   p_type                         int                            not null,
   p_value                        varchar(100),
   primary key (p_id)
);

/*==============================================================*/
/* Table: dlog_reference                                        */
/*==============================================================*/
create table if not exists dlog_reference
(
   refid                          int                            not null,
   logid                          int,
   refurl                         varchar(100)                   not null,
   title                          varchar(100),
   excerpt                        varchar(200),
   blog_name                      varchar(50)                    not null,
   remoteAddr                     char(15)                       not null,
   reftime                        timestamp                      not null,
   primary key (refid)
);

/*==============================================================*/
/* Table: dlog_reply                                            */
/*==============================================================*/
create table if not exists dlog_reply
(
   cmtid                          int                            not null,
   siteid                         int,
   userid                         int,
   logid                          int,
   faceurl                        varchar(20),
   content                        text,
   useFace                        int                            not null,
   useUbb                         int                            not null,
   showFormerly                   int                            not null,
   writetime                      timestamp                      not null,
   primary key (cmtid)
);

/*==============================================================*/
/* Table: dlog_site                                             */
/*==============================================================*/
create table if not exists dlog_site
(
   siteid                         int                            not null,
   sitename                       varchar(20)                    not null,
   displayName                    varchar(100)                   not null,
   sitedetail                     text,
   siteicon                       varchar(50),
   sitelogo                       varchar(50),
   cssfile                        varchar(50),
   createTime                     timestamp                      not null,
   lastTime                       timestamp,
   siteurl                        varchar(100),
   "status"                       int                            not null,
   primary key (siteid)
);

/*==============================================================*/
/* Table: dlog_user                                             */
/*==============================================================*/
create table if not exists dlog_user
(
   userid                         int                            not null,
   siteid                         int,
   username                       varchar(20)                    not null,
   "password"                     varchar(50)                    not null,
   displayName                    varchar(50),
   email                          varchar(50),
   homepage                       varchar(100),
   resume                         varchar(250),
   portrait                       varchar(40),
   logincount                     int,
   regTime                        timestamp                      not null,
   lastTime                       timestamp,
   userRole                       int                            not null,
   ownerCats                      varchar(20),
   primary key (userid)
);

/*==============================================================*/
/* Table: dlog_visit                                            */
/*==============================================================*/
create table if not exists dlog_visit
(
   visitID                        int                            not null,
   remoteAddr                     varchar(15),
   refererURL                     varchar(200),
   requestURL                     varchar(100)                   not null,
   userAgent                      varchar(100),
   visitDate                      char(8)                        not null,
   visitTime                      char(6)                        not null
);

