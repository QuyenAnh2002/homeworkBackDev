CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(255),
    Category NVARCHAR(255),
    Price DECIMAL(10, 2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    SaleDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2)
);

CREATE TABLE SalesDetails (
    SaleDetailID INT PRIMARY KEY,
    SaleID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

SELECT 
    MONTH(SaleDate) AS Month,
    SUM(TotalAmount) AS MonthlyRevenue
FROM 
    Sales
WHERE 
    YEAR(SaleDate) = 2023
GROUP BY 
    MONTH(SaleDate)
ORDER BY 
    Month;

DECLARE @GrowthRate DECIMAL(4, 2) = 1.10; -- Tăng trưởng 10%

SELECT 
    MONTH(GETDATE()) AS CurrentMonth,
    SUM(TotalAmount) * @GrowthRate AS ForecastedRevenue
FROM 
    Sales
WHERE 
    YEAR(SaleDate) = 2023
AND 
    MONTH(SaleDate) = MONTH(GETDATE());

DECLARE @GrowthRate DECIMAL(4, 2) = 1.10; -- Tăng trưởng 10%

SELECT 
    MONTH(SaleDate) AS Month,
    SUM(TotalAmount) * @GrowthRate AS ForecastedRevenue
FROM 
    Sales
WHERE 
    YEAR(SaleDate) = 2023
GROUP BY 
    MONTH(SaleDate)
ORDER BY 
    Month;
