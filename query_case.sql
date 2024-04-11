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
