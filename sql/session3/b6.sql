CREATE TABLE Suppliers (
    supplierID INT PRIMARY KEY,
    supplierName VARCHAR(100) NOT NULL,
    contactEmail VARCHAR(100)
);

CREATE TABLE Products (
    productID INT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    supplierID INT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (supplierID) REFERENCES Suppliers(supplierID)
);
-- Thêm nhà cung cấp vào bảng Suppliers
INSERT INTO Suppliers (supplierID, supplierName, contactEmail) VALUES (1, 'Nhà cung cấp A', 'contacta@example.com');
INSERT INTO Suppliers (supplierID, supplierName, contactEmail) VALUES (2, 'Nhà cung cấp B', 'contactb@example.com');
INSERT INTO Suppliers (supplierID, supplierName, contactEmail) VALUES (3, 'Nhà cung cấp C', 'contactc@example.com');

-- Thêm sản phẩm vào bảng Products
INSERT INTO Products (productID, productName, supplierID, price, stock) VALUES (1, 'Sản phẩm 1', 1, 19.99, 100);
INSERT INTO Products (productID, productName, supplierID, price, stock) VALUES (2, 'Sản phẩm 2', 2, 29.99, 200);
INSERT INTO Products (productID, productName, supplierID, price, stock) VALUES (3, 'Sản phẩm 3', 3, 39.99, 150);
INSERT INTO Products (productID, productName, supplierID, price, stock) VALUES (4, 'Sản phẩm 4', 1, 49.99, 50);
-- Cập nhật giá của sản phẩm có ProductID = 2 thành 45.99
UPDATE Products
SET price = 45.99
WHERE productID = 2;

-- Cập nhật tên nhà cung cấp có supplierID = 1
UPDATE Suppliers
SET supplierName = 'Nhà cung cấp A Mới'
WHERE supplierID = 1;
-- Xóa nhà cung cấp với supplierID = 3 khỏi bảng Suppliers
DELETE FROM Suppliers
WHERE supplierID = 3;

-- Xóa sản phẩm với productID = 4 khỏi bảng Products
DELETE FROM Products
WHERE productID = 4;
-- Lấy thông tin tất cả sản phẩm cùng với tên nhà cung cấp từ bảng Products và Suppliers
SELECT P.productID, P.productName, S.supplierName, P.price, P.stock
FROM Products P
JOIN Suppliers S ON P.supplierID = S.supplierID;
