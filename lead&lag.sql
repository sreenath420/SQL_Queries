----------------------------------------------->lead and lag in sql<------------------------------------------
Syntax:-
lead(column_name,offset,default_value) over(order by col1,col2)
lag(column_name,offset,default_value) over(order by col1,col2)

CREATE TABLE emp(
    id int,
    name varchar(30),
    gender varchar(8),
    salary INT
);

Insert Into emp Values (1, 'Mark', 'Male', 1000);
Insert Into emp Values (2, 'John', 'Male', 2000);
Insert Into emp Values (3, 'Pam', 'Female', 3000);
Insert Into emp Values (4, 'Sara', 'Female', 4000);
Insert Into emp Values (5, 'Todd', 'Male', 5000);
Insert Into emp Values (6, 'Mary', 'Female', 6000);
Insert Into emp Values (7, 'Ben', 'Male', 7000);
Insert Into emp Values (8, 'Jodi', 'Female', 8000);
Insert Into emp Values (9, 'Tom', 'Male', 9000);
Insert Into emp Values (10, 'Ron', 'Male', 9500);


select *,lag(salary) over(order by salary) 
from emp
output
id   name   gender salary   la
1	Mark	Male	1000	Null
2	John	Male	2000	1000
3	Pam	    Female	3000	2000
4	Sara    Female	4000	3000
5	Todd	Male	5000	4000
6	Mary	Female	6000	5000
7	Ben	    Male	7000	6000
8	Jodi	Female	8000	7000
9	Tom	    Male	9000	8000
10	Ron	    Male	9500	9000


select *,lead(salary) over(order by salary) as led
from emp

output

	id	name	gender	salary	led
	1	Mark	Male	1000	2000
	2	John	Male	2000	3000
	3	Pam	    Female	3000	4000
	4	Sara	Female	4000	5000
	5	Todd	Male	5000	6000
	6	Mary	Female	6000	7000
	7	Ben	    Male	7000	8000
	8	Jodi	Female	8000	9000
	9	Tom	    Male	9000	9500
	10	Ron	    Male	9500	Null
	
	

1.show the sales difference compared to the previous day for each product.
queries:-

CREATE TABLE sales (
    date DATE,
    product_id INT,
    sales_amount DECIMAL(10, 2)
)

INSERT INTO sales (date, product_id, sales_amount) VALUES 
    ('2024-01-01', 1, 100),
    ('2024-01-02', 1, 120),
    ('2024-01-03', 1, 150),
    ('2024-01-04', 1, 130);
	
query:-
select *,lag(sales_amount,1,0) over(partition by product_id order by date) as sale,
sales_amount -lag(sales_amount,1,0) over(partition by product_id order by date) as 
sales_diff
from sales
	
output
date			product_id			sales_amount	sale	sales_diff
2024-01-01			1				100.00			0.00	100.00
2024-01-02			1				120.00			100.00	20.00
2024-01-03			1				150.00			120.00	30.00
2024-01-04			1				130.00			150.00	-20.00


CREATE TABLE employee_salaries (
    emp_id INT,
    salary_date DATE,
    salary DECIMAL(10, 2)
);


INSERT INTO employee_salaries (emp_id, salary_date, salary) VALUES 
    (101, '2023-01-01', 5000),
    (101, '2023-07-01', 5500),
    (102, '2023-01-01', 5200),
    (102, '2023-07-01', 5700);
	
	
	
