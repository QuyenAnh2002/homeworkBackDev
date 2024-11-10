CREATE DATABASE QLiNV;
USE QLiNV;


CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,            
    DepartmentName VARCHAR(100) NOT NULL    
);


CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,             
    EmployeeName VARCHAR(100) NOT NULL,    
    Position VARCHAR(50),                 
    Salary FLOAT(10, 2),                  
    DepartmentID INT,     
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Department (DepartmentID, DepartmentName)
VALUES (1, 'Sales'), (2, 'Marketing'), (3, 'IT'), (4, 'HR');

SELECT * FROM QLiNV.Employee;

INSERT INTO Employee (EmployeeID, EmployeeName, Position, Salary, DepartmentID)
VALUES 
    (101, 'Nguyen Van A', 'Sales', 30000, 1),
    (102, 'Tran Thi B', 'Marketingt', 40000, 2),
    (103, 'Le Van C', 'IT', 50000, 3),
    (104, 'Pham Thi D', 'HR', 45000, 4),
    (105, 'Nguyen Van E', 'Sales', 30000, 1);

SELECT e.*
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales';




UPDATE Employee
SET Salary = 35000
WHERE EmployeeID = 101;

DELETE FROM Employee
WHERE Salary < 35000;

