

id  name   add1   add2
1   x   chen    hyd
2   y   bang    mum


i want to output like

id name add
1    x  chen
1    x  hyd
2    y  bang
2    y  mum



we can achive this output by using union and union all

The UNION operator is used to combine the result-set of two or more SELECT statements.

Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order

The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL:



create table city_names(id int,
name varchar(30),
add1 varchar(30),
add2 varchar(30)
);

insert into city_names values
(1,'x','chen','hyd'),
(2,'y','bang','mum');
 
 
Querie

select id,name,add1
from city_names
union 
select id,name,add2
from city_names



