
1.select count of duplicate id;

Query

select id from employee group by id having count(id)>1;
--------------------------------------------------------------------------------------------------------------------------------------------
2.select increment salary sal=10/100=0.1*sal+sal
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

Alen
Varun
Kathy

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
-----------------------------------------------------------------------------------------------------------------------------------------------------
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
