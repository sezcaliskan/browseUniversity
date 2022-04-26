CREATE TABLE BuildClass(
buildingName CHAR(20),
roomNumber INT(20),
capacity INT(20),
primary key (buildingName,roomNumber)
);

CREATE TABLE TimeSlot(
dday CHAR(20),
hhour INT(20),
primary key(dday,hhour)
);

CREATE TABLE Course(
ects INT(20),
courseName CHAR(20),
courseCode CHAR(20),
numHours INT(20),
preReqCourseCode CHAR(20),
primary key(courseCode),
foreign key (preReqCourseCode) references Course(courseCode)
);

CREATE TABLE Department(
dName CHAR(20),
budget INT(20),
headSSn INT(20),
buildingName CHAR(20),
primary key(dName),
foreign key (buildingName) references BuildClass(buildingName)

);

CREATE TABLE Instructor(
ssn INT(20),
iName CHAR(20),
rrank CHAR(20),
baseSalary INT(20),
extraSalary INT(20),
dName CHAR(20),
primary key(ssn),
foreign key (dName) references Department(dName)
);


CREATE TABLE Section (
semester INT(20),
courseCode CHAR(20),
yyear INT(20),
sectionId INT(20),
quota INT(20),
issn INT(20),
primary key(semester,courseCode,yyear,sectionId,issn),
foreign key (courseCode) references Course(courseCode),
foreign key (issn) references Instructor(ssn)
);

CREATE TABLE Curricula(
currCode CHAR(20),
gradOrUgrad CHAR(20),
dName CHAR(20),
primary key(currCode,dName),
foreign key (dName) references Department(dName)
);

CREATE TABLE curriculaCourses(
courseCode CHAR(20),
currCode CHAR(20),
dName CHAR(20),
primary key(courseCode,currCode,dName),
foreign key (courseCode) references Course(courseCode),
foreign key (currCode,dName) references Curricula(currCode,dName)

);

CREATE TABLE Student(
sssn INT(20),
gradorUgrad CHAR(20),
advisorSsn INT(20),
currCode CHAR(20),
dName CHAR(20),
studentId CHAR(20),
sName CHAR(20),
primary key(sssn),
foreign key (advisorSsn) references Instructor(ssn),
foreign key (currCode) references Curricula(currCode),
foreign key (dName) references Curricula(dName)
);

CREATE TABLE Emails(
sssn INT(20),
email CHAR(20),
primary key(sssn,email),
foreign key (sssn) references Student(sssn)
);

CREATE TABLE gradStudent(
sssn INT(20),
advisorSsn INT(20),
primary key(sssn),
foreign key (sssn) references Student(sssn),
foreign key (advisorSsn) references Instructor(ssn)
);

CREATE TABLE prevDegrees(
college CHAR(20),
degree  CHAR(20),
yyear INT(20),
gradsssn INT(20),
primary key(college,degree,yyear,gradsssn),
foreign key (gradsssn) references gradStudent(sssn)
);

CREATE TABLE Project(
leadssn INT(20),
budget INT(20),
startDate INT(20),
endDate INT(20),
ssubject CHAR(20),
contrDname CHAR(20),
prName CHAR(20),
primary key(leadssn,prName),
foreign key (leadssn) references Instructor(ssn),
foreign key (contrDname) references Department(dName)
);

CREATE TABLE InstructorInProjects(
Projectleadssn INT(20),
issn INT(20),
workingHours INT(20),
prName CHAR(20),
primary key(Projectleadssn,prName,issn),
foreign key  (Projectleadssn,prName) references Project(leadssn,prName),
foreign key (issn) references Instructor(ssn)
);

CREATE TABLE GradsInProjects(
Projectleadssn INT(20),
gradsssn INT(20),
workingHours INT(20),
prName CHAR(20),
primary key(Projectleadssn,prName,gradsssn),
foreign key (Projectleadssn,prName) references Project(leadssn,prName) ,
foreign key (gradsssn) references gradStudent(sssn)
 
);
CREATE TABLE enrollment(
ssn INT(20),
grade INT(20),
semester INT(20),
courseCode CHAR(20),
yyear INT(20),
sectionId INT(20),
issn INT(20),
buildingName CHAR(20),
roomNumber INT(20),
dday CHAR(20),
hhour INT(20),
primary key(ssn,semester,courseCode,yyear,sectionId,issn),
foreign key (ssn) references Student(sssn) ,
foreign key (semester,courseCode,yyear,sectionId) references Section(semester,courseCode,yyear,sectionId) ,
   foreign key (issn) references Instructor(ssn),
    foreign key (buildingName,roomNumber) references BuildClass(buildingName,roomNumber),
     foreign key (dday,hhour) references TimeSlot(dday,hhour)

);
insert into BuildClass values
('a',1,5),
('b',2,10),
('c',3,15),
('d',4,20),
('e',5,25),
('f',6,30),
('g',7,35),
('h',8,40),
('k',9,45),
('l',10,50);


insert into TimeSlot values
('MMM',123),
('TTT',123),
('WWW',123),
('THTHTH',123),
('FFF',123),
('MTT',123),
('MWW',123),
('MTHTH',123),
('MFF',123),
('TWW',123);

insert into Course values
(4,'Math101','MATHONEZEROONE',6, null),
 -- (4,'underMath101', 'underMATHONEZEROONE',6,null),
(4,'Math102','MATHONEZEROTWO',6, 'MATHONEZEROONE'),
(5,'Math103','MATHONEZEROTHREE',8, 'MATHONEZEROTWO'),
(5,'PHYS101','PHYSONEZEROONE',8, null),
(6,'PHYS102','PHYSONEZEROTWO',8, 'PHYSONEZEROONE'),
(4,'CSE101','CSEONEZEROONE',6,null);

insert into Department values
('MATH',1000,111,'a'),
('PHYS',2000,222,'b'),
('ENG',3000,333,'c'),
('ARCH',4000,444,'d'),
('BIO',5000,555,'e');

insert into Instructor values
(111,'sezin', 'assistant',2000 , 200,'MATH' ),
(222,'derin', 'assistant',2000 , 200, 'PHYS'),
(333,'cidem','associate' , 3000,300 , 'ENG'),
(444,'cansu','full' ,4000 , 400,'ARCH' ),
(555,'cankat', 'full', 4000,400 ,'PHYS' ),
(666,'merve', 'full', 4000,400 ,'BIO' ),
(777,'nazli', 'assistant',2000 , 200,'MATH' )
;

insert into Section values
(1,'MATHONEZEROONE',2020,1,60,111),
-- (1,'underMATHONEZEROONE',2020,1,60,111),
(1,'MATHONEZEROONE',2020,2,60,777),
(1,'MATHONEZEROTWO',2020,1,50,111),
(2,'MATHONEZEROTWO',2020,2,50,111),
(1,'MATHONEZEROTHREE',2020,1,30,777),
(2,'MATHONEZEROTHREE',2020,2,30,777),
(1,'PHYSONEZEROONE',2020,1,70,222),
(2,'PHYSONEZEROONE',2020,2,70,222),
(1,'PHYSONEZEROTWO',2020,1,60,555),
(2,'PHYSONEZEROTWO',2020,2,60,555);

insert into Curricula values
('ENGC','grad','ENG'),
('underENGC','ugrad','ENG'),
('MATHC','grad','MATH'),
('underMATHC','ugrad','MATH'),
('ARCHC','grad','ARCH'),
('underARCHC','ugrad','ARCH'),
('PHYSC','grad','PHYS'),
('underPHYSC','ugrad','PHYS');

insert into curriculacourses values
('MATHONEZEROONE','MATHC','MATH'),
('MATHONEZEROTWO','MATHC','MATH'),
-- ('MATHONEZEROTWO','ENGC','MATH'),
('PHYSONEZEROONE','PHYSC','PHYS'),
 -- ('PHYSONEZEROONE','ENGC','PHYS'),
('CSEONEZEROONE','ENGC','ENG'),
('PHYSONEZEROTWO','PHYSC','PHYS'),
-- ('PHYSONEZEROTWO','ENGC','PHYS'),
('MATHONEZEROTHREE','MATHC','MATH');

insert into Student values
(001,'grad',111,'MATHC','MATH' ,'2020math001','deniz'),
(002,'grad',222,'PHYSC','PHYS' ,'2020phys002','sacit'),
(003,'grad',333,'ENGC','ENG' ,'2020eng003','suret'),
(004,'ugrad',111,'underMATHC','MATH','2020math004','sansli'),
(005,'ugrad',222,'underPHYSC','PHYS' ,'2020phys005','douglasadams'),
(006,'grad',111,'MATHC','MATH' ,'2020math006','neo'),
(007,'grad',111,'MATHC','MATH' ,'2020math007','jamesbond'),
(008,'grad',111,'MATHC','MATH' ,'2020math008','trinity');

insert into emails values
(001,'denizgmail'),
(002,'sacitgmail'),
(003,'suretgmail'),
(004,'sanslihotmail'),
(005,'douglasadamshotmail'),
(006,'neogmail'),
(007,'jamesbondhotmail'),
(008,'trinitygmail');

insert into gradstudent values
(001,111),
(002,222),
(003,333),
(006,111),
(007,777),
(008,111);

insert into prevdegrees values
('moruni','bachelor','2015',001),
('moruni','bachelor','2015',002),
('moruni','bachelor','2015',003),
('matrixuni','bachelor','2010',006),
('agentuni','master','2010',007),
('matrixuni','bachelor','2010',008);

insert into Project values
(111,1000,01112020,01122020,'mathematics','MATH','MATHPROJECT'),
(111,2000,01112019,01122019,'mathematics','MATH','mathandworld'),
(222,2000,01112019,01122019,'physics','PHYS','PHYSPROJECT'),
(222,5000,01112018,01122018,'physics','PHYS','physandworld'),
(333,3000,01112019,02112019,'engineering','ENG','ENGPROJECT'),
(333,5000,01112017,02112017,'engineering','ENG','engandworld'),
(333,6000,01112025,02112025,'engineering','ENG','futureofgengineering'),
(333,6000,01112012,02112012,'engineering','ENG','thepastofengineering'),
(444,4000,02052019,02112019,'architecture','ARCH','ARCHPROJECT'),
(444,4000,02052019,02112019,'architecture','ARCH','futuristicbuildings');

insert into instructorinprojects values
(111,777,5,'MATHPROJECT'),
(111,777,10,'mathandworld'),
(222,777,5,'PHYSPROJECT'),
(222,777,10,'physandworld'),
(333,777,5,'ENGPROJECT'),
(333,666,10,'engandworld'),
(333,777,5,'futureofgengineering'),
(333,555,10,'thepastofengineering'),
(444,555,5,'ARCHPROJECT'),
(444,555,10,'futuristicbuildings');

insert into gradsinprojects values
(111,001,10,'MATHPROJECT'),
(111,002,20,'mathandworld'),
(222,003,10,'PHYSPROJECT'),
(222,006,10,'physandworld'),
(333,007,20,'ENGPROJECT'),
(333,008,10,'engandworld'),
(333,001,10,'futureofgengineering'),
(333,002,30,'thepastofengineering'),
(444,003,10,'ARCHPROJECT'),
(444,006,10,'futuristicbuildings');

insert into enrollment values
(001,90,1,'MATHONEZEROONE',2020,1,111,'a',1,'MMM',123),
(002,80,1,'MATHONEZEROTWO',2020,1,111,'b',2,'FFF',123),
(003,70,1,'MATHONEZEROTHREE',2020,1,777,'c',3,'TTT',123),
(004,40,1,'PHYSONEZEROONE',2020,1,222,'e',5,'THTHTH',123),
(005,50,1,'PHYSONEZEROTWO',2020,1,555,'d',4,'WWW',123);


alter table  Department
add constraint foreignkey1
foreign key (headSSn) references Instructor(ssn);
-- 1)
select S.studentId , S.sName , E.email , S.gradorUgrad,S.dName
from Student S ,Emails E
where S.dName='Math' and S.sssn=E.sssn;

-- 2)
select S.studentId , S.sName, I.iName
from Student S , Instructor I
where S.dName='Math' and S.advisorSsn=I.ssn;

-- 3) 
select *
from Instructor I
where dName='Math' ;

-- 4)
      select C.courseCode , C.courseName,C.ects
from Course C , Instructor I,enrollment E, Section S
where S.yyear=2020 and S.semester=1 and I.iName='sezin'and E.issn=I.ssn and E.courseCode=S.courseCode and S.courseCode=C.courseCode and E.sectionId=S.sectionId;

-- 5)
select I.iName
from Instructor I, Course C , enrollment E, Section S
where   C.courseCode NOT IN ( select C.courseCode 
from Course C , Instructor I,enrollment E, Section S
where S.yyear=2020 and S.semester=1 and I.iName='sezin'and E.issn=I.ssn and E.courseCode=S.courseCode and S.courseCode=C.courseCode and E.sectionId=S.sectionId);


  -- 6)
  
  select  S.sName
  from Student S, enrollment E,Section T, Course C
  where C.courseName = 'Math101' and T.yyear =2020 and T.semester= 1 and T.yyear=E.yyear and  S.sssn=E.ssn and E.semester=T.semester 
  and T.courseCode=C.courseCode and E.courseCode=T.courseCode and E.sectionId=T.sectionId;
  
  -- 8)
  select C.courseCode,C.courseName,C.ects
  from  Student S, Course C,enrollment E ,Section T
  where S.sName='neo' and T.yyear=E.yyear and  S.sssn=E.ssn and E.semester=T.semester 
  and T.courseCode=C.courseCode and E.courseCode=T.courseCode and E.sectionId=T.sectionId ;
  

-- 14)
select P.prName
from Project P ,Department D
where P.contrDname=D.dName and dName='Math';

-- 15)
 select G.gradsssn,I.issn
 from Project P,InstructorInProjects I,GradsInProjects G
 where P.prName='MATHPROJECT' and G.Projectleadssn=P.leadssn and G.prName=P.prName
 
 -- 16)
