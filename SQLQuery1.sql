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
(                                        -------foreign key----------
dept_name varchar(40),
dept_strength int not null,
id int foreign key references Bridgelabz(id)
);
insert into Department (dept_name,dept_strength,id) values ('Mech',100,101);
insert into Department(dept_name,dept_strength,id) values ('Etc',120,102);
insert into Department(dept_name,dept_strength,id) values ('EEE',120,103);

select * from Department;
select * from Bridgelabz;

/*Clauses*/

create table Database1
(
d_id int not null,
d_name varchar(40) unique,
d_age int,
d_sal int not null,
d_dept varchar(30) 
);

select * from Database1;

insert into Database1(d_id,d_name,d_age,d_sal,d_dept) values (101,'Jugal',22,10000,'mech');
insert into Database1(d_id,d_name,d_age,d_sal,d_dept) values (102,'Bidesi',29,20000,'EEE');
insert into Database1(d_id,d_name,d_age,d_sal,d_dept) values (103,'Srikant',32,30000,'ETC');
insert into Database1(d_id,d_name,d_age,d_sal,d_dept) values (104,'Sairam',20,30000,'mech');
insert into Database1(d_id,d_name,d_age,d_sal,d_dept) values (105,'Srinibas',33,20000,'EEE');

select * from Database1 where d_age>25;----where constraints-----

 -------group by-------
 /* here it will show two mech column because we are grouping sal and dept which is not same */
 select d_sal,d_dept, sum(d_age) as [total_Age] 
 from Database1 group by d_sal,d_dept;

select d_dept,sum(d_sal) as total_salary 
from Database1 group by d_dept;

------assending and descending-------
select * from Database1 order by d_name asc;      
select * from Database1 order by d_name desc;

-------top--------
select top 3 d_name,d_dept from Database1
order by d_sal;


/*subqueries*/

create table Product
(
   p_id int not null,
   p_name varchar(30) unique not null,
   p_price int,
   p_availability varchar(30),
)
insert into Product(p_id,p_name,p_price,p_availability) values (1,'Herohonda',50000,'Cuttack');
insert into Product(p_id,p_name,p_price,p_availability) values (2,'Discover',60000,'Cuttack');
insert into Product(p_id,p_name,p_price,p_availability) values (3,'Pulsur',50000,'Bhubaneswar');
insert into Product(p_id,p_name,p_price,p_availability) values (4,'Activa',40000,'Cuttack');

select * from Product;


----give me the product name whose id is 2-----
select p_name from Product where p_availability in (select p_availability from Product where p_id=2);

select p_availability from Product where p_price in (select p_price from Product where p_name='Activa');

select p_price from Product where p_id in(select p_id from Product where p_name='Discover');