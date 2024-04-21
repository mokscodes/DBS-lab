create table employee (empno int not null, empname varchar (25), empadd varchar(255), primary key(empno))

insert into employee(empno, empname, empadd) VALUES (1,'Moks','Iowa')
insert into employee(empno, empname, empadd) VALUES (2,'Ansh','Kolkata')
insert into employee(empno, empname, empadd) VALUES (3,'Chan','Bengluru')
insert into employee(empno, empname, empadd) VALUES (4,'Jay','Taiwan')
insert into employee(empno, empname, empadd) VALUES (5,'Jyo','Indiana')

select * from employee order by empno

select empname from employee

select empname from employee where empadd='Iowa' //change to manipal

alter table employee add (salary int)

update employee set salary= 1000 where empno<4
update employee set salary=2000 where empno=4
update employee set salary= 2500 where empno=5

describe employee

delete from employee where empadd='Bengluru'

rename employee to employee1

drop table employee1
