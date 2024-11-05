CREATE DATABASE productData;
USE productData;

CREATE TABLE `Products`(
	ProductID int PRIMARY KEY, 
    ProductName varchar(200),
    Category varchar(200),
    Price float(10, 2),
    StockQuantity int
);

INSERT INTO `Products` 
VALUES 
    (1, 'áo ngắn tay', 'SpringFashion', 12.4, 20), 
    (2, 'Jacket', 'SpringFashion', 15.4, 20),
     (3, 'Jacket', 'SpringFashion', 15.4, 20);
    


