create table employees(
id int,
name varchar(30),
salary int
);

INSERT INTO employees
VALUES 
  (1, "Adam", 35000),
  (2, "Sarah", 4020),
  (3, "John", 29993),
  (4, "Thomas", 40003),
  (5, "Anna", 6000),
  (6, "Kim", 6000)
  

with t as
(select *,dense_rank() over(order by salary desc) as rnk from employees)
select name,salary from t where rnk=2