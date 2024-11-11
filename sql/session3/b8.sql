CREATE TABLE Products (
    productID INT PRIMARY KEY,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Invoices (
    invoiceID INT PRIMARY KEY,
    customerName VARCHAR(100) NOT NULL,
    invoiceDate DATE NOT NULL
);

CREATE TABLE InvoiceDetails (
    detailID INT PRIMARY KEY,
    invoiceID INT,
    productID INT,
    quantity INT NOT NULL,
    FOREIGN KEY (invoiceID) REFERENCES Invoices(invoiceID),
    FOREIGN KEY (productID) REFERENCES Products(productID)
);
-- Thêm sản phẩm vào bảng Products
INSERT INTO Products (productID, productName, price) VALUES (1, 'Sản phẩm A', 25.00);
INSERT INTO Products (productID, productName, price) VALUES (2, 'Sản phẩm B', 35.00);
INSERT INTO Products (productID, productName, price) VALUES (3, 'Sản phẩm C', 45.00);

-- Thêm hóa đơn vào bảng Invoices
INSERT INTO Invoices (invoiceID, customerName, invoiceDate) VALUES (1, 'Nguyen Van A', '2024-10-01');
INSERT INTO Invoices (invoiceID, customerName, invoiceDate) VALUES (2, 'Le Thi B', '2024-10-15');

-- Thêm chi tiết hóa đơn vào bảng InvoiceDetails
INSERT INTO InvoiceDetails (detailID, invoiceID, productID, quantity) VALUES (1, 1, 1, 5);
INSERT INTO InvoiceDetails (detailID, invoiceID, productID, quantity) VALUES (2, 1, 2, 3);
INSERT INTO InvoiceDetails (detailID, invoiceID, productID, quantity) VALUES (3, 2, 1, 2);
INSERT INTO InvoiceDetails (detailID, invoiceID, productID, quantity) VALUES (4, 2, 3, 4);
-- Cập nhật giá của sản phẩm có ProductID = 1 thành 55.00
UPDATE Products
SET price = 55.00
WHERE productID = 1;

-- Cập nhật số lượng sản phẩm trong chi tiết hóa đơn có DetailID = 2 thành 10
UPDATE InvoiceDetails
SET quantity = 10
WHERE detailID = 2;
-- Xóa sản phẩm với ProductID = 3 khỏi bảng Products
DELETE FROM Products
WHERE productID = 3;

-- Xóa chi tiết hóa đơn với DetailID = 1 khỏi bảng InvoiceDetails
DELETE FROM InvoiceDetails
WHERE detailID = 1;
-- Lấy tổng giá trị hóa đơn (giá * số lượng) của từng hóa đơn
SELECT I.invoiceID, SUM(P.price * D.quantity) AS totalInvoiceValue
FROM Invoices I
JOIN InvoiceDetails D ON I.invoiceID = D.invoiceID
JOIN Products P ON D.productID = P.productID
GROUP BY I.invoiceID;

-- Lấy danh sách tất cả sản phẩm trong từng hóa đơn cùng với số lượng và giá
SELECT I.invoiceID, P.productName, D.quantity, P.price
FROM Invoices I
JOIN InvoiceDetails D ON I.invoiceID = D.invoiceID
JOIN Products P ON D.productID = P.productID;
