--==============================================================
-- Database name:  WebDlog数据库结构
-- DBMS name:      IBM DB2 UDB 7.x Common Server
-- Created on:     2004-11-18 13:29:49
--==============================================================


drop index logatt_FK;

drop index booklog_FK;

drop index sitebook_FK;

drop index userbook_FK;

drop index catsite_FK;

drop index sitedraft_FK;

drop index userdraft_FK;

drop index log_edit_FK;

drop index userdoit_FK;

drop index sitelink_FK;

drop index journal_category_F;

drop index loguser_FK;

drop index sitelog_FK;

drop index siteparam_FK;

drop index logref_FK;

drop index cmtuser_FK;

drop index logcomment_FK;

drop index sitereply_FK;

drop index siteinfo_FK;

drop index site_user_FK;

drop table dlog_attachment;

drop table dlog_bookmark;

drop table dlog_category;

drop table dlog_draft;

drop table dlog_edit_track;

drop table dlog_favorite;

drop table dlog_iptrack;

drop table dlog_journal;

drop table dlog_message;

drop table dlog_param;

drop table dlog_reference;

drop table dlog_reply;

drop table dlog_site;

drop table dlog_topinfo;

drop table dlog_user;

drop table dlog_visit;

--==============================================================
-- Table: dlog_attachment
--==============================================================
create table dlog_attachment
(
   att_id               INTEGER                not null,
   logid                INTEGER,
   att_type             INTEGER                not null,
   att_urltype          INTEGER                not null,
   att_url              VARCHAR(50)            not null,
   constraint P_attachment_key primary key (att_id)
);

--==============================================================
-- Index: logatt_FK
--==============================================================
create  index logatt_FK on dlog_attachment (
   logid                ASC
);

--==============================================================
-- Table: dlog_bookmark
--==============================================================
create table dlog_bookmark
(
   markid               INTEGER                not null,
   logid                INTEGER,
   siteid               INTEGER,
   userid               INTEGER,
   marktype             INTEGER                not null,
   createTime           TIMESTAMP              not null,
   markorder            INTEGER                not null,
   constraint P_bookmark_key primary key (markid)
);

--==============================================================
-- Index: sitebook_FK
--==============================================================
create  index sitebook_FK on dlog_bookmark (
   siteid               ASC
);

--==============================================================
-- Index: userbook_FK
--==============================================================
create  index userbook_FK on dlog_bookmark (
   userid               ASC
);

--==============================================================
-- Index: booklog_FK
--==============================================================
create  index booklog_FK on dlog_bookmark (
   logid                ASC
);

--==============================================================
-- Table: dlog_category
--==============================================================
create table dlog_category
(
   catid                INTEGER                not null,
   siteid               INTEGER,
   catname              VARCHAR(40)            not null,
   iconurl              VARCHAR(20),
   cattype              INTEGER                not null,
   sortOrder            INTEGER                not null,
   constraint P_category_key primary key (catid)
);

comment on table dlog_category is
'日志分类
支持隐藏、排序、个性图标';

--==============================================================
-- Index: catsite_FK
--==============================================================
create  index catsite_FK on dlog_category (
   siteid               ASC
);

--==============================================================
-- Table: dlog_draft
--==============================================================
create table dlog_draft
(
   draftid              INTEGER                not null,
   siteid               INTEGER,
   userid               INTEGER,
   author               VARCHAR(50),
   author_url           VARCHAR(100),
   title                VARCHAR(100),
   content              LONG VARCHAR,
   saveTime             TIMESTAMP              not null,
   refUrl               VARCHAR(100),
   weather              VARCHAR(20)            not null,
   moodLevel            INTEGER,
   useFace              INTEGER                not null,
   useUbb               INTEGER                not null,
   showFormerly         INTEGER                not null,
   constraint P_draft_key primary key (draftid)
);

--==============================================================
-- Index: sitedraft_FK
--==============================================================
create  index sitedraft_FK on dlog_draft (
   siteid               ASC
);

--==============================================================
-- Index: userdraft_FK
--==============================================================
create  index userdraft_FK on dlog_draft (
   userid               ASC
);

--==============================================================
-- Table: dlog_edit_track
--==============================================================
create table dlog_edit_track
(
   track_id             INTEGER                not null,
   logid                INTEGER,
   userid               INTEGER,
   modifytime           TIMESTAMP              not null,
   constraint P_edit_track_key primary key (track_id)
);

--==============================================================
-- Index: log_edit_FK
--==============================================================
create  index log_edit_FK on dlog_edit_track (
   logid                ASC
);

--==============================================================
-- Index: userdoit_FK
--==============================================================
create  index userdoit_FK on dlog_edit_track (
   userid               ASC
);

--==============================================================
-- Table: dlog_favorite
--==============================================================
create table dlog_favorite
(
   favid                INTEGER                not null,
   siteid               INTEGER,
   title                VARCHAR(100)           not null,
   detail               LONG VARCHAR,
   url                  VARCHAR(250)           not null,
   mode               VARCHAR(5),
   in_new_wnd           INTEGER                not null,
   createTime           TIMESTAMP              not null,
   sortOrder            INTEGER                not null,
   constraint P_favorite_key primary key (favid)
);

--==============================================================
-- Index: sitelink_FK
--==============================================================
create  index sitelink_FK on dlog_favorite (
   siteid               ASC
);

--==============================================================
-- Table: dlog_iptrack
--==============================================================
create table dlog_iptrack
(
   trackid              INTEGER                not null,
   userid               INTEGER                not null,
   ipaddr               CHAR(15)               not null,
   loginTime            TIMESTAMP              not null,
   constraint P_iptrack_key primary key (trackid)
);

--==============================================================
-- Table: dlog_journal
--==============================================================
create table dlog_journal
(
   logid                INTEGER                not null,
   catid                INTEGER,
   siteid               INTEGER,
   userid               INTEGER,
   author               VARCHAR(50),
   author_url           VARCHAR(100),
   title                VARCHAR(100),
   content              LONG VARCHAR,
   logkeys              VARCHAR(40),
   logTime              TIMESTAMP              not null,
   refUrl               VARCHAR(100),
   weather              VARCHAR(20)            not null,
   moodLevel            INTEGER,
   useFace              INTEGER                not null,
   useUbb               INTEGER                not null,
   showFormerly         INTEGER                not null,
   replyNotify          INTEGER,
   viewcount            INTEGER                not null,
   replyCount           INTEGER                not null,
   delete_time          TIMESTAMP,
   status               INTEGER                not null,
   constraint P_journal_key primary key (logid)
);

comment on table dlog_journal is
'日记表';

--==============================================================
-- Index: loguser_FK
--==============================================================
create  index loguser_FK on dlog_journal (
   userid               ASC
);

--==============================================================
-- Index: journal_category_F
--==============================================================
create  index journal_category_F on dlog_journal (
   catid                ASC
);

--==============================================================
-- Index: sitelog_FK
--==============================================================
create  index sitelog_FK on dlog_journal (
   siteid               ASC
);

--==============================================================
-- Table: dlog_message
--==============================================================
create table dlog_message
(
   msgid                INTEGER                not null,
   fromUserId           INTEGER                not null,
   toUserId             INTEGER                not null,
   content              LONG VARCHAR           not null,
   ishtml               INTEGER                not null,
   sendTime             TIMESTAMP              not null,
   readTime             TIMESTAMP,
   status               INTEGER                not null,
   constraint P_message_key primary key (msgid)
);

--==============================================================
-- Table: dlog_param
--==============================================================
create table dlog_param
(
   p_id                 INTEGER                not null,
   siteid               INTEGER,
   p_name               VARCHAR(20)            not null,
   p_desc               VARCHAR(100),
   p_type               INTEGER                not null,
   p_value              VARCHAR(100),
   constraint P_param_key primary key (p_id)
);

--==============================================================
-- Index: siteparam_FK
--==============================================================
create  index siteparam_FK on dlog_param (
   siteid               ASC
);

--==============================================================
-- Table: dlog_reference
--==============================================================
create table dlog_reference
(
   refid                INTEGER                not null,
   logid                INTEGER,
   refurl               VARCHAR(100)           not null,
   title                VARCHAR(100),
   excerpt              VARCHAR(200),
   blog_name            VARCHAR(50)            not null,
   remoteAddr           CHAR(15)               not null,
   reftime              TIMESTAMP              not null,
   constraint P_ref_key primary key (refid)
);

--==============================================================
-- Index: logref_FK
--==============================================================
create  index logref_FK on dlog_reference (
   logid                ASC
);

--==============================================================
-- Table: dlog_reply
--==============================================================
create table dlog_reply
(
   cmtid                INTEGER                not null,
   siteid               INTEGER,
   userid               INTEGER,
   logid                INTEGER,
   faceurl              VARCHAR(20),
   content              LONG VARCHAR,
   useFace              INTEGER                not null,
   useUbb               INTEGER                not null,
   showFormerly         INTEGER                not null,
   writetime            TIMESTAMP              not null,
   constraint P_comment_key primary key (cmtid)
);

comment on table dlog_reply is
'评论记录表';

--==============================================================
-- Index: logcomment_FK
--==============================================================
create  index logcomment_FK on dlog_reply (
   logid                ASC
);

--==============================================================
-- Index: cmtuser_FK
--==============================================================
create  index cmtuser_FK on dlog_reply (
   userid               ASC
);

--==============================================================
-- Index: sitereply_FK
--==============================================================
create  index sitereply_FK on dlog_reply (
   siteid               ASC
);

--==============================================================
-- Table: dlog_site
--==============================================================
create table dlog_site
(
   siteid               INTEGER                not null,
   sitename             VARCHAR(20)            not null,
   displayName          VARCHAR(100)           not null,
   sitedetail           LONG VARCHAR,
   siteicon             VARCHAR(50),
   sitelogo             VARCHAR(50),
   cssfile              VARCHAR(50),
   createTime           TIMESTAMP              not null,
   lastTime             TIMESTAMP,
   siteurl              VARCHAR(100),
   status               INTEGER                not null,
   constraint P_site_key primary key (siteid)
);

comment on column dlog_site.lastTime is
'最近一次状态更改时间';

--==============================================================
-- Table: dlog_topinfo
--==============================================================
create table dlog_topinfo
(
   siteid               INTEGER,
   infoid               INTEGER,
   pubtime              TIMESTAMP              not null,
   enable_time          TIMESTAMP              not null,
   expire_time          TIMESTAMP              not null
);

--==============================================================
-- Index: siteinfo_FK
--==============================================================
create  index siteinfo_FK on dlog_topinfo (
   siteid               ASC
);

--==============================================================
-- Table: dlog_user
--==============================================================
create table dlog_user
(
   userid               INTEGER                not null,
   siteid               INTEGER,
   username             VARCHAR(20)            not null,
   password             VARCHAR(50)            not null,
   displayName          VARCHAR(50),
   email                VARCHAR(50),
   homepage             VARCHAR(100),
   resume               VARCHAR(250),
   portrait             VARCHAR(40),
   logincount           INTEGER,
   regTime              TIMESTAMP              not null,
   lastTime             TIMESTAMP,
   userRole             INTEGER                not null,
   ownerCats            VARCHAR(20),
   constraint P_user_key primary key (userid)
);

--==============================================================
-- Index: site_user_FK
--==============================================================
create  index site_user_FK on dlog_user (
   siteid               ASC
);

--==============================================================
-- Table: dlog_visit
--==============================================================
create table dlog_visit
(
   visitID              INTEGER                not null,
   remoteAddr           VARCHAR(15),
   refererURL           VARCHAR(200),
   requestURL           VARCHAR(100)           not null,
   userAgent            VARCHAR(100),
   visitDate            CHAR(8)                not null,
   visitTime            CHAR(6)                not null
);

alter table dlog_attachment
   add constraint F_logatt foreign key (logid)
      references dlog_journal (logid)
      on delete restrict;

alter table dlog_bookmark
   add constraint F_booklog foreign key (logid)
      references dlog_journal (logid)
      on delete restrict;

alter table dlog_bookmark
   add constraint F_sitebook foreign key (siteid)
      references dlog_site (siteid)
      on delete restrict;

alter table dlog_bookmark
   add constraint F_userbook foreign key (userid)
      references dlog_user (userid)
      on delete restrict;

alter table dlog_category
   add constraint F_catsite foreign key (siteid)
      references dlog_site (siteid)
      on delete restrict;

alter table dlog_draft
   add constraint F_sitedraft foreign key (siteid)
      references dlog_site (siteid)
      on delete restrict;

alter table dlog_draft
   add constraint F_userdraft foreign key (userid)
      references dlog_user (userid)
      on delete restrict;

alter table dlog_edit_track
   add constraint F_log_edit foreign key (logid)
      references dlog_journal (logid)
      on delete restrict;

alter table dlog_edit_track
   add constraint F_userdoit foreign key (userid)
      references dlog_user (userid)
      on delete restrict;

alter table dlog_favorite
   add constraint F_sitelink foreign key (siteid)
      references dlog_site (siteid)
      on delete restrict;

alter table dlog_journal
   add constraint F_journal_category foreign key (catid)
      references dlog_category (catid)
      on delete restrict;

alter table dlog_journal
   add constraint F_loguser foreign key (userid)
      references dlog_user (userid)
      on delete restrict;

alter table dlog_journal
   add constraint F_sitelog foreign key (siteid)
      references dlog_site (siteid)
      on delete restrict;

alter table dlog_param
   add constraint F_siteparam foreign key (siteid)
      references dlog_site (siteid)
      on delete restrict;

alter table dlog_reference
   add constraint F_logref foreign key (logid)
      references dlog_journal (logid)
      on delete restrict;

alter table dlog_reply
   add constraint F_cmtuser foreign key (userid)
      references dlog_user (userid)
      on delete restrict;

alter table dlog_reply
   add constraint F_logcomment foreign key (logid)
      references dlog_journal (logid)
      on delete restrict;

alter table dlog_reply
   add constraint F_sitereply foreign key (siteid)
      references dlog_site (siteid)
      on delete restrict;

alter table dlog_topinfo
   add constraint F_siteinfo foreign key (siteid)
      references dlog_site (siteid)
      on delete restrict;

alter table dlog_user
   add constraint F_site_user foreign key (siteid)
      references dlog_site (siteid)
      on delete restrict;

