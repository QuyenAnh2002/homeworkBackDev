CREATE TABLE Sales (
    saleID INT PRIMARY KEY,
    productID INT NOT NULL,
    saleDate DATE NOT NULL,
    quantity INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);
INSERT INTO Sales (saleID, productID, saleDate, quantity, amount) VALUES (1, 101, '2024-01-01', 10, 250.00);
INSERT INTO Sales (saleID, productID, saleDate, quantity, amount) VALUES (2, 102, '2024-01-02', 15, 375.00);
INSERT INTO Sales (saleID, productID, saleDate, quantity, amount) VALUES (3, 101, '2024-01-03', 20, 500.00);
INSERT INTO Sales (saleID, productID, saleDate, quantity, amount) VALUES (4, 103, '2024-01-04', 25, 625.00);
INSERT INTO Sales (saleID, productID, saleDate, quantity, amount) VALUES (5, 102, '2024-01-05', 30, 750.00);
SELECT productID, COUNT(saleID) AS numberOfOrders
FROM Sales
GROUP BY productID;
