CREATE TABLE Orders (
    orderID INT PRIMARY KEY,
    customerID INT NOT NULL,
    orderTime DATE NOT NULL,
    totalAmount DECIMAL(10,2) NOT NULL
);

CREATE TABLE Customers (
    customerID INT PRIMARY KEY,
    customerName VARCHAR(100) NOT NULL,
    contactEmail VARCHAR(100) NOT NULL
);

CREATE TABLE Products (
    productID INT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE OrderDetails (
    orderDetailID INT PRIMARY KEY,
    orderID INT NOT NULL,
    productID INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES Orders(orderID),
    FOREIGN KEY (productID) REFERENCES Products(productID)
);
-- Thêm dữ liệu vào bảng Orders
INSERT INTO Orders (orderID, customerID, orderTime, totalAmount) VALUES (1, 1, '2024-01-15', 150.00);
INSERT INTO Orders (orderID, customerID, orderTime, totalAmount) VALUES (2, 2, '2024-01-20', 200.00);
INSERT INTO Orders (orderID, customerID, orderTime, totalAmount) VALUES (3, 1, '2024-02-05', 300.00);
INSERT INTO Orders (orderID, customerID, orderTime, totalAmount) VALUES (4, 3, '2024-02-18', 250.00);
INSERT INTO Orders (orderID, customerID, orderTime, totalAmount) VALUES (5, 2, '2024-03-22', 100.00);

-- Thêm dữ liệu vào bảng Customers
INSERT INTO Customers (customerID, customerName, contactEmail) VALUES (1, 'Nguyen Van A', 'a@example.com');
INSERT INTO Customers (customerID, customerName, contactEmail) VALUES (2, 'Le Thi B', 'b@example.com');
INSERT INTO Customers (customerID, customerName, contactEmail) VALUES (3, 'Tran Van C', 'c@example.com');

-- Thêm dữ liệu vào bảng Products
INSERT INTO Products (productID, productName, price) VALUES (1, 'Sản phẩm A', 25.00);
INSERT INTO Products (productID, productName, price) VALUES (2, 'Sản phẩm B', 35.00);
INSERT INTO Products (productID, productName, price) VALUES (3, 'Sản phẩm C', 45.00);

-- Thêm dữ liệu vào bảng OrderDetails
INSERT INTO OrderDetails (orderDetailID, orderID, productID, quantity, price) VALUES (1, 1, 1, 2, 50.00);
INSERT INTO OrderDetails (orderDetailID, orderID, productID, quantity, price) VALUES (2, 1, 2, 3, 105.00);
INSERT INTO OrderDetails (orderDetailID, orderID, productID, quantity, price) VALUES (3, 2, 3, 1, 35.00);
INSERT INTO OrderDetails (orderDetailID, orderID, productID, quantity, price) VALUES (4, 3, 1, 4, 100.00);
INSERT INTO OrderDetails (orderDetailID, orderID, productID, quantity, price) VALUES (5, 4, 2, 2, 70.00);
-- Báo cáo tổng doanh thu và số lượng đơn hàng hàng tháng
SELECT 
    DATE_FORMAT(orderTime, '%Y-%m') AS month,
    COUNT(orderID) AS numberOfOrders,
    SUM(totalAmount) AS totalRevenue,
    AVG(totalAmount) AS averageRevenue
FROM Orders
GROUP BY month
ORDER BY month;

-- Báo cáo tỷ lệ giữ chân khách hàng hàng tháng
WITH CustomerMonthly AS (
    SELECT 
        customerID,
        DATE_FORMAT(orderTime, '%Y-%m') AS month,
        COUNT(orderID) AS numberOfOrders
    FROM Orders
    GROUP BY customerID, month
)
SELECT 
    month,
    COUNT(DISTINCT customerID) AS totalCustomers,
    COUNT(DISTINCT CASE WHEN numberOfOrders > 1 THEN customerID END) AS retainedCustomers,
    COUNT(DISTINCT CASE WHEN numberOfOrders > 1 THEN customerID END) / COUNT(DISTINCT customerID) * 100 AS retentionRate
FROM CustomerMonthly
GROUP BY month
ORDER BY month;
