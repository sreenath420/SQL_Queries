1.The following example finds the employees who have the highest salary:
  select first_name, last_name ,salary from employees where salary =
 (select  max(salary) from employees )


2.The following statement finds all employees who salaries are greater than the average salary of all employees:
  select salary,first_name from employees where salary > (select avg(salary) from employees)

3.The following example finds all departments which have at least one employee with the salary is greater than 10,000:
  select DEPARTMENT_NAME from department where DEPARTMENT_ID 
  in
 (select DEPARTMENT_ID from employees where salary >10000 )
