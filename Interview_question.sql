
1.select count of duplicate id

Query

select id from employee group by id having count(id)>1;
--------------------------------------------------------------------------------------------------------------------------------------------
2.select increment salary sal=10/100=0.1*sal+sal;
Query

select id,name,sal,((0.1*sal)+sal) as incre_sal from employee;
---------------------------------------------------------------------------------------------------------------------------------------------

3.Second highest salary

with cte as
(
select emp_name,salary,dense_rank() over(order by salay desc) as rnk from emp
)
select salary from cte where rnk=3
Method 2:-
with subquery
SELECT MAX(SALARY) FROM Employee WHERE SALARY < (SELECT MAX(SALARY) FROM Employee);

-----------------------------------------------------------------------------------------------------------------------------------------------
4.Delete duplicate records from Employee table(e-id) column

Delete from employee
Where id not in (
Select max(id) from employee 
Group by e_name,e_address,e_age
)
------------------------------------------------------------------------------------------------------------------------------------------------------
5.wirte query to fetch only present one time in given values
select name,count(name) from city11 group by name having count(name)=1
-----------------------------------------------------------------------------------------------------------------------------------------------------
write a query to find latest city visited customer
6.select id,name,location,date
from customer_location loc
inner join (
select id as lid,max(date) from customer_location 
group by id) lat on loc.id=lat.lid and location='hyd'
--------------------------------------------------------------------------------------------------------------------------------------------------------
7. write a query sql convert first letter caps and lower letter
ename
aLEn
kaThY
EleNa
vArUn

ename
Alen
Varun
Kathy
Elena

create table tab1(
ename varchar(30)
);

insert into tab1 values('aLEn'),
('kaThY'),
('EleNa'),
('vArun');


SELECT CONCAT(UPPER(SUBSTRING(ename, 1,1)) , LOWER(SUBSTRING(ename, 2))) AS capit
FROM tab1;
capit
Alen
Kathy
Elena
Varun
------------------------------------------------------------------>8<-----------------------------------------------------------------------------------
input
empid 	empname 		 esalary
1		    sharan			  100
2		    sreenath			100
3		    ujjwala			  200
  
output
empid 	empname esalary   cum
1	      sharan	100	      100
2	      sharan	100	      200
3	      sharan	200	      400

select empid,
  emp_name,
  salary, 
  sum(salary) over(order by empid)
  from emp111

Datasets:

Table 1 - Employee:

id	first_name	last_name	salary	department_id
1	John	Smith	20000	1
2	Ava	Muffinson	10000	5
3	Cailin	Ninson	30000	2
4	Mike	Peterson	20000	2
5	Ian	Peterson	80000	2
6	John	Mills	50000	3
Table 2 - Projects:

id	title	start_date	end_date	budget
1	Build a cool site	2011-10-28	2012-01-26	1000000
2	Update TPS Reports	2011-07-20	2011-10-28	100000
3	Design 3 New Silly Walks	2009-05-11	2009-08-19	100
Table 3 - Department

id	name
1	Reporting
2	Engineering
3	Marketing
4	Biz Dev
5	Silly Walks
Table 4 - Employee Projects

project_id	employee_id
2	1
3	2
1	3
1	4
1	5
Please answer the following questions by writing a SQL query (MySQL) per answer.

Question 1 :

Find the Second Highest Salary Getter for each Department.

Question 2 :

Select all projects that have more than 1 employee working for it ;

Question 3:

What All Projects are running under what all departments :

Question 4:

Count the Number Of Employees in Each Departments. If any department doesn’t have any employee, show 0 as the number of employees.


----------------------------------------------------------------------------------------------------------------------------------------------------
Question 5:
Orders table contains order information, including the CustomerID, OrderID, and OrderDate. The Customers table contains customer information, 
including the CustomerID and CustomerName.we need to retrieve the latest order made by each customer in the year 2023.



-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);


-- Create Orders table
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE
);

-- Insert sample data into Customers table
INSERT INTO Customers (CustomerID, CustomerName)
VALUES
    (1, 'John Doe'),
    (2, 'Jane Smith'),
    (3, 'Michael Johnson'),
    (4, 'Emily Brown');

-- Insert sample data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
    (101, 1, '2023-01-15'),
    (102, 2, '2023-02-20'),
    (103, 3, '2023-03-10'),
    (104, 1, '2023-04-05'),
    (105, 4, '2023-05-12'),
    (106, 2, '2023-06-25'),
    (107, 3, '2023-07-08'),
    (108, 1, '2023-08-17'),
    (109, 2, '2023-09-22'),
    (110, 4, '2023-10-30');
 
select C.CustomerID,C.CustomerName,O.OrderDate,O.OrderID 
from Customers C
inner join 
(
select CustomerID,OrderDate,OrderID,
row_number() over(partition by customerID order by OrderDate) as rnk
from Orders where year(OrderDate)=2023) O
on C.CustomerID=O.CustomerID and O.rnk=1
 


-------------------------------->output<----------------------------==
CustomerID    CustomerName            OrderDate                OrderID
-----------------------------------------------------------------------
1	          John Doe	              2023-01-15	             101
2	          Jane Smith	          2023-02-20	             102
3	          Michael Johnson	      2023-03-10	             103
4	          Emily Brown	          2023-05-12	             105

-------------------------------------------------->second method2<-------------------------------------------------------------------

WITH LatestOrders AS (
    SELECT CustomerID, OrderID, OrderDate,
           ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS RowNum
    FROM Orders
    WHERE YEAR(OrderDate) = 2023
)
SELECT c.CustomerID, c.CustomerName, lo.OrderID, lo.OrderDate
FROM Customers c
INNER JOIN LatestOrders lo ON c.CustomerID = lo.CustomerID
WHERE lo.RowNum = 1;

Question:6
----------------------------------------------->13th max salary<-----------------------------------------
without using:
rank, dense rank, rownumber, order, limit, offset, top
query:-
SELECT DISTINCT A.salary
FROM employees A
WHERE 13 = (SELECT COUNT(DISTINCT B.salary)
            FROM employees B
            WHERE B.salary >= A.salary);
Question:7
------------------------>2nd highest salary dept wise<-------------------------


2nd Hightest salary on dept wise in sql query


drop table if exists Employee
CREATE TABLE Employee (
    empid INT PRIMARY KEY,
    name VARCHAR(50),
    sal INT
);

INSERT INTO Employee (empid, name, sal) VALUES
(101, 'Raju', 10000),
(102, 'Ramu', 15000),
(103, 'Kiran', 8000),
(104, 'Ravi', 7000);

drop table if exists Dept

CREATE TABLE Dept (
    deptno INT,
    empid INT,
    FOREIGN KEY (empid) REFERENCES Employee(empid)
);

INSERT INTO Dept (deptno, empid) VALUES
(10, 101),
(10, 103),
(20, 102),
(10, 104);

query:

WITH RankedSalaries AS (
    SELECT 
        d.deptno, 
        e.sal, 
        DENSE_RANK() OVER (PARTITION BY d.deptno ORDER BY e.sal DESC) AS rank
    FROM 
        Employee e
    JOIN 
        Dept d ON e.empid = d.empid
)

SELECT 
    deptno, 
    MAX(sal) AS second_highest_salary
FROM 
    RankedSalaries
WHERE 
    rank = 2
GROUP BY 
    deptno;

Question :7
-------------------------------->find student more than 70 marks each subject greater than 3<----------------------------------
output:-
student_name  subjects_above_70
Alice	          3
Bob		          3
Charlie	        3
Eve		          5

CREATE TABLE students (
    Student_name VARCHAR(50),
    sub1 INT,
    sub2 INT,
    sub3 INT,
    sub4 INT,
    sub5 INT
);

INSERT INTO students (Student_name, sub1, sub2, sub3, sub4, sub5) VALUES
('Alice', 80, 75, 90, 60, 55),
('Bob', 65, 70, 75, 80, 85),
('Charlie', 85, 60, 70, 90, 95),
('David', 60, 65, 70, 75, 80),
('Eve', 95, 90, 85, 80, 75);



with cte as  (
    SELECT 
        Student_name,
        (CASE WHEN sub1 > 70 THEN 1 ELSE 0 END +
         CASE WHEN sub2 > 70 THEN 1 ELSE 0 END +
         CASE WHEN sub3 > 70 THEN 1 ELSE 0 END +
         CASE WHEN sub4 > 70 THEN 1 ELSE 0 END +
         CASE WHEN sub5 > 70 THEN 1 ELSE 0 END) AS subjects_above_70
    FROM students
) select * from cte where subjects_above_70 >=3

Question:-8 
------------------------------------>Cumulative_sum_by_month_wise<---------------------------------

revenue    date
3000      22-may   
5000      23-may 
5000      25-may  
10000     22-june
12500      3-july
 
output
date   total_revenue
22-may   3000
23-may   8000
25-may   13000
22-june  10000 
3-july   12500

Query:-

CREATE TABLE revenue_table (
    revenue INT,
    revenue_date DATE
);

INSERT INTO revenue_table (revenue, revenue_date) VALUES
(3000, '2023-05-22'),
(5000, '2023-05-23'),
(5000, '2023-05-25'),
(10000, '2023-06-22'),
(12500, '2023-07-03');

SELECT Month(revenue_date) AS month,
    SUM(revenue) OVER (PARTITION BY Month(revenue_date) ORDER BY revenue_date) AS cumulative_revenue
FROM 
    revenue_table;

--------------------------------------------------->To calculate the total amount spent by each customer if amount is null need update zero<----------------------------------------------


CREATE TABLE customer_table (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE order_table (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer_table(customer_id)
);



INSERT INTO customer_table1(customer_id, name, city) VALUES
(1, 'John Doe', 'New York'),
(2, 'Jane Smith', 'Los Angeles'),
(3, 'Mike Johnson', 'Chicago');


INSERT INTO order_table1(order_id, customer_id, order_date, amount) VALUES
(101, 1, '2024-08-01', 150.00),
(102, 2, '2024-08-02', 200.00),
(103, 1, '2024-08-03', 300.00),
(104, 3, '2024-08-04', 450.00);




SELECT 
    c.customer_id,
    c.name,
    c.city,
    coalesce(sum(o.amount),0) AS total_amount
FROM 
    customer_table1 c
left
JOIN 
    order_table1 o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.name, c.city;

------------------------------->query to get all dept_id  in which average salary is greater than 12000  consider employee less than 5000<-------------------------

CREATE TABLE employees234 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employees234 (emp_id, name, dept_id, salary) VALUES
(1, 'Manish', 100, 10000),
(2, 'Ankit', 100, 15000),
(3, 'Mohan', 100, 10000),
(4, 'Sohan', 100, 5000),
(5, 'Amit', 200, 12000),
(6, 'Ram', 200, 12000),
(7, 'Shyam', 200, 9000),
(8, 'Rohan', 200, 5000);

SELECT dept_id, AVG(salary) AS average_salary
FROM employees234 where salary > 5000
GROUP BY dept_id
HAVING AVG(salary) > 10000;

output
dept_id     average_salary
100	       11666.666667
200	       11000.000000

---------------------------------------------------->count the number of records<-----------------------------------------------
drop table table2
CREATE TABLE table1 (
    column1 INT
);

INSERT INTO table1 (column1) 
VALUES (1), (1), (1), (NULL);

CREATE TABLE table2 (
    column1 INT
);

INSERT INTO table2 (column1) 
VALUES (1), (1), (NULL);

output records count:-

select count(*) from  table1 join table2 on table1.column1=table2.column1
6
	column1	column1
	1	        1
	1	        1
	1	        1
	1	        1
	1	        1
	1	        1

select count(*) from  table1 right outer join table2 on table1.column1=table2.column1
7
column1	column1
1	        1
1	        1
1	        1
1	        1
1	        1
1	        1
Null      Null

select count(*) from  table1 full outer join table2 on table1.column1=table2.column1
8

column1	column1
1	        1
1	        1
1	        1
1	        1
1	        1
1	        1
Null           Null
Null           Null

------------------------------------------------------><-------------------------------------

input
employee manager
--------------
Lilly	 null
Justine	Lilly
Bella	Lilly
Colton	Justine
Arthur	Justine

output
Employee node_type
------------------------
Lilly	root
Justine	inner
Colton	leaf
Bella	leaf
Arthur	leaf


Query:-

select employee,
case when manager is null then 'root' 
     when employee in (select distinct manager from manager where manager is not null)
     then 'inner' else 'leaf'
end as node_type
from manager;


	

