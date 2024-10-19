--------------------------------->Employemees who earn more than their managers in sql<--------------------------------------------


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

--------------------------------->2<-------------------------------------------------------
employee reporting manager in sql query

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID INT
);


INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES (1, 'Alice', NULL); -- Alice is the CEO with no manager
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES (2, 'Bob', 1); -- Bob reports to Alice
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES (3, 'Charlie', 1); -- Charlie reports to Alice
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES (4, 'David', 2); -- David reports to Bob
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES (5, 'Eva', 2); -- Eva reports to Bob
INSERT INTO Employees (EmployeeID, EmployeeName, ManagerID) VALUES (6, 'Frank', 3); -- Frank reports to Charlie




select e.employeeid,e.EmployeeName,m.EmployeeName
from employees e 
left join Employees m on e.ManagerID=m.EmployeeID


output:-


EmployeeID	EmployeeName	ManagerName
1	Alice	NULL
2	Bob	Alice
3	Charlie	Alice
4	David	Bob
5	Eva	Bob
6	Frank	Charlie

