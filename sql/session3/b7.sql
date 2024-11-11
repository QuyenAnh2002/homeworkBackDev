CREATE TABLE Customers (
    customerID INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    joinDate DATE
);

CREATE TABLE Orders (
    orderID INT PRIMARY KEY,
    customerID INT NOT NULL,
    orderDate DATETIME,
    totalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);
-- Thêm khách hàng vào bảng Customers
INSERT INTO Customers (customerID, name, email, joinDate) VALUES (1, 'Nguyen Van A', 'a@example.com', '2024-01-15');
INSERT INTO Customers (customerID, name, email, joinDate) VALUES (2, 'Le Thi B', 'b@example.com', '2024-02-20');
INSERT INTO Customers (customerID, name, email, joinDate) VALUES (3, 'Tran Van C', 'c@example.com', '2024-03-25');
INSERT INTO Customers (customerID, name, email, joinDate) VALUES (4, 'Pham Thi D', 'd@example.com', '2024-04-30');

-- Thêm đơn hàng vào bảng Orders
INSERT INTO Orders (orderID, customerID, orderDate, totalAmount) VALUES (1, 1, '2024-05-01 10:00:00', 100.00);
INSERT INTO Orders (orderID, customerID, orderDate, totalAmount) VALUES (2, 2, '2024-06-15 14:30:00', 200.00);
INSERT INTO Orders (orderID, customerID, orderDate, totalAmount) VALUES (3, 3, '2024-07-20 09:15:00', 150.00);
INSERT INTO Orders (orderID, customerID, orderDate, totalAmount) VALUES (4, 1, '2024-08-05 11:45:00', 250.00);
INSERT INTO Orders (orderID, customerID, orderDate, totalAmount) VALUES (5, 2, '2024-09-10 16:00:00', 300.00);
-- Cập nhật tổng số tiền của đơn hàng có OrderID = 3 thành 350.00
UPDATE Orders
SET totalAmount = 350.00
WHERE orderID = 3;

-- Cập nhật địa chỉ email của khách hàng có CustomerID = 2
UPDATE Customers
SET email = 'b_updated@example.com'
WHERE customerID = 2;
-- Xóa khách hàng với CustomerID = 4 khỏi bảng Customers
DELETE FROM Customers
WHERE customerID = 4;

-- Xóa đơn hàng với OrderID = 1 khỏi bảng Orders
DELETE FROM Orders
WHERE orderID = 1;
-- Lấy tất cả thông tin đơn hàng cùng với tên khách hàng
SELECT O.orderID, O.orderDate, O.totalAmount, C.name
FROM Orders O
JOIN Customers C ON O.customerID = C.customerID;

-- Lấy tổng số tiền đơn hàng của từng khách hàng (group by CustomerID)
SELECT C.customerID, C.name, SUM(O.totalAmount) AS TotalSpent
FROM Orders O
JOIN Customers C ON O.customerID = C.customerID
GROUP BY C.customerID, C.name;
