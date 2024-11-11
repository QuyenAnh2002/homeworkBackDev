CREATE TABLE EmployeeSalaries (
    employeeID INT PRIMARY KEY,
    departmentID INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);
INSERT INTO EmployeeSalaries (employeeID, departmentID, salary) VALUES (1, 101, 5000.00);
INSERT INTO EmployeeSalaries (employeeID, departmentID, salary) VALUES (2, 101, 6000.00);
INSERT INTO EmployeeSalaries (employeeID, departmentID, salary) VALUES (3, 102, 7000.00);
INSERT INTO EmployeeSalaries (employeeID, departmentID, salary) VALUES (4, 102, 8000.00);
INSERT INTO EmployeeSalaries (employeeID, departmentID, salary) VALUES (5, 103, 9000.00);
SELECT departmentID, SUM(salary) AS totalSalary, AVG(salary) AS averageSalary
FROM EmployeeSalaries
GROUP BY departmentID;
