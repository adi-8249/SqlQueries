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

create table Employee2
(
id int primary key,
name varchar(40) not null,
age int,
sal int not null
);

insert into Employee1(id,name,age,dept) values(101,'Sudeepta',24,'Mech');
insert into Employee1(id,name,age,dept) values(102,'Partha',20,'ETC');
insert into Employee1(id,name,age,dept) values(103,'Pradeep',23,'Science');
insert into Employee1(id,name,age,dept) values(104,'Pratap',30,'EEE');


insert into Employee2(id,name,age,sal) values(101,'Pratap',22,20000);
insert into Employee2(id,name,age,sal) values(102,'prakruti',24,30000);
insert into Employee2(id,name,age,sal) values(103,'Mahendra',25,60000);
insert into Employee2(id,name,age,sal) values(104,'Partha',23,50000);

select * from Employee1;
select * from Employee2;


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
  foreign key(cid) references CourseTable(cid),
  foreign key(ct_id) references CityTable(ct_id),
)


create table CourseTable
(
cid int primary key,
cname varchar(40) not null
);


create table CityTable
(
ct_id int primary key,
ct_name varchar(30) unique not null
);


insert into Student(s_id,s_name,s_age,cid,ct_id) values (1,'Adi',20,2,1);
insert into Student(s_id,s_name,s_age,cid,ct_id) values (2,'Aman',20,3,2);
insert into Student(s_id,s_name,s_age,cid,ct_id) values (3,'Amar',20,2,3);
insert into Student(s_id,s_name,s_age,cid,ct_id) values (4,'Asmit',20,1,1);

insert into CourseTable(cid,cname) values (1,'HTML');
insert into CourseTable(cid,cname) values (2,'Css');
insert into CourseTable(cid,cname) values (3,'Js');
insert into CourseTable(cid,cname) values (4,'Java');

insert into CityTable(ct_id,ct_name) values (1,'BBSR');
insert into CityTable(ct_id,ct_name) values (2,'CTC');
insert into CityTable(ct_id,ct_name) values (3,'Khordha');


select * from Student;
select * from CourseTable;
select * from CityTable;


select * from Student s 
inner join CourseTable cr on s.cid=cr.cid
inner join CityTable ct on s.cid=ct.ct_id

--------like---------

select * from Student where s_name like 'a%';

select * from Student where s_name like '%n';

select * from Student where s_name like '%ma%';

select * from Student where s_name like 'a_%';


-----------Cast and Convert----------
/*   Cast and convert both are used to change the data type from one to anothe 
     but only difference is that we can get to change the format as well in convert  */

create table City
(
id int not null,
city_name varchar(40) not null
);

Insert into City(id,city_name) values (1,'BBSR');
Insert into City(id,city_name) values (2,'CTC');
Insert into City(id,city_name) values (1,'Jajpur');
Insert into City(id,city_name) values (1,'Khordha');
Insert into City(id,city_name) values (1,'Athagarh');

select * from City;

select id,city_name +'-'+id from City;----this will give error-----

select id, city_name+'-'+cast(id as nvarchar) from City;

SELECT CONVERT(INT,'5678') AS Result;

----------Cascade----------
--if we are deleting data from Parent table then corresponding records will also be detel as we from Child data on delete cascade---
--if we are updating data from Parent table then corresponding records will also be updated as we from Child data on update cascade---

CREATE TABLE Countries
(CountryID INT PRIMARY KEY,
CountryName VARCHAR(50),
CountryCode VARCHAR(3))
 
CREATE TABLE States
(StateID INT PRIMARY KEY,
StateName VARCHAR(50),
StateCode VARCHAR(3),
CountryID INT)

drop table Countries;
drop table States;

 select * from Countries;
 select * from States;

INSERT INTO Countries VALUES (1,'United States','USA')
INSERT INTO Countries VALUES (2,'United Kingdom','UK')
 
INSERT INTO States VALUES (1,'Texas','TX',1)
INSERT INTO States VALUES (2,'Arizona','AZ',1)
 
ALTER TABLE [dbo].[States]  WITH CHECK ADD  CONSTRAINT [FK_States_Countries] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[States]  WITH CHECK ADD  CONSTRAINT [FK_States_Countries] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([CountryID])
ON update CASCADE
GO
 
ALTER TABLE [dbo].[States] CHECK CONSTRAINT [FK_States_Countries]

delete from Countries where CountryID=1;
update Countries set CountryCode='Ind';
 select * from States;


 -----------VIEWS------------

 create table Students
 (
 id int primary key,
 name varchar(30) not null,
 address varchar(30) not null
 )

 create table Marks
 (
 id int primary key,
 mark int not null,
 );
 
 insert into Students (id,name,address) values(1,'Adi','BBSR');
 insert into Students (id,name,address) values(2,'Pravat','CTC');
 insert into Students (id,name,address) values(3,'Bijay','Khordha');
 insert into Students (id,name,address) values(4,'Puja','Banki');


 insert into Marks(id,mark) values(1,75);
 insert into Marks(id,mark) values(2,70);
 insert into Marks(id,mark) values(3,79);
 insert into Marks(id,mark) values(4,78);

  select * from vwDetails1;
 select * from vwDetails2;

 select * from Students;
 select * from Marks;

 drop view vwDetails1;
  drop view vwDetails2;

  --------for single table-----------
 create view vwDetails1 AS
 select name,address from Students    
 where id>1;

 -----for multi table---------
 select name,mark from 
 Students s,Marks m where s.id=m.id;

 ----------------Derived table--------------

 create table Employee3
 (
 id int not null,
 name varchar(30) not null,
 age int,
 sal int not null,
 dept varchar(30) not null
 )

 insert into Employee3 (id,name,age,sal,dept) values (1,'Prajyot',25,50000,'IT');
 insert into Employee3 (id,name,age,sal,dept) values (2,'Debasis',35,40000,'Mech');
 insert into Employee3 (id,name,age,sal,dept) values (3,'Sachin',33,45000,'IT');
 insert into Employee3 (id,name,age,sal,dept) values (4,'Jyoti',26,23000,'IT');
 insert into Employee3 (id,name,age,sal,dept) values (5,'Ajay',29,60000,'ETC');

 select * from Employee3;

 select * from
 (select id,name,age,sal,dept from Employee3)
 AS CEmployee where sal>40000;


 select * from
 (select id,name,age,sal,dept from Employee3)
 AS BEmployee where age>30;


 select * from
 (select id,name,sal,dept from Employee3)
 AS AEmployee where dept='IT';


 --------------Function-------------

 Create table Country
 (
 Cid int primary key,
 Cname varchar(30) not null,
 Population int,
 year int
 )

 insert into Country(Cid,Cname,Population,year) values (1,'India',50000,1990);
  insert into Country(Cid,Cname,Population,year) values (2,'USA',40000,1992);
   insert into Country(Cid,Cname,Population,year) values (3,'Nepal',300000,1992);
    insert into Country(Cid,Cname,Population,year) values (4,'India',70000,1995);
	 insert into Country(Cid,Cname,Population,year) values (5,'Nepal',60000,1995);


 select * from Country;

	 select SUM(Population) as Total_Population,
	        AVG(Population) as AvgPopulation,
			MAX(Population) as MaxPopulation,
			MIN(Population) as MinPopulation,
			count(*) as NumberOfColumn
	 from Country;


	 select Cname, year,count(*) as TotalPopulation
	 from Country
	 group by Cname,year
	 order by count(*) desc ;



----------------------StoreProcedure----------------------------------------

create table Student2
(
sid int primary key,
sname varchar(40) not null,
age int,
gender varchar(2) not null
)

insert into Student2(sid,sname,age,gender) values (101,'Ajay',25,'m');
insert into Student2(sid,sname,age,gender) values (102,'Raja',26,'m');
insert into Student2(sid,sname,age,gender) values (103,'Rani',24,'f');
insert into Student2(sid,sname,age,gender) values (104,'Praja',26,'m');
insert into Student2(sid,sname,age,gender) values (105,'Mantri',25,'m');

select * from Student2;

create procedure spStudent2
AS
BEGIN
 select * from Student2 where sid=104;
 select * from Student2 where sname='Rani';
END

spStudent2;
exec spStudent2;

drop procedure spStudent2;

-----if we want to add more queries then we have t0 give alter query and chnge the store procedure name as well------- 
Alter procedure spStudent2
AS
BEGIN
 select * from Student2 where sid=104;
 select * from Student2 where sname='Rani';
 select sname from Student2 where age>25;
END


---------here we can pass the value while executing the StoreProcedure--------
Alter procedure spStudent2
@s_id int,
@s_name varchar(100)
AS
BEGIN
 select * from Student2 where sid=@s_id;
 select * from Student2 where sname=@s_name;
END

spStudent2 102,'Praja';
spStudent2 @s_id=102,@s_name='Rani';

----------------here default value will be over ridden while we are passing again them----------
Alter procedure spStudent2
@s_id int=105,
@s_name varchar(100)='Ajay'
AS
BEGIN
 select * from Student2 where sid=@s_id;
 select * from Student2 where sname=@s_name;
END

spStudent2 102,'Rani';


