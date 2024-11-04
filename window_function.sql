---------------------------------------------------------FIRST_VALUE and LAST_VALUE---------------------------------------------------------
I/p-
EmployeelD, StartDate,  EndDate
1	        2023-01-01	2023-06-30
1	        2023-07-01	2023-12-31
2	        2023-04-15	2023-10-15
3	        2023-02-01	null
4	        2023-08-01	2024-01-31

O/p-
EmployeelD, StartDate,  EndDate
1	        2023-01-01	2023-12-31
2		      2023-04-15	2023-10-15
3	        2023-02-01	
4	        2023-08-01	2024-01-31
---------------------Create table---------------------
CREATE TABLE EmployeeRecords(
EmployeelD INT,
StartDate DATE,
EndDate DATE
);
---------------------Insert script---------------------
INSERT INTO EmployeeRecords (EmployeelD,StartDate, EndDate)
VALUES
(1,'2023-01-01','2023-06-30'),
(1,'2023-07-01', '2023-12-31'),
(2, '2023-04-15', '2023-10-15'),
(3, '2023-02-01', NULL),
(4, '2023-08-01', '2024-01-31');
----------------------SELECT-------------------------
select * from EmployeeRecords;
EmployeelD, StartDate,  EndDate
1	        2023-01-01	2023-06-30
1	        2023-07-01	2023-12-31
2	        2023-04-15	2023-10-15
3	        2023-02-01	null
4	        2023-08-01	2024-01-31

-----------------------Solution------------------------
select distinct EmployeelD,
FIRST_VALUE (StartDate)
over( PARTITION BY EmployeelD
ORDER BY EmployeelD)
AS StartDate,
LAST_VALUE (EndDate)
over( PARTITION BY EmployeelD
ORDER BY EmployeelD )
as EndDate 
FROM EmployeeRecords;


-------------------------------------------------------------------->lag and lead<----------------------------------------------------------------------------------
write a sql query to give those students marks whose total marks greater than or equal to prev year marks 

CREATE TABLE student(
    student_name VARCHAR(50),
    marks INT,
    year INT
);

-- Insert some example values into the student table
INSERT INTO student (student_name, marks, year) VALUES ('Rahul', 90, 2010);
INSERT INTO student (student_name, marks, year) VALUES ('Sanjay', 80, 2010);
INSERT INTO student (student_name, marks, year) VALUES ('Mohan', 70, 2010);
INSERT INTO student (student_name, marks, year) VALUES ('Rahul', 90, 2011);
INSERT INTO student (student_name, marks, year) VALUES ('Sanjay', 85, 2011);
INSERT INTO student (student_name, marks, year) VALUES ('Mohan', 65, 2011);
INSERT INTO student (student_name, marks, year) VALUES ('Rahul', 80, 2012);
INSERT INTO student (student_name, marks, year) VALUES ('Sanjay', 80, 2012);
INSERT INTO student (student_name, marks, year) VALUES ('Mohan', 90, 2012);

with cte as(
select *, lag(marks) over (partition by student_name order by year ) 
pre_year_marks
from student)
select * from cte where marks>=pre_year_marks
