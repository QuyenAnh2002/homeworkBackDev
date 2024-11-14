CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10, 2)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE
);

CREATE TABLE EmployeeDepartments (
    employee_id INT,
    department_id INT,
    PRIMARY KEY (employee_id, department_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);



SELECT e.employee_id, e.name
FROM Employees e
JOIN EmployeeDepartments ed ON e.employee_id = ed.employee_id
JOIN Departments d ON ed.department_id = d.department_id
WHERE d.department_name = 'Kế toán';

SELECT e.employee_id, e.name, e.salary
FROM Employees e
WHERE e.salary > 50000;


SELECT d.department_name, COUNT(ed.employee_id) AS employee_count
FROM Departments d
LEFT JOIN EmployeeDepartments ed ON d.department_id = ed.department_id
GROUP BY d.department_name;


SELECT e.employee_id, e.name, e.salary, d.department_name
FROM Employees e
JOIN EmployeeDepartments ed ON e.employee_id = ed.employee_id
JOIN Departments d ON ed.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM Employees e2
    JOIN EmployeeDepartments ed2 ON e2.employee_id = ed2.employee_id
    JOIN Departments d2 ON ed2.department_id = d2.department_id
    WHERE d2.department_name = d.department_name
);



SELECT d.department_name, SUM(e.salary) AS total_salary
FROM Departments d
JOIN EmployeeDepartments ed ON d.department_id = ed.department_id
JOIN Employees e ON ed.employee_id = e.employee_id
GROUP BY d.department_name
HAVING SUM(e.salary) > 100000;



SELECT e.employee_id, e.name, COUNT(ed.department_id) AS department_count
FROM Employees e
JOIN EmployeeDepartments ed ON e.employee_id = ed.employee_id
GROUP BY e.employee_id
HAVING COUNT(ed.department_id) > 2;
