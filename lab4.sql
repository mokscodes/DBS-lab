1.) 1.	Find the number of students in each course.
    Select dept_name,count(distinct ID) from student group by dept_name;

2.	Find those departments where the average number of students are greater than 10.
2.) 
    Select dept_name,count(distinct ID) from (student natural join takes) 
    group by dept_name having count(distinct id) > 10;

3.	Find the total number of courses in each department.
3.) Select dept_name,count(distinct course_id) from course group by dept_name;

4.	Find the names and average salaries of all departments whose average salary is
    greater than 42000.
4.) Select dept_name,avg(salary) from instructor group by dept_name having avg(salary) > 42000;

5.	Find the enrolment of each section that was offered in Spring 2009
5.) Select sec_id,count(distinct ID) from (takes natural join section) where semester='Spring'
    and year=2009 group by sec_id;

6.	List all the courses with prerequisite courses, then display course id in increasing order.
6.) Select course_id,prereq_id from prereq order by course_id; 

7.	Display the details of instructors sorting the salary in decreasing order.
7.) Select name,salary from instructor order by salary desc;

8.	Find the maximum total salary across the departments.
8.) Select  max(total_salary) from (Select  dept_name, sum(salary) as total_salary from instructor
    group by dept_name);

9.	Find the average instructors’ salaries of those departments where the average 
    salary is greater than 42000.
9.) Select dept_name, avg_salary from (Select dept_name, avg(salary) as avg_salary from
    instructor group by dept_name) where avg_salary>42000; 

10.	Find the sections that had the maximum enrolment in Spring 2010
10.) Select max(total_student) from (Select count(distinct ID) as total_student from takes 
    group by sec_id, semester, year having semester='Spring' and year=2010);

11.) Select distinct t.Name from Instructor t, teaches s, takes m, student n where
    t.id=s.id and s.course_id=m.course_id and m.id = n.id and n.dept_name = 'Comp. Sci';

12.) Select dept_name, avg(salary) From instructor group by dept_name
    having avg(salary)>50000 and count(id)>5;

13.) With max_budget(value) as (Select max(budget) from department) Select budget
    from department, max_budget where department.budget=max_budget.value;

14.) 

--------

15.) ----


16.) ----

