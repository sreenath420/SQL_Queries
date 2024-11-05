------------------------------------------------------------->1<---------------------------------------------
create table in_put(cnt int,
val varchar(30));

insert into in_put values(4,'R'),(2,'S'),(3,'Ra')

select *, repeat(val,cnt) from in_put
cnt val
4	R
2	S
3	Ra

Output

cnt val in_put
4	R	RRRR
2	S	SS
3	Ra	RaRaRa