create database lab7_ex2;
use lab7_ex2;

CREATE TABLE Classes
(
    ClassCode varchar (10) PRIMARY KEY,
    HeadTeacher varchar (100),
    Room varchar(40),
    Timeslot char(5),
    CloseDate datetime
);

select * from Classes;


INSERT INTO Classes (ClassCode, HeadTeacher,Room,Timeslot,CloseDate) VALUES ('01','Nguyen Van A','class 1','01A','20221221');

INSERT INTO Classes (ClassCode, HeadTeacher,Room,Timeslot,CloseDate) VALUES ('02','Nguyen Van B','class 1','02A','2022/12/21');

INSERT INTO Classes (ClassCode, HeadTeacher,Room,Timeslot,CloseDate) VALUES ('C03','Nguyen Van C','class 2','05B','2022/12/21');

INSERT INTO Classes (ClassCode, HeadTeacher,Room,Timeslot,CloseDate) VALUES ('C04','Nguyen Thi D','class 5','07K','2022/12/21');

INSERT INTO Classes (ClassCode, HeadTeacher,Room,Timeslot,CloseDate) VALUES ('C05','Nguyen Anh E','class 5','02H','2022/12/21');


CREATE TABLE Student
 ( 
 RollNo varchar(10) primary Key,
ClassCode varchar(10), 
FullName varchar(100),
 Gender char(1),
 Birthday datetime,
Address varchar(30),
Provice char(50),
 Email varchar(100), 
 CONSTRAINT PK1 FOREIGN KEY (ClassCode) REFERENCES Classes(ClassCode)
); 

select * from Student;
  
INSERT INTO Student (RollNo,ClassCode,FullName,Gender,Birthday,Address,Provice,Email) VALUES ('1','01','Hoang Thuy Linh','F','2000/11/11','HN','HCM','hoangthuylinh@gmail.com');
INSERT INTO Student (RollNo,ClassCode,FullName,Gender,Birthday,Address,Provice,Email) VALUES ('2','02','Hoang Thuy long','M','2003/11/12','HN','HP','hoangthuylong@gmail.com');
INSERT INTO Student (RollNo,ClassCode,FullName,Gender,Birthday,Address,Provice,Email) VALUES ('3','C04','Hoang Thuy Lanh','F','2004/11/13','HN','VP','hoangthuylanh@gmail.com');
INSERT INTO Student (RollNo,ClassCode,FullName,Gender,Birthday,Address,Provice,Email) VALUES ('4','C05','Hoang Thuy Lap','M','2006/11/14','HN','HN','hoangthuylap@gmail.com');
INSERT INTO Student (RollNo,ClassCode,FullName,Gender,Birthday,Address,Provice,Email) VALUES ('5','C03','Hoang Thuy Lung','F','2005/11/15','HN','NA','hoangthuylung@gmail.com');


CREATE TABLE  Subject
(
    SubjectCode varchar(10) PRIMARY Key,
    SubjectName varchar(100),
    WMark tinyint ,
    PMark tinyint ,
    WTest_per int,
    PTest_per int
);
select * from Subject;

INSERT INTO Subject (SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES ('VN','Ngu Van',1,1,'100','100');
INSERT INTO Subject (SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES ('V','Vo Nghe',1,1,'100','100');
INSERT INTO Subject (SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES ('TH','Toan Hoc',1,1,'100','100');
INSERT INTO Subject (SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES ('MT','My Thuat',1,1,'100','100');
INSERT INTO Subject (SubjectCode,SubjectName,WMark,PMark,WTest_per,PTest_per) VALUES ('DK','Dien Kich',1,1,'100','100');


CREATE TABLE Mark
(
    RollNo varchar(10),
    SubjectCode varchar(4),
    WMark float,
    PMark float,
    Mark float ,
    CONSTRAINT PK01 FOREIGN KEY (RollNo) REFERENCES Student(RollNo),
    CONSTRAINT PK02F FOREIGN KEY (SubjectCode) REFERENCES Subject(SubjectCode)
);

select * from Mark;

INSERT INTO Mark (RollNo,SubjectCode,WMark,PMark,Mark) VALUES('1','VN','60','90','70');
INSERT INTO Mark (RollNo,SubjectCode,WMark,PMark,Mark) VALUES('2','TH','50','30','60');
INSERT INTO Mark (RollNo,SubjectCode,WMark,PMark,Mark) VALUES('3','MT','90','90','70');
INSERT INTO Mark (RollNo,SubjectCode,WMark,PMark,Mark) VALUES('4','V','70','80','90');
INSERT INTO Mark (RollNo,SubjectCode,WMark,PMark,Mark) VALUES('5','DK','80','80','70');



