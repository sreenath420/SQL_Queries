
|id    | namesl   |
+------+----------+
|    1 | a        |
|    1 | b        |
|    1 | c        |
|    2 | d        |
|    2 | e        |
|    2 | f        |
-------------------


I want to print output like this:


1 a b c
2 d e f


GROUP_CONCAT
--------------------------------------------------------------------------------------------------

The GROUP_CONCAT() function in MySQL is used to concatenate data from multiple rows into one field. 
This is an aggregate (GROUP BY) function that returns a String value if the group contains at least one non-NULL value. Otherwise, it returns NULL.

Syntax

SELECT col1, col2, ..., colN
GROUP_CONCAT ( [DISTINCT] col_name1 
[ORDER BY clause]  [SEPARATOR str_val] ) 
FROM table_name GROUP BY col_name2;

Parameters:

col1, col2, …colN: These are the column names of the table.
col_name1: Column of the table whose values are concatenated into a single field for each group.
table_name: Name of table.
col_name2: Column of the table according to which grouping is done.

Use of various clauses inside GROUP_CONCAT() function
Distinct: It eliminates the repetition of values from the result.
Order By: It sorts the values of the group in a specific order and then concatenates them.
Separator: By default, the values of the group are separated by the (, ) operator. 
In order to change this separator value, a Separator clause is used followed by a string literal. It is given as Separator ‘str_value’.


create table group_name(id int,
names varchar(30)
);

insert into group_name values(1,'a'),
(1,'b'),
(1,'c'),
(2,'d'),
(2,'e'),
(2,'f');


select id,GROUP_CONCAT(names SEPARATOR ' ') as names from
group_name group by id




