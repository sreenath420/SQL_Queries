--------------------------------------------------->Case Statemnt<----------------------------------------------------

A CASE statement in SQL allows you to perform conditional logic inside a query, similar to if-else statements in programming languages. 
It evaluates a list of conditions and returns a value when the first condition is met. 
If no conditions are met, an optional ELSE clause can return a default value

Syntax
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE resultN
END

-------------------------------------------->Example:-1<--------------------------------------------------------------------
CREATE TABLE Employees (
    e_id INT PRIMARY KEY,            -- Employee ID, unique for each employee
    e_name VARCHAR(100) NOT NULL,    -- Employee Name
    department VARCHAR(100),         -- Department Name
    salary DECIMAL(10, 2),           -- Salary with 2 decimal places
    hire_date DATE                   -- Date the employee was hired
);

INSERT INTO Employees (e_id, e_name, department, salary, hire_date)
VALUES 
(1, 'Alice', 'Engineering', 6000.00, '2020-06-15'),
(2, 'Bob', 'Sales', 4500.00, '2019-08-22'),
(3, 'Charlie', 'Marketing', 5000.00, '2021-01-10'),
(4, 'David', 'Engineering', 7000.00, '2018-12-05'),
(5, 'Eve', 'Human Resources', 5500.00, '2022-03-01');

select e_id,
e_name,
department,salary,
case 
when salary <=5000 then 'grade_3'
else 'grade_2'
end as salary_grades
from Employees

ouput:-
1	Alice	Engineering	6000.00	grade_2
2	Bob	Sales	4500.00	grade_3
3	Charlie	Marketing	5000.00	grade_3
4	David	Engineering	7000.00	grade_2
5	Eve	Human Resources	5500.00	grade_2


-------------------------------------------------->


create table customer(
store int,
week int,
product_name varchar(40),
sales int
);

insert into customer values
(102,1,'Chips',96),
(102,1,'Chocolate',130),
(102,1,'Biscuit',140),
(101,1,'Chips',48),
(101,1,'Chocolate',90),
(101,1,'Biscuit',80),
(105,1,'Chips',87),
(105,1,'Chocolate',46),
(105,2,'Chips',59),
(102,2,'Chocolate',282),
(102,3,'Biscuit',212),
(102,3,'Chips',97),
(105,3,'Chocolate',60),
(101,3,'Biscuit',123);

input
------------------------------------------------------------------------------------------------

102	  1	Chips		96
102	1	Chocolate	130
102	1	Biscuit		140
101	1	Chips		48
101	1	Chocolate	90
101	1	Biscuit		80
105	1	Chips		87
105	1	Chocolate	46
105	2	Chips		59
102	2	Chocolate	282
102	3	Biscuit		212
102	3	Chips		97
105	3	Chocolate	60
101	3	Biscuit		123


select store,
sum(case when week=1 then sales end) as first_week,
sum(case when week=2 then sales end) as second_week,
sum(case when week=3 then sales end) as third_week
from customer 
group by store
order by store;


output
------------------------------------------------------------------------------------
store  first_week    second_week   third_week
101	    218	          null	        123
102	    366	          282		        309
105	    133	          59		        60


  Example:-2
you're given the table on user viewership categorised by device type where the three types are laptop, tablet, and phone.

Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership. Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.
user_id	  device_type		view_time
---------------------------------------------------------------
123  	 	tablet			01/02/2022 00:00:00
125			laptop			01/07/2022 00:00:00
128			laptop			02/09/2022 00:00:00
129			phone			  02/09/2022 00:00:00
145			tablet			02/24/2022 00:00:00


Example Output
---------------------------------------
laptop_views	      mobile_views
  2					              3



Create table devices (
user_id int,
device_type varchar(20),
view_time date
);

Insert into devices values
(123,'tablet','2022-01-02'),
(125,'laptop','2022-01-07'),
(128,'laptop','2022-02-09'),
(129,'phone', '2022-02-09'),
(145,'tablet','2022-02-24');

	

SELECT sum(case WHEN device_type='laptop' THEN 1 else 0 end) as laptop_views,
sum(case WHEN device_type in('tablet','phone') THEN 1 else 0 end) as mobile_views
FROM viewership

------------------------------------------------------------------------------------------------
question-
1.SUPPOSE YOU HAVE THE GIVEN DATAFRAME OR TABLE GET THE RESULTANT OUTPUT.
2. YEAR WISE SUM OF TOTAL QUANTITY WHERE YEARS WILL COME IN COLUMNS FOR EACH

Create table product(
id int,
product varchar(10),
salesyear int,
QuantitySold int
);
INSERT INTO product (id,product,salesyear,QuantitySold)
VALUES (1, 'Laptop', '1998', '2500'),
       (2, 'Laptop', '1999', '3600'),
       (3, 'Laptop', '2000', '4200'),
       (4, 'Keyboard', '1998', '2300'),
       (5, 'Keyboard', '1999', '3600'),
       (6, 'Keyboard', '2000', '5000'),
       (7, 'Mouse', '1998', '6000'),
       (8, 'Mouse', '1999', '3400'),
       (9, 'Mouse', '2000', '4600');
Input DataFrame---------------------------------------------------------------------------------------------------------
|id| product|salesyear|QuantitySold|
|1| Laptopl 1998| 2500|
| 2| Laptopl 1999| 3600|
13| Laptopl 2000| 4200|
| 4|Keyboard/ 1998/ 2300|
I 5|Keyboardl 1999| 3600|
I 6|Keyboardl 2000| 50001
|7| Mousel 1998| 6000|
|8| Mousel 1999| 3400|
| 9 Mousel 20001 4600|
  
Resultant DataFrame---------------------------------------------------------------------------------------------------
product|1998|1999|2000|
Keyboard|2300|3600|5000|
Laptop| I 2500 - 3600 4200
Mouse|600e|3400|4600|

Solution---------------------------------------------------------------------------------------------------------------
select product,
sum(case when salesyear=1998 then QuantitySold end) as '1998',
sum(case when salesyear=1999 then QuantitySold end) as '1999',
sum(case when salesyear=2000 then QuantitySold end) as '2000'
from product 
group by product order by product


------------------------------------------------------------------------------------------------
Question-
1. For every customer who bought Photoshop (Here
only Customer_id 123 and 913 has bought
Photoshop)
2. Return a list of the customers, and the total spent
on all the products except for Photoshop products

Create table pshop(
CUSTOMERID int,
PRODUCT varchar(20),
REVENUE int
);

INSERT INTO pshop (CUSTOMERID,PRODUCT,REVENUE)
VALUES (123, 'Photoshopl', 50),
(123, 'Premier Pro', 100),
(123,'After Effects', 50),
(234, 'Ilustratorl',200),
(234, 'Premier Pro', 100),
(562, 'Ilustratorl', 200),
(913, 'Photoshopl',50),
(913, 'Premier Pro', 100),
(913, 'Ilustratorl',200);
  
Input DataFrame---------------------------------------------------------------------------------------------------------
123| Photoshopl 50|
123| Premier Pro| 100|
123|After Effects| 50|
234| Ilustratorl 200|
234| Premier Pro| 100|
562| Ilustratorl 200|
913| Photoshopl 50|
913| Premier Pro| 100|
913| Ilustratorl 200|

Resultant DataFrame---------------------------------------------------------------------------------------------------
CUSTOMER_ID|total_spend|
123|150
913|300

Solution1---------------------------------------------------------------------------------------------------------------
select CUSTOMERID,
sum(case when PRODUCT!='Photoshopl' then REVENUE end) as a 
FROM PSHOP WHERE CUSTOMERID IN
(select CUSTOMERID
FROM PSHOP where PRODUCT ='Photoshopl')
GROUP BY CUSTOMERID;
select CUSTOMERID
FROM PSHOP where PRODUCT ='Photoshopl'
  
Solution2---------------------------------------------------------------------------------------------------------------
with cte as 
(select CUSTOMERID,REVENUE
FROM PSHOP where PRODUCT !='Photoshopl' and CUSTOMERID in ('123','913'))
select CUSTOMERID,sum(REVENUE) as total_spend from cte
group BY CUSTOMERID;


----------------------------------------------------------------------------------------------------
i/p-
TransactionID, TransactionDate, Amount, TransactionType
1	              2024-01-15	56	     Debit
2	              2024-01-15	23	     Credit
3	              2024-01-15	880	     Credit
4	              2024-01-15	76	     Debit
5	              2024-01-16	60	     Credit
6	              2024-01-16	146	     Debit
			
o/p-
TransactionDate, Amount
2024-01-15	     771
2024-01-16	     -86
----------------------------------------------------------------------------------------------------
drop table FinancialTransactions;
create table FinancialTransactions
(TransactionID int primary key,
TransactionDate date,
Amount float,
TransactionType varchar(10));
--Data Insertion Script
Insert into FinancialTransactions
(TransactionID,TransactionDate,Amount,TransactionType)
values
(1,'2024-01-15',56.00,'Debit'),
(2,'2024-01-15',23.00,'Credit'),
(3,'2024-01-15',880.00,'Credit'),
(4,'2024-01-15',76.00,'Debit'),
(5,'2024-01-16',60.00,'Credit'),
(6,'2024-01-16',146.00,'Debit');
select * from FinancialTransactions;

--------------------------------------------------solution1----------------------------------------
select 
TransactionDate, 
sum(case when TransactionType='credit' then Amount else - Amount end) as Amount
From FinancialTransactions
group by TransactionDate;

--------------------------------------------------solution2------------------------------------------
with sum as(
select TransactionDate,sum(Amount) as a
From FinancialTransactions where TransactionType='credit'
group by TransactionDate )
,diff as(
select TransactionDate,sum(Amount) as b
From FinancialTransactions where TransactionType='debit'
group by TransactionDate 
)
select 
s.TransactionDate, (s.a-d.b) as Amount
from sum s
join diff d
on s.TransactionDate=d.TransactionDate;

--------------------------------------------------->query<------------------------------------------------------------------
-------------------->input<------------------------
contact  col1  col2  col3  col4     modified_date
abc		  x		y					2024-04-03
abc				m	  d				2024-04-05
abc					  g	   k		2024-04-06
abc		  q		      a	   o		2024-04-04

------------->ouput<--------------
abc	q	m	g	k
--->create table 
create table concta(
contact varchar(10),
col1   varchar(2),
col2 varchar(2),
col3 varchar(2),
col4 varchar(2),
modified_date date
)
-->insert values into table<---------
insert into concta values
('abc','x','y',null,null,'2024-04-03'),
('abc',null,'m','d',null,'2024-04-05'),
('abc',null,null,'g','k','2024-04-06'),
('abc','q',null,'a','o','2024-04-04');

select * from concta
---------------------------------->query<----------------------
select contact,
min(case when modified_date then col1 end) as col,
min(case when modified_date then col2 end) as col, 
max(case when modified_date then col3 end) as col,
min(case when modified_date then col4 end) as col  
from concta
group by contact


