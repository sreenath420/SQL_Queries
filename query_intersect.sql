create table orders
(
id int,
item_ordered varchar(50)
)

insert into orders values
(1,'Pizza'),
(1,'Burger'),
(2,'Cold Drink'),
(2,'Burger'),
(3,'Burger'),
(3,'Cold Drink'),
(4,'Pizza'),
(4,'Cold Drink'),
(5,'Cold Drink'),
(6,'Burger'),
(6,'Cold Drink'),
(7,'Pizza'),
(8,'Burger')

id  iteam_ordered
1	Pizza
1	Burger
2	Cold Drink
2	Burger
3	Burger
3	Cold Drink
4	Pizza
4	Cold Drink
5	Cold Drink
6	Burger
6	Cold Drink
7	Pizza
8	Burger

																	INTERSECT
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
The INTERSECT clause in SQL is used to combine two SELECT statements but the dataset returned by the INTERSECT 
statement will be the intersection of the data sets of the two SELECT statements. In simple words, 
the INTERSECT statement will return only those rows which will be common to both of the SELECT statements.


select id from orders
where item_ordered='Cold Drink'
id
2
3
4
5
6

select id from orders
where item_ordered='Burger'
id
1
2
3
6
8

select id from ORDER 
where item_ordered='Cold Drink'
INTERSECT
select id from orders
where item_ordered='Burger';
id
2
3
6


