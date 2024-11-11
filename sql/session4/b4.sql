CREATE TABLE Products (
    productID INT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
INSERT INTO Products (productID, productName, price) VALUES (1, 'Sản phẩm A', 25.00);
INSERT INTO Products (productID, productName, price) VALUES (2, 'Sản phẩm B', 35.00);
INSERT INTO Products (productID, productName, price) VALUES (3, 'Sản phẩm C', 45.00);
INSERT INTO Products (productID, productName, price) VALUES (4, 'Sản phẩm D', 15.00);
INSERT INTO Products (productID, productName, price) VALUES (5, 'Sản phẩm E', 55.00);
-- Sản phẩm có giá cao nhất
SELECT productID, productName, price
FROM Products
WHERE price = (SELECT MAX(price) FROM Products);

-- Sản phẩm có giá thấp nhất
SELECT productID, productName, price
FROM Products
WHERE price = (SELECT MIN(price) FROM Products);
