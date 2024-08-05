drop table if exists cars;
create table cars
(
	model_id		int primary key,
	model_name		varchar(100),
	color			varchar(100),
	brand			varchar(100)
);
insert into cars values(1,'Leaf', 'Black', 'Nissan');
insert into cars values(2,'Leaf', 'Black', 'Nissan');
insert into cars values(3,'Model S', 'Black', 'Tesla');
insert into cars values(4,'Model X', 'White', 'Tesla');
insert into cars values(5,'Ioniq 5', 'Black', 'Hyundai');
insert into cars values(6,'Ioniq 5', 'Black', 'Hyundai');
insert into cars values(7,'Ioniq 6', 'White', 'Hyundai');

select * from cars;

1	Leaf	Black	Nissan
2	Leaf	Black	Nissan
3	Model S	Black	Tesla
4	Model X	White	Tesla
5	Ioniq 5	Black	Hyundai
6	Ioniq 5	Black	Hyundai
7	Ioniq 6	White	Hyundai
			


--- Q1: Delete duplicate data --- 

-- Solution 1:
delete from cars
where model_id not in (select min(model_id)
					  from cars
					  group by model_name, brand);


-- Solution 2:
delete from cars
where ctid in ( select max(ctid)
                from cars
                group by model_name, brand
                having count(1) > 1);

-- Solution 3:
delete from cars
where model_id in (select model_id
                  from (select *
                       , row_number() over(partition by model_name, brand order by model_id) as rn
                       from cars) x
                  where x.rn > 1);


----------------------------------------------------------->Joins<--------------------------------------------------------------------

CREATE TABLE Table1 (
    ID VARCHAR(255)
);

INSERT INTO Table1 (ID) VALUES
('1'),
('1'),
('2'),
('3'),
(NULL),
(NULL),
('');
CREATE TABLE Table2 (
    ID VARCHAR(255)
);

INSERT INTO Table2 (ID) VALUES
('1'),
('1'),
('1'),
('5'),
(NULL),
(NULL);

SELECT Table1.ID AS Table1_ID, Table2.ID AS Table2_ID
FROM Table1
INNER JOIN Table2 ON Table1.ID = Table2.ID;
o/p:-
1	1
1	1
1	1
1	1
1	1
1	1

SELECT Table1.ID AS Table1_ID, Table2.ID AS Table2_ID
FROM Table1
LEFT JOIN Table2 ON Table1.ID = Table2.ID;

o/p:-
1	1
1	1
1	1
1	1
1	1
1	1
2	
3	
	
SELECT Tab12.ID AS Table1_ID, Tab14.ID AS Table2_ID
FROM Tab12
RIGHT JOIN Tab14 ON Tab12.ID = Tab14.ID;

o/p:-

1	1
1	1
1	1
1	1
1	1
1	1
	5
	
	
	
	

