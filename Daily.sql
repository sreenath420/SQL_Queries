------------------------------------------------------------>1<---------------------------------------------------
input
cnt val
4	  R
2	  S
3	  Ra

Output

cnt      val     in_put
4	  R	  RRRR
2	  S	  SS
3	  Ra	  RaRaRa


create table in_put(cnt int,
val varchar(30));

insert into in_put values(4,'R'),(2,'S'),(3,'Ra')

select *, repeat(val,cnt) from in_put


------------------------------------------------>2<------------------------------------------------------------
sname   sid   marks
A   	X   	75
A   	Y   	75
A   	Z   	80
B   	X   	90
B   	Y   	91
B   	Z   	75

output
sname   tot_sum
A   	155
B   	181

create table stude_table(sname varchar(30),
sid varchar(2),
marks int);
insert into stude_table value('A','X',75),('A','Y',75),('A','Z',80),('B','X',90),('B','Y',91),('B','Z',75);

select * from stude_table

with cte as(
select *,row_number() over(partition by sname order by marks desc) as rnk
from stude_table)
select sname,sum(marks) as tot_sum
from cte where rnk<=2
group by sname

-------------------------------------------->3.Find maximum ID by excluding Duplicates Records<----------------------------------------------------


Find maximum ID by excluding Duplicates Records
create table empl (id int)

insert into empl values (2),(5),(6),(6),(7),(8),(8);


method:-1
select max(id) from empl where id not in (
select id from empl
group by id
having count(*)>1
)

method:-2
with ctc as(
select id from empl
group by id
having count(*)=1
)

select max(id) from ctc

------------------------------------------------>4<-----------------------------------------------------------------

create table tablea(empid int, empname varchar(50), salary int);
create table tableb(empid int, empname varchar(50), salary int)


insert into tablea values(1,'AA',1000),(2,'BB',300)
insert into tableb values(2,'BB',400),(3,'CC',100)

select * from tablea
empid	empname	salary
1		AA		1000
2		BB		300

select * from tableb
empid	empname	salary
2		BB		400
3		CC		100


output
empid empname sal
1	AA	1000
2	BB	300
3	CC	100
	with cte as(
	select * from tablea 
	 union 
	select * from tableb 
	)
	select empid,empname,min(salary)  from cte 
	group by empid,empname




-------------------------------------------------->5<------------------------------------------------------------

create table sales(month varchar(50), ytd_sales int, monthnum int)


insert into sales values('jan',15,1),('feb',22,2),('mar',35,3),('apr',45,4),('may',60,5)


month	ytd_sales	monthnum
jan		15				1
feb		22				2
mar		35				3
apr		45				4
may		60				5
output

month	    ytd_sales			perdic_sales
jan		15				15
feb		22				7
mar		35				13
apr		45				10
may		60			    	15


	
with cte as
(select *,
lag(ytd_sales,1,0) over(order by monthnum) as sales_date
from sales
)
select month,ytd_sales,(ytd_sales-sales_date) as perdic_sales
from cte





------------------------------------>6<----------------------------------------------

create table happiness_tbl (ranking int, country varchar(50));

insert into happiness_tbl values (1,'Finland'),(2,'Denmark'),(3,'Iceland'),
(4,'Israel'),(5,'Netherlands'),(6,'Sweden'),(7,'Norway'),(8,'Switzerland'),
(9,'Luxembourg'),(128,'Srilanka'),(126,'India')

ranking	country
1	Finland
2	Denmark
3	Iceland
4	Israel
5	Netherlands
6	Sweden
7	Norway
8	Switzerland
9	Luxembourg
128	Srilanka
126	India

output
country
India
Srilanka
Finland
Denmark
Iceland
Israel
Netherlands
Sweden
Norway
Switzerland
Luxembourg

select country  
from (
select country, case 
when country='India' then 1 
when country='Srilanka'    then 2
else 3 end as dervie_rank
from happiness_tbl)  AS ranked_countries
order by  dervie_rank 



