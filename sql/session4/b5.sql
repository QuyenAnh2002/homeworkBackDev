CREATE TABLE Products (
    productID INT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL
);

CREATE TABLE OrderDetails (
    orderDetailID INT PRIMARY KEY,
    productID INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (productID) REFERENCES Products(productID)
);
-- Thêm sản phẩm vào bảng Products
INSERT INTO Products (productID, productName) VALUES (1, 'Sản phẩm A');
INSERT INTO Products (productID, productName) VALUES (2, 'Sản phẩm B');
INSERT INTO Products (productID, productName) VALUES (3, 'Sản phẩm C');

-- Thêm chi tiết đơn hàng vào bảng OrderDetails
INSERT INTO OrderDetails (orderDetailID, productID, quantity, price) VALUES (1, 1, 10, 250.00);
INSERT INTO OrderDetails (orderDetailID, productID, quantity, price) VALUES (2, 2, 15, 375.00);
INSERT INTO OrderDetails (orderDetailID, productID, quantity, price) VALUES (3, 1, 20, 500.00);
INSERT INTO OrderDetails (orderDetailID, productID, quantity, price) VALUES (4, 3, 25, 625.00);
INSERT INTO OrderDetails (orderDetailID, productID, quantity, price) VALUES (5, 2, 30, 750.00);
SELECT P.productID, P.productName, SUM(D.quantity) AS totalQuantitySold
FROM Products P
JOIN OrderDetails D ON P.productID = D.productID
GROUP BY P.productID, P.productName
ORDER BY totalQuantitySold DESC;
