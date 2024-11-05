CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,                  
    OrderDate DATETIME NOT NULL,           
    CustomerID INT,                   
    TotalAmount DECIMAL(10, 2) NOT NULL,   
    CONSTRAINT fk_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT chk_TotalAmount CHECK (TotalAmount >= 0)
);
