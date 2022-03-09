/*DDL commands*/
create database Employee;
use Employee;
create table EmployeeTable
(
 emp_id int identity(100,1) primary key,
 emp_name varchar(40) not null,
 emp_sal int not null,
 emp_startdate datetime
);
drop table EmployeeTable;
alter table EmployeeTable add emp_designation varchar(40) not null;
truncate table EmployeeTable;
/* DQL command*/
select * from EmployeeTable;

/* DML commands*/
insert into EmployeeTable(emp_name,emp_sal,emp_startdate) values ('Aditya',20000,'2020-12-01');
insert into EmployeeTable(emp_name,emp_sal,emp_startdate) values ('Vinay',30000,'2020-12-02');
insert into EmployeeTable(emp_name,emp_sal,emp_startdate) values ('Kriti',40000,'2020-12-02');
insert into EmployeeTable(emp_name,emp_sal,emp_startdate) values ('Aditi',50000,'2020-12-01');
insert into EmployeeTable(emp_name,emp_sal,emp_startdate) values ('Mahesh',60000,'2020-12-01');
commit
update EmployeeTable set emp_name='Vishal' where emp_id=102;
rollback
delete from EmployeeTable where emp_id=103;

/*DCL*/
commit 
rollback

/*constraints*/

create table Bridgelabz
(
id int not null,
name varchar(40) unique,
age int,
primary key (id)
);

insert into Bridgelabz(id,name,age) values (101,'Aditya',25);
insert into Bridgelabz(id,name,age) values (102,'Priti',23);
insert into Bridgelabz(id,name,age) values (103,'Kriti',26);

select * from Bridgelabz;

create table Department
(
dept_name varchar(40),
dept_strength int not null,
id int foreign key references Bridgelabz(id)
);
insert into Department (dept_name,dept_strength,id) values ('Mech',100,101);
insert into Department(dept_name,dept_strength,id) values ('Etc',120,102);
insert into Department(dept_name,dept_strength,id) values ('EEE',120,103);

select * from Department;