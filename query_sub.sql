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

