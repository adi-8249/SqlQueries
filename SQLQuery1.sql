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

-------foreign key----------

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


/*joins*/
create table Employee1
(
id int primary key,
name varchar(40) not null,
age int,
dept varchar(30)
);
select * from Employee1;
insert into Employee1(id,name,age,dept) values(101,'Sudeepta',24,'Mech');
insert into Employee1(id,name,age,dept) values(102,'Partha',20,'ETC');
insert into Employee1(id,name,age,dept) values(103,'Pradeep',23,'Science');
insert into Employee1(id,name,age,dept) values(104,'Pratap',30,'EEE');


create table Employee2
(
id int primary key,
name varchar(40) not null,
age int,
sal int not null
);
select * from Employee1;
select * from Employee2;

insert into Employee2(id,name,age,sal) values(101,'Pratap',22,20000);
insert into Employee2(id,name,age,sal) values(102,'prakruti',24,30000);
insert into Employee2(id,name,age,sal) values(103,'Mahendra',25,60000);
insert into Employee2(id,name,age,sal) values(104,'Partha',23,50000);

------inner joins----
select * from Employee1 inner join Employee2 on Employee1.age=Employee2.age;

-------left join------
select * from Employee1 left join Employee2 on Employee1.name=Employee2.name;

-------Right join-----
select * from Employee1 right join Employee2 on Employee1.age=Employee2.age;

------Full outer join-------
select * from Employee1 full outer join Employee2 on Employee1.age=Employee2.age;

-----cross join-------
select * from Employee1 cross join Employee2;




/*Multi table joins*/

Create table Student
(
  s_id int not null,
  s_name varchar(40) unique,
  s_age int,
   cid int foreign key references CourseTable(cid),
  ct_id int foreign key references CityTable(ct_id),
)
select * from Student;
select * from CourseTable;
select * from CityTable;
insert into Student(s_id,s_name,s_age,cid,ct_id) values (1,'Adi',20,2,1);
insert into Student(s_id,s_name,s_age,cid,ct_id) values (2,'Aman',20,3,2);
insert into Student(s_id,s_name,s_age,cid,ct_id) values (3,'Amar',20,2,3);
insert into Student(s_id,s_name,s_age,cid,ct_id) values (4,'Asmit',20,1,1);

---------*****---------------------------

create table CourseTable
(
cid int primary key,
cname varchar(40) not null
);
insert into CourseTable(cid,cname) values (1,'HTML');
insert into CourseTable(cid,cname) values (2,'Css');
insert into CourseTable(cid,cname) values (3,'Js');
insert into CourseTable(cid,cname) values (4,'Java');

select * from CourseTable;

-------------****-----------------

create table CityTable
(
ct_id int primary key,
ct_name varchar(30) unique not null
);
select * from CityTable;

insert into CityTable(ct_id,ct_name) values (1,'BBSR');
insert into CityTable(ct_id,ct_name) values (2,'CTC');
insert into CityTable(ct_id,ct_name) values (3,'Khordha');


select * from Student s 
inner join CourseTable cr on s.cid=cr.cid
inner join CityTable ct on s.cid=ct.ct_id;