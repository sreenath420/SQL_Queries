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
