create table account (accnum number not null, branch varchar(20),  branchname varchar(25), balance float, primary key(accnum))
drop table account
insert into account (accnum, branch, branchname, balance) VALUES (1, 'cs','seca',300)
insert into account (accnum, branch, branchname, balance) VALUES (2, 'cs','secb',500)
insert into account (accnum, branch, branchname, balance) VALUES (3, 'it','seca',100)
insert into account (accnum, branch, branchname, balance) VALUES (4, 'cyber','seca',1500)
    
select * from account
select accnum, branch from account where balance<400

update account set branchname= 'secb' where accnum=3
