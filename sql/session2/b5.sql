CREATE DATABASE qlisp;
USE qlisp;

CREATE TABLE Products(
	ProductID int PRIMARY KEY,
    ProductName nvarchar(100) NOT NULL,
    Category nvarchar(50) NOT NULL,
    Price decimal(10.2) NOT NULL,
    StockQuantity int 
);


CREATE TABLE Orders (
	OrderID int PRIMARY KEY,
    OrderDate date, 
    ProductID int,
    Quantity int NOT NULL,
    TotalAmount decimal(10.2) NOT NULL,
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Products 
VALUE (1, 'áo dài', 'áo', 120000, 200), (2, 'quần thể thao', 'quần', 370000, 150),  (3, 'quần thanh lịch', 'quần', 550000, 30);

INSERT INTO Orders VALUE
(1, '2024-10-29', 2, 1, 1100000),
(2, '2024-10-31', 2, 1, 1100000);


UPDATE Products
SET Price = 200000
WHERE ProductID = 1;

UPDATE Orders o
JOIN Products p ON o.ProductID = p.ProductID
SET o.TotalAmount = o.Quantity * p.Price
WHERE o.OrderID IS NOT NULL; 

UPDATE Products p
JOIN Orders o ON o.ProductID = p.ProductID
SET p.StockQuantity = p.StockQuantity - o.Quantity
WHERE o.OrderID IS NOT NULL;


SELECT * FROM Products;
SELECT * FROM Orders;

