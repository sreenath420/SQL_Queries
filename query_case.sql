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

