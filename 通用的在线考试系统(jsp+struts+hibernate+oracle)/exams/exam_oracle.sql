--
--ER/Studio 7.0 SQL Code Generation
-- Company :      微软中国
-- Project :      Model2.DM1
-- Author :       微软用户
--
-- Date Created : Tuesday, March 27, 2007 18:46:53
-- Target DBMS : Oracle 9i
--

-- 
-- TABLE: examrecord 
--

CREATE TABLE examrecord(
    examrecordid    NUMBER(10, 0)    NOT NULL,
    resultid        NUMBER(10, 0)    NOT NULL,
    questionid      NUMBER(10, 0)    NOT NULL,
    answer          VARCHAR2(10)     ,
    CONSTRAINT PK7 PRIMARY KEY (examrecordid)
)
;



-- 
-- TABLE: loginlog 
--

CREATE TABLE loginlog(
    loginlogid    NUMBER(10, 0)    NOT NULL,
    username      VARCHAR2(30)     NOT NULL,
    success       NUMBER(1, 0)     NOT NULL,
    isteacher     NUMBER(1, 0)     NOT NULL,
    IP            VARCHAR2(15)     NOT NULL,
    logtime       Date     		   NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY (loginlogid)
)
;



-- 
-- TABLE: option 
--

CREATE TABLE options(
    optionid      NUMBER(10, 0)     NOT NULL,
    questionid    NUMBER(10, 0)     NOT NULL,
    content       VARCHAR2(4000)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY (optionid)
)
;



-- 
-- TABLE: question 
--

CREATE TABLE question(
    questionid     NUMBER(10, 0)     NOT NULL,
    subjectid      NUMBER(10, 0)     NOT NULL,
    content        VARCHAR2(4000)    NOT NULL,
    qtype          NUMBER(1, 0)      NOT NULL,
    score          NUMBER(5, 0)      NOT NULL,
    rightanswer    VARCHAR2(10)      NOT NULL,
    sdate          VARCHAR2(10)      NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (questionid)
)
;




-- 
-- TABLE: result 
--

CREATE TABLE result(
    resultid     NUMBER(10, 0)    NOT NULL,
    studentid    NUMBER(10, 0)    NOT NULL,
    subjectid    NUMBER(10, 0)    NOT NULL,
    score        NUMBER(5, 0)     NOT NULL,
    starttime    Date		      NOT NULL,
    endtime      Date     		  NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY (resultid)
)
;



-- 
-- TABLE: student 
--

CREATE TABLE student(
    studentid    NUMBER(10, 0)    NOT NULL,
    username     VARCHAR2(30)     NOT NULL,
    name         VARCHAR2(30)     NOT NULL,
    password     VARCHAR2(30)     NOT NULL,
    address      VARCHAR2(40)     NOT NULL,
    sex          VARCHAR2(2)      NOT NULL,
    email        VARCHAR2(40)     NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (studentid),
    UNIQUE (username)
)
;



-- 
-- TABLE: subject 
--

CREATE TABLE subject(
    subjectid    NUMBER(10, 0)    NOT NULL,
    name         VARCHAR2(30)     NOT NULL,
    time         NUMBER(5, 0)     NOT NULL,
    state        NUMBER(1, 0)     NOT NULL,
    intro        VARCHAR2(600)    NOT NULL,
    sdate        VARCHAR2(10)     NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY (subjectid)
)
;



-- 
-- TABLE: teacher 
--

CREATE TABLE teacher(
    teacherid    NUMBER(10, 0)    NOT NULL,
    username     VARCHAR2(30)     NOT NULL,
    password     VARCHAR2(30)     NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (teacherid),
    UNIQUE (username)
)
;



-- 
-- TABLE: examrecord 
--

ALTER TABLE examrecord ADD CONSTRAINT Refresult4 
    FOREIGN KEY (resultid)
    REFERENCES result(resultid)
;

ALTER TABLE examrecord ADD CONSTRAINT Refquestion5 
    FOREIGN KEY (questionid)
    REFERENCES question(questionid)
;


-- 
-- TABLE: option 
--

ALTER TABLE options ADD CONSTRAINT Refquestion7 
    FOREIGN KEY (questionid)
    REFERENCES question(questionid)
;


-- 
-- TABLE: question 
--

ALTER TABLE question ADD CONSTRAINT Refsubject1 
    FOREIGN KEY (subjectid)
    REFERENCES subject(subjectid)
;


-- 
-- TABLE: result 
--

ALTER TABLE result ADD CONSTRAINT Refstudent3 
    FOREIGN KEY (studentid)
    REFERENCES student(studentid)
;

ALTER TABLE result ADD CONSTRAINT Refsubject6 
    FOREIGN KEY (subjectid)
    REFERENCES subject(subjectid)
;

insert into teacher values(1,'admin','admin');
commit;
