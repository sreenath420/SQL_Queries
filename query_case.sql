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
102	1	Chips		96
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
101	218	null	123
102	366	282		309
105	133	59		60