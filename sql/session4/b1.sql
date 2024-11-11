CREATE TABLE Customers (
    customerID INT PRIMARY KEY,
    customerName VARCHAR(100) NOT NULL,
    contactEmail VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    orderID INT PRIMARY KEY,
    customerID INT NOT NULL,
    orderDate DATE NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);

-- Thêm khách hàng vào bảng Customers
INSERT INTO Customers (customerID, customerName, contactEmail) VALUES (1, 'Nguyen Van A', 'nguyenvana@example.com');
INSERT INTO Customers (customerID, customerName, contactEmail) VALUES (2, 'Le Thi B', 'lethib@example.com');

-- Thêm đơn hàng vào bảng Orders
INSERT INTO Orders (orderID, customerID, orderDate, totalAmount) VALUES (1, 1, '2024-11-10', 150.00);
INSERT INTO Orders (orderID, customerID, orderDate, totalAmount) VALUES (2, 2, '2024-11-11', 250.00);
-- Lấy danh sách đơn hàng cùng với tên và email của khách hàng
SELECT O.orderID, O.orderDate, O.totalAmount, C.customerName, C.contactEmail
FROM Orders O
JOIN Customers C ON O.customerID = C.customerID;
