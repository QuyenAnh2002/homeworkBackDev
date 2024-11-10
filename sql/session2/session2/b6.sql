CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(15)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


INSERT INTO Customers (CustomerID, CustomerName, Email, Phone)
VALUES (1, 'Nguyen Van A', 'nguyenvana@example.com', '0912345678'),
       (2, 'Tran Thi B', 'tranthib@example.com', '0987654321');



INSERT INTO Orders (OrderID, OrderDate, CustomerID)
VALUES (1, '2023-11-01', 1),
       (2, '2023-11-02', 1),
       (3, '2023-11-03', 2);


INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
VALUES (1, 1, 101, 2, 150.00),
       (2, 1, 102, 1, 200.00),
       (3, 2, 101, 1, 150.00),
       (4, 3, 103, 3, 120.00),
       (5, 3, 104, 2, 180.00);


UPDATE Customers
SET Phone = '0933333333'
WHERE CustomerID = 1;
DELETE FROM Orders
WHERE CustomerID NOT IN (SELECT CustomerID FROM Customers);


SELECT c.CustomerID, c.CustomerName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100)
);

INSERT INTO Products (ProductID, ProductName)
VALUES (101, 'Sản phẩm A'),
       (102, 'Sản phẩm B'),
       (103, 'Sản phẩm C'),
       (104, 'Sản phẩm D');


SELECT od.OrderID, p.ProductName, od.Quantity, 
       (od.Quantity * od.UnitPrice) AS TotalAmount
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
ORDER BY od.OrderID;
