
create database microsoft1
drop database microsoft1
use microsoft1

create table Customer_data(customer_id int,customer_name varchar (30),age int)
select* from Customer_data

select Customer_name from customer_data

insert into Customer_data values (1,'ram',26)
insert into Customer_data values (2,'soham',28)
insert into Customer_data values (3,'gomathi',26)
insert into Customer_data values (4,'renuka',25)
insert into Customer_data values (5,'sawan',27)

select* from Customer_data where customer_id=1
select* from Customer_data where customer_id=3

select* from Customer_data order by customer_name desc
delete from Customer_data where customer_id=3

alter table Customer_data add sales int

alter table Customer_data alter column sales float

update Customer_data set sales=100 where customer_id =1
update Customer_data set sales=150 where customer_id =2
update Customer_data set sales=200 where customer_id =4
update Customer_data set sales=250 where customer_id =5

update Customer_data set sales=2*age


alter table Customer_data drop column sales

select sum (sales) from Customer_data
select min (sales) from Customer_data
select max (sales) from Customer_data

select sum (sales) as 'Sum of Sales' from Customer_data
select min (sales) as ' Min of Sales' from Customer_data
select max  (sales) as 'Max of Sales' from Customer_data
select avg (sales) as 'Avg of Sales' from Customer_data
select count (sales) as' Count of Sales' from Customer_data


sp_rename 'Customer_data','microsoft customer_data'
select* from  [dbo].[microsoft customer_data]
sp_rename '[dbo].[microsoft customer_data]', 'customer_data'

create table Customer_data_1(product_id int,product_name varchar (30))
drop table Customer_data_1
create table customer_data_1(customer_id int, product_id int,product_name varchar(30))
select* from customer_data_1
select* from customer_data
insert into customer_data_1 values(1,102,'coke')
insert into customer_data_1 values(2,102,'pepsi')
insert into customer_data_1 values(3,102,'fanta')
insert into customer_data_1 values(7,102,'sprite')
insert into customer_data_1 values(8,102,'dew')
--select * from parent table inner join child table on parent table.primary key = child table.primary key
select * from customer_data inner join customer_data_1 on customer_data.customer_id = customer_data_1.customer_id
select * from customer_data full outer join customer_data_1 on customer_data.customer_id = customer_data_1.customer_id
select * from customer_data left join  customer_data_1 on customer_data.customer_id = customer_data_1.customer_id
select * from customer_data right join customer_data_1 on customer_data.customer_id = customer_data_1.customer_id


create table customer_data_2(customer_id int, product_id int,product_name varchar(30))
select* from customer_data_2
insert into customer_data_2 values(9,103,'mango')
insert into customer_data_2 values(10,104,'apple')
insert into customer_data_2 values(11,105,'orange')
insert into customer_data_2 values(12,106,'banana')
insert into customer_data_2 values(13,107,'lemon')

select *from customer_data_2 union select* from customer_data_2
select* from customer_data_2 where customer_id=11

 
 select* from customer_data_2 where product_id=104 and product_name='apple'
 Select* from customer_data_2 where customer_id=12 or product_name='apple'



 Select* from customer_data_2 where not product_name='orange'


Select CURRENT_TIMESTAMP
Select DAY ('2020-12-05')
Select GETDATE ()
Select GETUTCDATE ()
Select ISDATE ('2020-03-05')
Select MONTH ('2020-12-05')
Select SYSDATETIME ()
Select YEAR ('2020-12-05')
Select COALESCE (null,null,null,null,null) --takes first non null value
Select CONVERT (int,26.85)
Select SESSION_USER
Select SYSTEM_USER
Select USER_NAME ()
Select ABS(-18)
Select Acos (0.5)
Select ASIN(0.5)
Select ATAN(0.5)
Select AVG (sales)from Customer_data



Select CEILING(26.10)
Select Cos(90)
Select Cot(90)
Select Count(Sales) from Customer_data


Select DEGREES(1)
Select EXP(1)
Select FLOOR(25.90)
Select Log(2)
Select LOG10(10)
Select Max(sales)from Customer_data



Select Min (sales)from Customer_data
Select PI()
Select POWER(2,3)
Select Radians(90)
Select Rand()

Select ROUND(25.68,1)


Select sign (-9)


//**SIN Returns the sine of a number**//

Select sin (45)

//**SQRT Returns the square root of a number**//

Select sqrt (64)

--//**SUM Calculates the sum of a set of values**//

Select Sum (sales) from Customer_data

--//**TAN Returns the tangent of a number**//

Select TAN(90)

--string functions

SELECT CHAR (102) --ascii code
SELECT CONCAT ('Sasmita','Kar')
SELECT DATALENGTH ('Sasmita l')
SELECT LEFT('Sasmita',2)
select LEN('Sasmita l')
SELECT LOWER('Sasmita')
SELECT LTRIM('     Sasmita')
select REPLACE('Sasmita','B','G')
SELECT REPLICATE('Sasmita ',5)
select REVERSE('Sasmita')
SELECT RIGHT('Sasmita',2)
SELECT RTRIM('Sasmita ')
SELECT SUBSTRING('Sasmita',3,3)
select UNICODE('A') -- Reverse of Char
select UPPER('Sasmita')

//**Working with duplicates**//
Create table Employees
(
ID int,
FirstName nvarchar(50),
LastName nvarchar(50),
Gender nvarchar(50),
Salary int
)
Select * from Employees


Insert into Employees values (1, 'Mark', 'Hastings', 'Male', 56000)
Insert into Employees values (1, 'Mark', 'Hastings', 'Male', 58000)
Insert into Employees values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into Employees values (2, 'Mary', 'Lambeth', 'Female', 28000)
Insert into Employees values (2, 'Mary', 'Lambeth', 'Female', 30000)
Insert into Employees values (3, 'Ben', 'Hoskins', 'Male', 65000)
Insert into Employees values (3, 'Ben', 'Hoskins', 'Male', 68000)
Insert into Employees values (3, 'Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values (4, 'Shri', 'gowda', 'Male', 40000)

//**Dense rank**//
SELECT *, 
DENSE_RANK() OVER (ORDER BY ID ASC) AS DENSERANK FROM Employees
select * from Employees

//** Condition to Dense Ranking**//

WITH RESULT AS
(SELECT *,DENSE_RANK() OVER (ORDER BY ID DESC) AS DENSERANK
FROM EMPLOYEES
)
SELECT TOP 1 SALARY
FROM RESULT
WHERE DENSERANK = 2
ORDER BY SALARY DESC

---CORRECT SYNTAX
WITH RESULT AS
(SELECT *,DENSE_RANK() OVER (ORDER BY ID DESC) AS DENSERANK
FROM EMPLOYEES
)
SELECT TOP 1 SALARY
FROM RESULT
WHERE DENSERANK = 2
ORDER BY SALARY DESC

WITH RESULT AS
(SELECT *,DENSE_RANK() OVER (ORDER BY ID DESC) AS DENSERANK
FROM EMPLOYEES)
SELECT Top 1*
FROM RESULT
WHERE DENSERANK = 2
ORDER BY SALARY DESC
----
//**Row number**//
SELECT SALARY,
ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS ROWNUMBER FROM EMPLOYEES

//** Giving condition to Row number**//
WITH RESULT AS
(SELECT *,ROW_NUMBER() OVER (ORDER BY ID DESC) AS ROWNUMBER
FROM EMPLOYEES
)
SELECT*
FROM RESULT
WHERE ROWNUMBER = 2

//** Case statement**//
Create table Employees_1
(
Id int primary key identity,
Name nvarchar(10),
GenderId int
)

Insert into Employees_1 values ('Mark', 1)
Insert into Employees_1 values ('John', 1)
Insert into Employees_1 values ('Amy', 2)
Insert into Employees_1 values ('Ben', 1)
Insert into Employees_1 values ('Sara', 2)
Insert into Employees_1 values ('David', 1)

Select * from Employees_1

--Using CASE statement
SELECT Name, GenderId,
CASE WHEN GenderId = 1
THEN 'Male'
ELSE 'Female'
END AS Gender
FROM Employees_1

--Using iif statement
SELECT Name, GenderId, IIF(GenderId = 1, 'Male', 'Female') AS Gender
FROM Employees_1

//**Deleting th duplicates**//
WITH tb4CTE AS
(
SELECT *, ROW_NUMBER()OVER(PARTITION BY ID ORDER BY ID) AS RowNumber
FROM Employees
)
DELETE FROM tb4CTE WHERE RowNumber > 1
Select * from Employees

Select * from [dbo].[Orders$]
Select * from Returns$
Select * from Users$
//** How to create temporary tables**//
with output as (Select TB1.customer_id, Customer_name, sales, profit from TB1 inner join TB2 on TB1.customer_id=TB2.customer_id)
select * from output
where customer_id = 3
Create view V4 as (Select TB1.customer_id, Customer_name, sales, profit from TB1 inner join TB2 on TB1.customer_id=TB2.customer_id)
Select * from V4
where customer_id = 3

//**Store procedure**//
//**CREATE PROCEDURE procedure_name
AS
sql_statement
GO;**/
Create procedure P1 as Select TB1.customer_id, Customer_name, sales, profit from TB1 inner join TB2 on TB1.customer_id=TB2.customer_id
Go
Exec P1

--Grant previlege--
Grant previlege name(user name) on object name(table name) to user name|Role(managerial)

//** Revoke**//
revoke Previllege name(user name) on object name(table name) to user name|Role(managerial)

--Group by--
select sum(Sales),[Order Priority] from [dbo].[Orders$] group by [Order Priority]


//** Transactional control langauge**//

select*from customer_sales;
begin transaction;
delete from customer_sales where sales =10000;
commit;
begin transaction;
delete from customer_sales where sales=100.33;
rollback;
begin transaction
Savepoint;


 --Triggers--
CREATE TABLE Employee_Test
(
Emp_ID INT Identity,
Emp_name Varchar(100),
Emp_Sal Decimal (10,2)
)

INSERT INTO Employee_Test VALUES ('Anees',1000);
INSERT INTO Employee_Test VALUES ('Rick',1200);
INSERT INTO Employee_Test VALUES ('John',1100);
INSERT INTO Employee_Test VALUES ('Stephen',1300);
INSERT INTO Employee_Test VALUES ('Maria',1400);

select *from Employee_Test

CREATE TABLE Employee_Test_Audit
(
Emp_ID int,
Emp_name varchar(100),
Emp_Sal decimal (10,2),
Audit_Action varchar(100),
Audit_Timestamp datetime
)

select *from Employee_Test_Audit

CREATE TRIGGER trgAfterInsert ON [dbo].[Employee_Test]
FOR INSERT
AS
declare @empid int;
declare @empname varchar(100);
declare @empsal decimal(10,2);
declare @audit_action varchar(100);
select @empid=i.Emp_ID from inserted i;
select @empname=i.Emp_Name from inserted i;
select @empsal=i.Emp_Sal from inserted i;
set @audit_action='Inserted Record -- After Insert Trigger.';

insert into Employee_Test_Audit
(Emp_ID,Emp_Name,Emp_Sal,Audit_Action,Audit_Timestamp)
values(@empid,@empname,@empsal,@audit_action,getdate());

PRINT 'AFTER INSERT trigger fired.'
GO

insert into Employee_Test values('Ravi',1500);
