
---------------------------------------------------->input<----------------------------------------------------------------
person   TYPE	age
A1		Adult	54
A2		Adult	53
A3		Adult	52
A4		Adult	58
A5		Adult	54
C1		Child	20
C2		Child	19
C3		Child	22
C4		Child	15




------------------------------------------------->output<-------------------------------------------------------------------

person	person	age		age
A1		C1		54		20
A2		C2		53		19
A3		C3		52		22
A4		C4		58		15
A5		Null	54		Null

----------------------------------------------->Table creation<-------------------------------------------------------------------

create table family
(
person varchar(5),
type varchar(10),
age int
);
--------------------------------------------->Insert values in table<-------------------------------------------------------------
insert into family values ('A1','Adult',54),
('A2','Adult',53),
('A3','Adult',52),
('A4','Adult',58),
('A5','Adult',54),
('C1','Child',20),
('C2','Child',19),
('C3','Child',22),
('C4','Child',15);

---------------------------------------------------->Query<----------------------------------------------

with cte1 as(
select *,row_number() over (order by Person) as rn 
from family where type='Adult'),
cte2 as
(
select *,row_number() over(order by Person) as rn 
from family where type='Child')
select cte1.person,
cte2.person,
cte1.age,
cte2.age from 
cte1 left join
cte2 on cte1.rn=cte2.rn
