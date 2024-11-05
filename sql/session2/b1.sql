CREATE DATABASE CompanyDB;
USE CompanyDB;
CREATE TABLE Employees(
	`EmployeeID` INT,
    `FirstName` VARCHAR(50),
    `LastName` VARCHAR(50),
    HireDate DATE,
    Salary INT
    
    
);

ALTER TABLE Employees
ADD Department varchar(250);


ALTER TABLE Employees
MODIFY COLUMN Salary decimal(10, 2);
