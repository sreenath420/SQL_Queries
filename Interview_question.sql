
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

