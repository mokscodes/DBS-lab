create table employee (empno int , empname varchar(20) not null, gender varchar (1) not null, salary int not null, addr varchar(20) not null, Dno int, check (gender in('m', 'f')), primary key(empno), foreign key (dno) references dep (deptno) on delete cascade)

insert into employee(empno, empname, gender, salary, addr, dno) values (1,'Mok','m', 3000, 'manipal', 3)
insert into employee(empno, empname, gender, salary, addr, dno) values (2,'Anshu','f', 3500, 'VIT', 4)
insert into employee(empno, empname, gender, salary, addr, dno) values (3,'Jaya','f', 2000, 'LPU', 4)
insert into employee(empno, empname, gender, salary, addr, dno) values (4,'Jyoth','m', 4000, 'ashoka', 3)

select * from employee order by empno
    
drop table employee
create table dep(deptno int, depname varchar(30), location varchar(20), primary key(deptno))

insert into dep (deptno, depname, location) Values (3, 'CS', 'BLR')
insert into dep (deptno, depname, location) Values (4, 'IT', 'BLR')

delete from dep where deptno=4
select * from dep

create table employee1 (empno int , empname varchar(20) not null, gender varchar (1) not null,  addr varchar(20) not null, Dno int, check (gender in('m', 'f')), primary key(empno), foreign key (dno) references dep (deptno) on delete cascade, CONSTRAINT setsal salary int default (10000))
insert into employee1(empno, empname, gender,  addr, dno) values (1,'Mok','m', 'manipal', 3)
insert into employee1(empno, empname, gender,  addr, dno) values (2,'JAY','m', 'manipal', 3)
insert into employee1(empno, empname, gender,  addr, dno) values (3,'LILIA','f', 'LPU', 4)
insert into employee1(empno, empname, gender,  addr, dno) values (4,'ANDREE','f', 'LPU', 4)
 
select * from employee1 order by empno





university db

create table classroom
	(building		varchar(15),
	 room_number		varchar(7),
	 capacity		numeric(4,0),
	 primary key (building, room_number)
	);

create table department
	(dept_name		varchar(20), 
	 building		varchar(15), 
	 budget		        numeric(12,2) check (budget > 0),
	 primary key (dept_name)
	);

create table course
	(course_id		varchar(8), 
	 title			varchar(50), 
	 dept_name		varchar(20),
	 credits		numeric(2,0) check (credits > 0),
	 primary key (course_id),
	 foreign key (dept_name) references department
		on delete set null
	);

create table instructor
	(ID			varchar(5), 
	 name			varchar(20) not null, 
	 dept_name		varchar(20), 
	 salary			numeric(8,2) check (salary > 29000),
	 primary key (ID),
	 foreign key (dept_name) references department
		on delete set null
	);

create table section
	(course_id		varchar(8), 
         sec_id			varchar(8),
	 semester		varchar(6)
		check (semester in ('Fall', 'Winter', 'Spring', 'Summer')), 
	 year			numeric(4,0) check (year > 1701 and year < 2100), 
	 building		varchar(15),
	 room_number		varchar(7),
	 time_slot_id		varchar(4),
	 primary key (course_id, sec_id, semester, year),
	 foreign key (course_id) references course
		on delete cascade,
	 foreign key (building, room_number) references classroom
		on delete set null
	);

create table teaches
	(ID			varchar(5), 
	 course_id		varchar(8),
	 sec_id			varchar(8), 
	 semester		varchar(6),
	 year			numeric(4,0),
	 primary key (ID, course_id, sec_id, semester, year),
	 foreign key (course_id,sec_id, semester, year) references section
		on delete cascade,
	 foreign key (ID) references instructor
		on delete cascade
	);

create table student
	(ID			varchar(5), 
	 name			varchar(20) not null, 
	 dept_name		varchar(20), 
	 tot_cred		numeric(3,0) check (tot_cred >= 0),
	 primary key (ID),
	 foreign key (dept_name) references department
		on delete set null
	);

create table takes
	(ID			varchar(5), 
	 course_id		varchar(8),
	 sec_id			varchar(8), 
	 semester		varchar(6),
	 year			numeric(4,0),
	 grade		        varchar(2),
	 primary key (ID, course_id, sec_id, semester, year),
	 foreign key (course_id,sec_id, semester, year) references section
		on delete cascade,
	 foreign key (ID) references student
		on delete cascade
	);

create table advisor
	(s_ID			varchar(5),
	 i_ID			varchar(5),
	 primary key (s_ID),
	 foreign key (i_ID) references instructor (ID)
		on delete set null,
	 foreign key (s_ID) references student (ID)
		on delete cascade
	);

create table time_slot
	(time_slot_id		varchar(4),
	 day			varchar(1),
	 start_hr		numeric(2) check (start_hr >= 0 and start_hr < 24),
	 start_min		numeric(2) check (start_min >= 0 and start_min < 60),
	 end_hr			numeric(2) check (end_hr >= 0 and end_hr < 24),
	 end_min		numeric(2) check (end_min >= 0 and end_min < 60),
	 primary key (time_slot_id, day, start_hr, start_min)
	);

create table prereq
	(course_id		varchar(8), 
	 prereq_id		varchar(8),
	 primary key (course_id, prereq_id),
	 foreign key (course_id) references course
		on delete cascade,
	 foreign key (prereq_id) references course
	);


    

INSERTIONS

insert into classroom values ('Packard', '101', '500');
insert into classroom values ('Painter', '514', '10');
insert into classroom values ('Taylor', '3128', '70');
insert into classroom values ('Watson', '100', '30');
insert into classroom values ('Watson', '120', '50');
insert into department values ('Biology', 'Watson', '90000');
insert into department values ('Comp. Sci.', 'Taylor', '100000');
insert into department values ('Elec. Eng.', 'Taylor', '85000');
insert into department values ('Finance', 'Painter', '120000');
insert into department values ('History', 'Painter', '50000');
insert into department values ('Music', 'Packard', '80000');
insert into department values ('Physics', 'Watson', '70000');
insert into course values ('BIO-101', 'Intro. to Biology', 'Biology', '4');
insert into course values ('BIO-301', 'Genetics', 'Biology', '4');
insert into course values ('BIO-399', 'Computational Biology', 'Biology', '3');
insert into course values ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4');
insert into course values ('CS-190', 'Game Design', 'Comp. Sci.', '4');
insert into course values ('CS-315', 'Robotics', 'Comp. Sci.', '3');
insert into course values ('CS-319', 'Image Processing', 'Comp. Sci.', '3');
insert into course values ('CS-347', 'Database System Concepts', 'Comp. Sci.', '3');
insert into course values ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3');
insert into course values ('FIN-201', 'Investment Banking', 'Finance', '3');
insert into course values ('HIS-351', 'World History', 'History', '3');
insert into course values ('MU-199', 'Music Video Production', 'Music', '3');
insert into course values ('PHY-101', 'Physical Principles', 'Physics', '4');
insert into instructor values ('10101', 'Srinivasan', 'Comp. Sci.', '65000');
insert into instructor values ('12121', 'Wu', 'Finance', '90000');
insert into instructor values ('15151', 'Mozart', 'Music', '40000');
insert into instructor values ('22222', 'Einstein', 'Physics', '95000');
insert into instructor values ('32343', 'El Said', 'History', '60000');
insert into instructor values ('33456', 'Gold', 'Physics', '87000');
insert into instructor values ('45565', 'Katz', 'Comp. Sci.', '75000');
insert into instructor values ('58583', 'Califieri', 'History', '62000');
insert into instructor values ('76543', 'Singh', 'Finance', '80000');
insert into instructor values ('76786', 'Crick', 'Biology', '720000');
insert into instructor values ('83821', 'Brandt', 'Comp. Sci.', '92000');
insert into instructor values ('98345', 'Kim', 'Elec. Eng.', '80000');
insert into section values ('BIO-101', '1', 'Summer', '2009', 'Painter', '514', 'B');
insert into section values ('BIO-301', '1', 'Summer', '2010', 'Painter', '514', 'A');
insert into section values ('CS-101', '1', 'Fall', '2009', 'Packard', '101', 'H');
insert into section values ('CS-101', '1', 'Spring', '2010', 'Packard', '101', 'F');
insert into section values ('CS-190', '1', 'Spring', '2009', 'Taylor', '3128', 'E');
insert into section values ('CS-190', '2', 'Spring', '2009', 'Taylor', '3128', 'A');
insert into section values ('CS-315', '1', 'Spring', '2010', 'Watson', '120', 'D');
insert into section values ('CS-319', '1', 'Spring', '2010', 'Watson', '100', 'B');
insert into section values ('CS-319', '2', 'Spring', '2010', 'Taylor', '3128', 'C');
insert into section values ('CS-347', '1', 'Fall', '2009', 'Taylor', '3128', 'A');
insert into section values ('EE-181', '1', 'Spring', '2009', 'Taylor', '3128', 'C');
insert into section values ('FIN-201', '1', 'Spring', '2010', 'Packard', '101', 'B');
insert into section values ('HIS-351', '1', 'Spring', '2010', 'Painter', '514', 'C');
insert into section values ('MU-199', '1', 'Spring', '2010', 'Packard', '101', 'D');
insert into section values ('PHY-101', '1', 'Fall', '2009', 'Watson', '100', 'A');
insert into teaches values ('10101', 'CS-101', '1', 'Fall', '2009');
insert into teaches values ('10101', 'CS-315', '1', 'Spring', '2010');
insert into teaches values ('10101', 'CS-347', '1', 'Fall', '2009');
insert into teaches values ('12121', 'FIN-201', '1', 'Spring', '2010');
insert into teaches values ('15151', 'MU-199', '1', 'Spring', '2010');
insert into teaches values ('22222', 'PHY-101', '1', 'Fall', '2009');
insert into teaches values ('32343', 'HIS-351', '1', 'Spring', '2010');
insert into teaches values ('45565', 'CS-101', '1', 'Spring', '2010');
insert into teaches values ('45565', 'CS-319', '1', 'Spring', '2010');
insert into teaches values ('76766', 'BIO-101', '1', 'Summer', '2009');
insert into teaches values ('76766', 'BIO-301', '1', 'Summer', '2010');
insert into teaches values ('83821', 'CS-190', '1', 'Spring', '2009');
insert into teaches values ('83821', 'CS-190', '2', 'Spring', '2009');
insert into teaches values ('83821', 'CS-319', '2', 'Spring', '2010');
insert into student values ('00128', 'Zhang', 'Comp. Sci.', '102');
insert into student values ('12345', 'Shankar', 'Comp. Sci.', '32');
insert into student values ('19991', 'Brandt', 'History', '80');
insert into student values ('23121', 'Chavez', 'Finance', '110');
insert into student values ('44553', 'Peltier', 'Physics', '56');
insert into student values ('45678', 'Levy', 'Physics', '46');
insert into student values ('54321', 'Williams', 'Comp. Sci.', '54');
insert into student values ('55739', 'Sanchez', 'Music', '38');
insert into student values ('70557', 'Snow', 'Physics', '0');
insert into student values ('76543', 'Brown', 'Comp. Sci.', '58');
insert into student values ('76653', 'Aoi', 'Elec. Eng.', '60');
insert into student values ('98765', 'Bourikas', 'Elec. Eng.', '98');
insert into student values ('98988', 'Tanaka', 'Biology', '120');
insert into takes values ('00128', 'CS-101', '1', 'Fall', '2009', 'A');
insert into takes values ('00128', 'CS-347', '1', 'Fall', '2009', 'A-');
insert into takes values ('12345', 'CS-101', '1', 'Fall', '2009', 'C');
insert into takes values ('12345', 'CS-190', '2', 'Spring', '2009', 'A');
insert into takes values ('12345', 'CS-315', '1', 'Spring', '2010', 'A');
insert into takes values ('12345', 'CS-347', '1', 'Fall', '2009', 'A');
insert into takes values ('19991', 'HIS-351', '1', 'Spring', '2010', 'B');
insert into takes values ('23121', 'FIN-201', '1', 'Spring', '2010', 'C+');
insert into takes values ('44553', 'PHY-101', '1', 'Fall', '2009', 'B-');
insert into takes values ('45678', 'CS-101', '1', 'Fall', '2009', 'F');
insert into takes values ('45678', 'CS-101', '1', 'Spring', '2010', 'B+');
insert into takes values ('45678', 'CS-319', '1', 'Spring', '2010', 'B');
insert into takes values ('54321', 'CS-101', '1', 'Fall', '2009', 'A-');
insert into takes values ('54321', 'CS-190', '2', 'Spring', '2009', 'B+');
insert into takes values ('55739', 'MU-199', '1', 'Spring', '2010', 'A-');
insert into takes values ('76543', 'CS-101', '1', 'Fall', '2009', 'A');
insert into takes values ('76543', 'CS-319', '2', 'Spring', '2010', 'A');
insert into takes values ('76653', 'EE-181', '1', 'Spring', '2009', 'C');
insert into takes values ('98765', 'CS-101', '1', 'Fall', '2009', 'C-');
insert into takes values ('98765', 'CS-315', '1', 'Spring', '2010', 'B');
insert into takes values ('98988', 'BIO-101', '1', 'Summer', '2009', 'A');
insert into takes values ('98988', 'BIO-301', '1', 'Summer', '2010', null);
insert into advisor values ('00128', '45565');
insert into advisor values ('12345', '10101');
insert into advisor values ('23121', '76543');
insert into advisor values ('44553', '22222');
insert into advisor values ('45678', '22222');
insert into advisor values ('76543', '45565');
insert into advisor values ('76653', '98345');
insert into advisor values ('98765', '98345');
insert into advisor values ('98988', '76766');
insert into time_slot values ('A', 'M', '8', '0', '8', '50');
insert into time_slot values ('A', 'W', '8', '0', '8', '50');
insert into time_slot values ('A', 'F', '8', '0', '8', '50');
insert into time_slot values ('B', 'M', '9', '0', '9', '50');
insert into time_slot values ('B', 'W', '9', '0', '9', '50');
insert into time_slot values ('B', 'F', '9', '0', '9', '50');
insert into time_slot values ('C', 'M', '11', '0', '11', '50');
insert into time_slot values ('C', 'W', '11', '0', '11', '50');
insert into time_slot values ('C', 'F', '11', '0', '11', '50');
insert into time_slot values ('D', 'M', '13', '0', '13', '50');
insert into time_slot values ('D', 'W', '13', '0', '13', '50');
insert into time_slot values ('D', 'F', '13', '0', '13', '50');
insert into time_slot values ('E', 'T', '10', '30', '11', '45 ');
insert into time_slot values ('E', 'R', '10', '30', '11', '45 ');
insert into time_slot values ('F', 'T', '14', '30', '15', '45 ');
insert into time_slot values ('F', 'R', '14', '30', '15', '45 ');
insert into time_slot values ('G', 'M', '16', '0', '16', '50');
insert into time_slot values ('G', 'W', '16', '0', '16', '50');
insert into time_slot values ('G', 'F', '16', '0', '16', '50');
insert into time_slot values ('H', 'W', '10', '0', '12', '30');
insert into prereq values ('BIO-301', 'BIO-101');
insert into prereq values ('BIO-399', 'BIO-101');
insert into prereq values ('CS-190', 'CS-101');
insert into prereq values ('CS-315', 'CS-101');
insert into prereq values ('CS-319', 'CS-101');
insert into prereq values ('CS-347', 'CS-101');
insert into prereq values ('EE-181', 'PHY-101');



select * from classroom
select * from department
select * from course
select * from instructor
select * from section
select * from teaches  
select * from student   
select * from takes 
select * from advisor 
select * from time_slot
select * from prereq


select name, dept_name from student 

select name from instructor where dept_name= 'Comp. Sci.'

select title from course where dept_name= 'Comp. Sci.' AND credits=3

select id, course_id, title from course natural join takes  where ID=98988

select name from instructor where salary between 40000 and 90000

    14.	Display the IDs of all instructors who have never taught a course.
Select instructor.id from instructor where id not in (select distinct teaches.id from teaches);

15.	Find the student names, course names, and the year, for all students those who have
    attended classes in room-number 303.
Select name, title, takes.year FROM student, section, course, takes WHERE room_number=3128 and
    course.course_id = section.course_id and course.course_id = takes.course_id and
    takes.id = student.id and takes.year = section.year 
    and takes.sec_id = section.sec_id and section.semester = takes.semester;

 17.	Find the names of all instructors whose salary is greater than the salary of
    at least one instructor of
    CSE department and salary replaced by inst-salary.

Select  T.name from instructor T, instructor S where T.salary > S.salary and S.dept_name='Comp. Sci. ';

 Select name from instructor where dept_name like '%c%';

 19.) 
     Select name,LENGTH(name) from student;

20.) 
    select dept_name,substr(dept_name,3,3) from department;

21.) 
    Select UPPER(name) from instructor;

22.) 
    Select NVL(grade,'F') from takes;

23.) 
    Select salary,ROUND(salary/3,-2) from instructor;

alter table EMPLOYEE add(DOB date);

Update employee set DOB='29-DEC-2000';

Select * from EMPLOYEE WHERE DOB='29-DEC-2000';

24.)

Select empname, to_char(DOB,'DD-MON-YYYY') from employee;
Select empname, to_char(DOB,'DD-MON-YY') from employee;
Select empname, to_char(DOB,'DD-MM-YY') from employee;

25.)

Select empname,dob from EMPLOYEE;
Select empname, TO_CHAR(DOB, 'YYYY') from EMPLOYEE;


26.) 
    Select empname, TO_CHAR(DOB, 'DD') from EMPLOYEE;

27.)  
    Select empname, TO_CHAR(DOB, 'MON') from EMPLOYEE;

28.) 
    Select empname, LAST_DAY(DOB) from EMPLOYEE;



30.) 
    Select Next_day(Add_Months(DOB, 720), 'Saturday') from employee;

31.) 
    Select empname from employee where extract(year from dob) = 1998;

32.) 
    Select empname from employee where extract(year from dob) between 1997 AND 1999;

33.) 
    Select empname from employee where (extract(year from dob)+60) = 2058;
