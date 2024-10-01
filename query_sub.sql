Query:-1
input
--------------------------------------------------------------------------
name        opt_in
john         true
john         false
john         false
john         false
kek          true
kek          true                           
kek          true



output
------------------------------------------------------------------
name     opt_in
john     false
kek      true


select name,opt_in 
from (
select name,
opt_in,
row_number()over(partition by name order by opt_in) as rnk
from  john_kek
) as tem where rnk=2


Query:2
input

acco        transaction_time	trans_id        balance
550			2020-05-12 05:29:44	  1001			        2000
550			2020-05-15 10:29:26	1002			        8000
460			2020-03-12 11:29:24	1003			        9000
460			2020-04-30 11:29:57	1004			        7000
460			2020-04-30 12:32:44	1005			        5000
640			2020-02-18 06:29:34	1006			        5000
640			2020-02-18 06:29:37	1007			        9000

  
output
acco        transaction_time		trans_id        balance
460			2020-04-30 12:32:44		1005			5000
550			2020-05-15 10:29:26		1002			8000
640			2020-02-18 06:29:37		1007			9000


create table tran_table(
accno int,
transaction_time TIMESTAMP,
transaction_id int,
balance int
);

insert into tran_table
values
(550,'2020-05-12 05:29:44',1001,2000),
(550,'2020-05-15 10:29:26',1002,8000),
(460,'2020-03-12 11:29:24',1003,9000),
(460,'2020-04-30 11:29:57',1004,7000),
(460,'2020-04-30 12:32:44',1005,5000),
(640,'2020-02-18 06:29:34',1006,5000),
(640,'2020-02-18 06:29:37',1007,9000);
select accno,
transaction_time,
transaction_id,
balance
from
(
select *,
rank() over(partition by accno order by transaction_time desc) as rk
from tran_table) a
where rk=1

----------------------------------------------------------------------------------------------------------------------------------------------------------
QUERY 3 ->In From Clause
Input-
employee_id  leave_date   leave_type
1			 2022-01-10	   Sick
1			 2022-01-12	   Personal
1			 2022-01-15	   Sick
2			 2022-01-11	   Vacation
2			 2022-01-13	   Sick
2			 2022-01-14	   Vacation

output
employee_id			      leave_type
  1					           Sick
  2					           Vacation
  
  
create table employee_sick
(
employee_id int,
leave_date date,
leave_type varchar(30)
);

insert into employee_sick values
(1,'2022-01-10','Sick'),
(1,'2022-01-12','Personal'),
(1,'2022-01-15','Sick'),
(2,'2022-01-11','Vacation'),
(2,'2022-01-13','Sick'),
(2,'2022-01-04','Vacation');

select employee_id,leave_type
from(
select employee_id,leave_type,count(leave_type) as leave_ty
from employee_sick 
group by employee_id,leave_type) as tem
where leave_ty=2

1. Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'. */
ANS->SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id 
FROM ORDERS where salesman_ID 
IN 
(SELECT salesman_ID  FROM SALESMAN WHERE name='Paul Adam')
* 2. Write a query to display all the orders for the salesman who belongs to the city London. *.'
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id 
FROM ORDERS where salesman_ID IN 
(SELECT salesman_ID  FROM SALESMAN WHERE city='LONDON')
* 3. Write a query to find all the orders issued against the salesman who may works for customer whose id is 3007. *.4


* 4. Write a query to display all the orders which values are greater than the average order value for 10th October 2012. /*
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id 
FROM ORDERS WHERE purch_amt >
(select avg(purch_amt) from ORDERS
WHERE ord_date='2012-10-10');
/* 5. Write a query to find all orders attributed to a salesman in New York. */
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id 
FROM ORDERS where salesman_ID IN 
(SELECT salesman_ID  FROM SALESMAN WHERE city='New York')
