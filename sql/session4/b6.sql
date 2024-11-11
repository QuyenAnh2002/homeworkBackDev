CREATE TABLE Sales (
    saleID INT PRIMARY KEY,
    saleDate DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
INSERT INTO Sales (saleID, saleDate, price) VALUES (1, '2024-01-15', 150.00);
INSERT INTO Sales (saleID, saleDate, price) VALUES (2, '2024-01-20', 200.00);
INSERT INTO Sales (saleID, saleDate, price) VALUES (3, '2024-02-05', 300.00);
INSERT INTO Sales (saleID, saleDate, price) VALUES (4, '2024-02-18', 250.00);
INSERT INTO Sales (saleID, saleDate, price) VALUES (5, '2024-03-22', 100.00);
SELECT 
    DATE_FORMAT(saleDate, '%Y-%m') AS month,
    SUM(price) AS totalRevenue,
    COUNT(saleID) AS numberOfOrders,
    AVG(price) AS averageRevenuePerOrder
FROM Sales
GROUP BY month
ORDER BY month;
