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
    p.Category,
    SUM(sd.Quantity * sd.UnitPrice) AS TotalRevenue
FROM 
    Sales s
JOIN 
    SalesDetails sd ON s.SaleID = sd.SaleID
JOIN 
    Products p ON sd.ProductID = p.ProductID
WHERE 
    s.SaleDate BETWEEN '2023-07-01' AND '2023-09-30'
GROUP BY 
    p.Category
ORDER BY 
    TotalRevenue DESC;


WITH CategoryRevenue AS (
    SELECT 
        p.Category,
        SUM(sd.Quantity * sd.UnitPrice) AS TotalRevenue
    FROM 
        Sales s
    JOIN 
        SalesDetails sd ON s.SaleID = sd.SaleID
    JOIN 
        Products p ON sd.ProductID = p.ProductID
    WHERE 
        s.SaleDate BETWEEN '2023-07-01' AND '2023-09-30'
    GROUP BY 
        p.Category
)
SELECT TOP 1 
    Category,
    TotalRevenue
FROM 
    CategoryRevenue
ORDER BY 
    TotalRevenue DESC;
