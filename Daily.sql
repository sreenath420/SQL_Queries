------------------------------------------------------------>1<------------------------------------------------
input
cnt val
4	  R
2	  S
3	  Ra

Output

cnt val in_put
4	  R	  RRRR
2	  S	  SS
3	  Ra	RaRaRa


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
	with cte as(
	select * from tablea 
	 union 
	select * from tableb 
	)
	select empid,empname,min(salary)  from cte 
	group by empid,empname

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



