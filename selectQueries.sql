-- 1.	List the students of a department D in form [studentId, student name, e-mail(s), grad or undergrad]
select s.studentid, s.studentname, s.gradorugrad, e.email
from Student s, emails e
where s.dname = 'computer engineering' and	e.sssn = s.ssn;

-- 2. List the advisors of students of a department D in form [studentId, student name, advisor name]
select s.studentid, s.studentname, i.iname
from Student s, instructor i
where s.dname = 'computer engineering' and	i.ssn = s.advisorSsn;

-- 3.	List the instructors of a department D.
select i.iname
from instructor i
where i.dname = 'computer engineering';

-- 4.	List the courses of an instructor I in year Y, semester S in form [course Code, coursename, ects]

select distinct c.courseCode, c.courseName, c.ects 
from course c, sectionn s
where s.issn = 'i1' and s.yearr=2020 and s.semester = 2 and s.courseCode = c.courseCode

-- 5.	List the instructors who are not offering any course in year Y, semester S.

select i.iname 
from instructor i
where i.ssn not in (select s.issn
					from sectionn s
                    where s.yearr=2020 and s.semester = 2)

-- 6.	List the students taking course C in a given year Y and semester S. (students taking COMP2222 in Spring 2020)

select s.studentname
from enrollment e, student s
where e.yearr=2020 and e.semester = 2 and e.courseCode = 'comp2222' and e.sssn = s.ssn;


-- 7.	List the students taking a particular section S (Note that, particular section means that all the compound key  fields of section is fixed, course C, instructor I, year Y, semester SE, section id ID). (students taking COMP2222.2  of Emine Ekin in Spring 2020)

select s.studentname
from enrollment e, student s, instructor i
where e.yearr=2020 and e.semester = 2 and e.courseCode = 'comp2222' and e.sssn = s.ssn and 
	i.iname = 'Emine Ekin' and i.ssn= e.issn and e.sectionId = 2

-- 8.	Given a student S, list all courses in his/her curriculum in form [course code, course name, ects]

select c.courseCode, c.courseName, c.ects
from course c
where c.courseCode in (select cu.courseCode
						from  curriculacourses CU, student S
                        where s.studentid = 'st1' and s.currCode = CU.currCode and s.dname =CU.dname )
						
-- 9.	Given a student S, semester SE, year Y, display timetable in the form [coursecode, section id, building, room number, day, hour] like COMP2222,1,DK,113,M,5

-- find the sections of st from enrollment, then find those sections from weekly schedule

SELECT E.courseCode, E.sectionId, W.buildingName, W.roomNumber, W.dayy,W.hourr
FROM weeklyschedule W NATURAL JOIN enrollment E -- thanks to natural join
where E.sssn = 's1' and E.semester = 2 and E.yearr=2020
					
-- 10.	Given a student S, display his/her grade report in form [CourseCode, year, semester, grade]

select E.courseCode, E.yearr, E.semester, E.grade
from enrollment E
where E.sssn = 's1';

-- 11.	Display grades of a course C in year Y semester S.

select E.courseCode, E.sectionId,E.sssn, E.grade
from enrollment E
where E.courseCode = 'COMP2222' and E.yearr = 2020 and E.semester = 2;

-- 12.	Given a section S, create free hours report for students registered in section S (difficult!). 

select T.dayy, T.hourr
from timeslot T
where (T.dayy, T.hourr) not in (SELECT W.dayy, W.hourr
                           		from enrollment E NATURAL JOIN weeklyschedule W
                               	where E.yearr=2020 and  
								E.semester = 2 and 
								E.sssn in (SELECT E2.sssn
											from enrollment E2
											where E2.sssn = E.sssn and E2.issn= 'i1' and 
											E2.courseCode='comp2222' and E2.sectionId = 1 
											and E2.yearr=2020 and  E2.semester = 2))

-- 13.	Display available classrooms and capacities for a given semester, year, day, and time.
select *
from buildingandroom B
where (B.buildingName , B.roomNumber) not in
(SELECT W.`buildingName`, W.`roomNumber` FROM `weeklyschedule` W WHERE W.`yearr` = 2020 and W.`semester` = 2 and `dayy` = 'Monday' and W.`hourr` = 5);

-- 14.	List the projects controlled by a department D.

select P.pName
from project P
where P.controllingDName = 'computer Engineering';

-- 15.	List all people working in a project P.

select S.studentname, PS.pName as projectName
from project_has_gradstudent PS join student S on PS.Gradssn = S.ssn
where PS.pName = 'job1'

UNION

select I.iname , PI.pName as projectName
from project_has_instructor PI JOIN instructor I on PI.issn = I.ssn
where PI.pName = 'job1'

-- 16.	Assume for each hour of working in a project, instructors will be paid 100$ extra. Display extra payments of instructors working in a project P in form [instructor ssn, instructor name, extra payment]

select PI.issn, instructor.iname, 100*sum(PI.workinghour) as extraPayment
from project_has_instructor PI JOIN instructor on PI.issn = instructor.ssn
group BY PI.issn

-- 17.	Display overall extra payment of an instructor I in a given semester S and year Y (project working hours*100 + (total teaching hours in S,Y -10)*50 + (supervising gradstudent)*25).

select I.ssn, (sum(course.numHours)-10)*50 as extraCoursePayment, COUNT(DISTINCT gradstudent.ssn)*25 as gradStudentsPayment, sum(PI.workinghour)*100 as projectPayment
from ((instructor I left outer JOIN (sectionn NATURAL JOIN course )on I.ssn = sectionn.issn)  
		left outer join gradstudent on I.ssn = gradstudent.supervisorSsn)
        left outer join project_has_instructor PI on I.ssn = PI.issn
where (sectionn.yearr = 2020 and sectionn.semester=2 ) or (sectionn.yearr is null and sectionn.semester is null)
GROUP BY I.ssn


-- 18.	Calculate average base salary of instructors of each department.

select I.dName, AVG(I.baseSal)
from instructor I
GROUP BY I.dName








