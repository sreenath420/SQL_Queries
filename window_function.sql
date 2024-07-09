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

