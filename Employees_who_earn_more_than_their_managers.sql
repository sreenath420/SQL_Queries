--------------------------------->Employees who earn more than their managers in sql<--------------------------------------------


use creative

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    manager_id INT
);

INSERT INTO employees (id, name, salary, manager_id) VALUES
(1, 'John Doe', 50000.00, NULL),  
(2, 'Jane Smith', 60000.00, 1),   
(3, 'Emily Davis', 45000.00, 1), 
(4, 'Michael Brown', 55000.00, 2),
(5, 'Sarah Wilson', 70000.00, 2), 
(6, 'Chris Johnson', 30000.00, 3);

select e1.id,e2.salary,e1.manager_id,e1.name 
from employees e1 
join employees e2 
on e1.id=e2.manager_id
where e1.salary>e2.salary

