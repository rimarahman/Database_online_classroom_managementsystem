drop table TAKES;
drop table procedure;
drop table student;
drop table TEACHER;
drop table DEPARTMENT;
drop table classroom;
drop table courses;

create table Classroom(
	building_no number(5) NOT NULL,          
	Classroom_no number (5),                      
	building_name varchar (10),           
	Primary key(building_no)
);

Insert Into Classroom Values(1,101,'ab_1');
Insert Into Classroom Values(2,102,'ab_2');
Insert Into Classroom Values(3,103,'ab_3');
Insert Into Classroom Values(4,104,'ab_4');
Insert Into Classroom Values(5,105,'ab_5');

Create Table courses( 
	Course_code Number(5) NOT NULL,
   Course_Name Varchar(20),
   Primary key (Course_code)
   );



Insert Into courses values (001, 'problem-solving');
Insert Into courses values (002, 'math');
Insert Into courses values (003, 'math');
Insert Into courses values (004, 'electric_circuit');
Insert Into courses values (005, 'data_base');


Create Table Department (
	department_id Number(5) NOT NULL,
	department_name varchar(10),
	Primary key(department_id)
);

Insert Into Department values(12, 'cse');
Insert Into Department values(13, 'BBA');
Insert Into Department Values(17, 'EEE');
Insert Into Department Values(20, 'civil');
Insert Into Department values(15, 'Software');



Create table teacher(
	teacher_id number(10) NOT NULL, 
	teacher_name varchar (30),
	Course_code Number(10),
	Primary key (teacher_id),
	FOREIGN KEY (Course_code) REFERENCES courses (Course_code) ON DELETE CASCADE
 );

Insert Into Teacher Values(2075,'saif_ahmen',001);
Insert Into Teacher Values(2141,'aliza_khan',002);
Insert Into Teacher Values(2101,'hasin_rehan',003);
Insert Into Teacher Values(2113,'omit_chokraborti',004);
Insert Into Teacher Values(2114,'neha_khan',005);


CREATE TABLE STUDENT(
	STUDENT_ID NUMBER(6) NOT NULL,
	TEACHER_ID NUMBER(10),
	BUILDING_NO NUMBER(10),
	DEPARTMENT_ID NUMBER(10),
	F_NAME varchar(20), 
	L_NAME VARCHAR(20),
	DATE_OF_BIRTH VARCHAR(20),
	AGE NUMBER(2),
	PRIMARY KEY(STUDENT_ID),
	FOREIGN KEY (TEACHER_ID) REFERENCES TEACHER (TEACHER_ID) ON DELETE CASCADE,
	FOREIGN KEY (BUILDING_NO) REFERENCES CLASSROOM (BUILDING_NO) ON DELETE CASCADE,
	FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT (DEPARTMENT_ID) ON DELETE CASCADE
);

insert into student values(1001,2075,1,12,'RIma','RAHMAN','15-7-1999',21);
insert into student values(1002,2141,2,13,'SANJIDA','JUI','15-7-1999',20);
insert into student values(1003,2101,3,17,'TAHMINA','URMEE','15-7-1999',22);
insert into student values(1004,2113,4,20,'RINA','JANNAT','15-7-1999',23);
insert into student values(1005,2114,5,15,'SETU','AKHTER','15-7-1999',21);



Create Table Procedure (
	Email_ID Varchar(20) NOT NULL,
	STUDENT_ID NUMBER(6),	
	device Varchar(50),
	Software Varchar(40),
	p_id number(10),
	Primary key (Email_ID),
	FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (STUDENT_ID) ON DELETE CASCADE
);
Insert Into Procedure values( 'rima12@gmail.com',1001,'mobile','Zoom',1001);
Insert Into Procedure values('nobo12#gmail.com',1002,'Laptop','Zoom',1002);
Insert Into Procedure values('jui12@gmail.com',1003,'desktop','meet',1003);
Insert Into Procedure values('bonna12@gmail.com',1004,'phone','Zoom',1004);
Insert Into Procedure values('urmee12@gmail.com',1005,'android','google_classroom',1005);


CREATE TABLE TAKES(
	Course_code Number(10) NOT NULL,
	STUDENT_ID NUMBER(6),
	FOREIGN KEY(COURSE_CODE)REFERENCES COURSES(COURSE_CODE) ON DELETE CASCADE,
	FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT (STUDENT_ID) ON DELETE CASCADE
);
Insert Into TAKES values( 001,1001);
Insert Into TAKES values( 002,1002);
Insert Into TAKES values( 003,1003);
Insert Into TAKES values( 004,1004);
Insert Into TAKES values( 005,1005);