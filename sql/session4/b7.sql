CREATE TABLE Products (
    productID INT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL
);

CREATE TABLE Regions (
    regionID INT PRIMARY KEY,
    regionName VARCHAR(100) NOT NULL
);

CREATE TABLE Sales (
    saleID INT PRIMARY KEY,
    productID INT NOT NULL,
    regionID INT NOT NULL,
    saleDate DATE NOT NULL,
    quantity INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (productID) REFERENCES Products(productID),
    FOREIGN KEY (regionID) REFERENCES Regions(regionID)
);
-- Thêm dữ liệu vào bảng Products
INSERT INTO Products (productID, productName) VALUES (1, 'Sản phẩm A');
INSERT INTO Products (productID, productName) VALUES (2, 'Sản phẩm B');

-- Thêm dữ liệu vào bảng Regions
INSERT INTO Regions (regionID, regionName) VALUES (1, 'Miền Bắc');
INSERT INTO Regions (regionID, regionName) VALUES (2, 'Miền Nam');

-- Thêm dữ liệu vào bảng Sales
INSERT INTO Sales (saleID, productID, regionID, saleDate, quantity, amount) VALUES (1, 1, 1, '2024-01-01', 10, 250.00);
INSERT INTO Sales (saleID, productID, regionID, saleDate, quantity, amount) VALUES (2, 2, 2, '2024-01-05', 15, 375.00);
SELECT 
    R.regionName,
    SUM(S.amount) AS totalRevenue,
    SUM(S.quantity) AS totalQuantitySold,
    P.productName,
    MAX(S.quantity) AS maxQuantitySold
FROM Sales S
JOIN Products P ON S.productID = P.productID
JOIN Regions R ON S.regionID = R.regionID
GROUP BY R.regionName, P.productName
ORDER BY R.regionName, totalRevenue DESC;
