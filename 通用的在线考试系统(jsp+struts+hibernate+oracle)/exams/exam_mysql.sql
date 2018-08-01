--
--ER/Studio 7.0 SQL Code Generation
-- Company :      微软中国
-- Project :      Model2.DM1
-- Author :       微软用户
--
-- Date Created : Tuesday, March 27, 2007 18:46:08
-- Target DBMS : MySQL 4.x
--

-- 
-- TABLE: examrecord 
--

CREATE TABLE examrecord(
    examrecordid    DECIMAL(10, 0)    NOT NULL,
    resultid        DECIMAL(10, 0)    NOT NULL,
    questionid      DECIMAL(10, 0)    NOT NULL,
    answer          VARCHAR(10)       ,
    PRIMARY KEY (examrecordid)
)TYPE=MYISAM
;



-- 
-- TABLE: loginlog 
--

CREATE TABLE loginlog(
    loginlogid    DECIMAL(10, 0)    NOT NULL,
    username      VARCHAR(30)       NOT NULL,
    success       DECIMAL(1, 0)     NOT NULL,
    isteacher     DECIMAL(1, 0)     NOT NULL,
    IP            VARCHAR(15)       NOT NULL,
    logtime       DATETIME          NOT NULL,
    PRIMARY KEY (loginlogid)
)TYPE=MYISAM
;



-- 
-- TABLE: option 
--

CREATE TABLE options(
    optionid      DECIMAL(10, 0)    NOT NULL,
    questionid    DECIMAL(10, 0)    NOT NULL,
    content       TEXT              NOT NULL,
    PRIMARY KEY (optionid)
)TYPE=MYISAM
;



-- 
-- TABLE: question 
--

CREATE TABLE question(
    questionid     DECIMAL(10, 0)    NOT NULL,
    subjectid      DECIMAL(10, 0)    NOT NULL,
    content        TEXT              NOT NULL,
    qtype          DECIMAL(1, 0)     NOT NULL,
    score          DECIMAL(5, 0)     NOT NULL,
    rightanswer    VARCHAR(10)       NOT NULL,
    sdate          VARCHAR(10)       NOT NULL,
    PRIMARY KEY (questionid)
)TYPE=MYISAM
;



-- 
-- TABLE: result 
--

CREATE TABLE result(
    resultid     DECIMAL(10, 0)    NOT NULL,
    studentid    DECIMAL(10, 0)    NOT NULL,
    subjectid    DECIMAL(10, 0)    NOT NULL,
    score        DECIMAL(5, 0)     NOT NULL,
    starttime    DATETIME          NOT NULL,
    endtime      DATETIME          NOT NULL,
    PRIMARY KEY (resultid)
)TYPE=MYISAM
;



-- 
-- TABLE: student 
--

CREATE TABLE student(
    studentid    DECIMAL(10, 0)    NOT NULL,
    username     VARCHAR(30)       NOT NULL,
    name         VARCHAR(30)       NOT NULL,
    password     VARCHAR(30)       NOT NULL,
    address      VARCHAR(40)       NOT NULL,
    sex          VARCHAR(2)        NOT NULL,
    email        VARCHAR(40)       NOT NULL,
    PRIMARY KEY (studentid),
    UNIQUE (username)
)TYPE=MYISAM
;



-- 
-- TABLE: subject 
--

CREATE TABLE subject(
    subjectid    DECIMAL(10, 0)    NOT NULL,
    name         VARCHAR(30)       NOT NULL,
    time         DECIMAL(5, 0)     NOT NULL,
    state        DECIMAL(1, 0)     NOT NULL,
    intro        TEXT              NOT NULL,
    sdate        VARCHAR(10)       NOT NULL,
    PRIMARY KEY (subjectid)
)TYPE=MYISAM
;



-- 
-- TABLE: teacher 
--

CREATE TABLE teacher(
    teacherid    DECIMAL(10, 0)    NOT NULL,
    username     VARCHAR(30)       NOT NULL,
    password     VARCHAR(30)       NOT NULL,
    PRIMARY KEY (teacherid),
    UNIQUE (username)
)TYPE=MYISAM
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
