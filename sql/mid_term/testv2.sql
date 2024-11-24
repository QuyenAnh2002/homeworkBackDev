USE shope; 

ALTER TABLE `products`
ADD FOREIGN KEY (categoryId) REFERENCES categories(categoryId);
ALTER TABLE `products`
ADD FOREIGN KEY (storeId) REFERENCES stores(storeId);


ALTER TABLE `images`
ADD FOREIGN KEY (productId) REFERENCES products(productId);



ALTER TABLE `reviews`
ADD FOREIGN KEY (productId) REFERENCES products(productId);
ALTER TABLE `reviews`
ADD FOREIGN KEY (userId) REFERENCES users(userId);


ALTER TABLE `carts`
ADD FOREIGN KEY (productId) REFERENCES products(productId);
ALTER TABLE `carts`
ADD FOREIGN KEY (userId) REFERENCES users(userId);


ALTER TABLE `stores`
ADD FOREIGN KEY (userId) REFERENCES users(userId);

ALTER TABLE `order_details`
ADD FOREIGN KEY (productId) REFERENCES products(productId);
ALTER TABLE `order_details`
ADD FOREIGN KEY (orderId) REFERENCES orders(orderId);


ALTER TABLE `orders`
ADD FOREIGN KEY (userId) REFERENCES users(userId);
ALTER TABLE `orders`
ADD FOREIGN KEY (storeId) REFERENCES stores(storeId);



SELECT * FROM shope.products

SELECT * FROM orders
WHERE `totalPrice` >= 500000


SELECT `storeName`, `addressStore` FROM stores

SELECT *, email LIKE '@gmail.com' FROM users


SELECT * FROM reviews
WHERE rate = 5

SELECT * FROM products
WHERE quantity < 10

SELECT * FROM products
WHERE `categoryId` = 1;

SELECT COUNT(userId) FROM users;

SELECT SUM(totalPrice) FROM orders;

SELECT MAX(price) FROM products;

SELECT * FROM stores
WHERE statusstore = 1


SELECT COUNT(categoryId) FROM products GROUP BY categoryId


SELECT * FROM products
WHERE `productId` NOT IN (SELECT `productId` FROM reviews)


SELECT `productId` ,SUM(quantityOrder) AS Sum_each_product FROM order_details GROUP BY productId
 

SELECT * FROM users 
WHERE `userId` NOT IN (SELECT `userId` FROM orders)

SELECT COUNT(o.storeId) AS count_order_store, s.`storeName` FROM orders o
JOIN (SELECT storeId, storeName FROM stores) s ON o.`storeId` = s.`storeId`
GROUP BY(o.`storeId`)


SELECT i.*, p.* FROM images i
JOIN (SELECT * FROM products) p ON i.`productId` = p.`productId` 

SELECT * FROM products
WHERE `productId` IN (SELECT `productId` FROM reviews)

SELECT COUNT(r.`userId`), u.`userId` FROM reviews r
JOIN (SELECT * FROM users) u ON u.`userId` = r.`userId`
GROUP BY userId;


SELECT *  FROM products
ORDER BY `quantitySold` DESC
LIMIT 3;


SELECT * FROM products
WHERE (quantity - quantitySold) * price > 1000000 


SELECT SUM(o.totalPrice) AS total_Price, s.`storeName`
FROM `orders` o
JOIN (SELECT storeId, storeName FROM stores) s ON o.`storeId` = s.`storeId`
GROUP BY o.totalPrice, o.`storeId`
ORDER BY total_Price DESC 
LIMIT 1 



SELECT SUM(o.totalPrice) AS total_Price, o.userId, u.userName, u.fullName
FROM `orders` o
JOIN (SELECT userId, userName, fullName FROM users) u ON o.`userId` = u.`userId`
WHERE `statusOrder` = 'success' OR `statusOrder` = 'pending'
GROUP BY `userId`

SELECT d.*, o.*, p.* FROM order_details d
JOIN (SELECT * FROM orders) o ON d.`orderId` = o.`orderId`
JOIN (SELECT * FROM products) p ON d.`productId` = p.`productId`
ORDER BY o.`totalPrice` DESC
LIMIT 1


SELECT AVG(quantityOrder) as TrungBinh FROM order_details


SELECT p.productName, c.`quantityCart` FROM carts c 
JOIN (SELECT productName, productId FROM products )p ON c.`productId` = p. `productId`


SELECT * FROM products
WHERE `quantitySold` - `quantity` = 0

SELECT *, email LIKE '@gmail.com', o.* FROM users u 
JOIN (SELECT * FROM orders) o ON u.userId = o.`userId`

SELECT SUM(p.quantity), p.`storeId`, s.* FROM products p
JOIN (SELECT * FROM stores) s ON p.`storeId` = s.`storeId`
GROUP BY p.`storeId`




-- EX4


CREATE VIEW expensive_products AS
SELECT productName, price
FROM products
WHERE price > 500000;

SELECT * FROM expensive_products;

UPDATE products
SET price = 600000
WHERE productName = 'Product A';

DROP VIEW IF EXISTS expensive_products;

CREATE VIEW product_categories AS
SELECT 
    p.productName,
    c.categoryName
FROM 
    products p
JOIN 
    categories c
ON 
    p.categoryId = c.categoryId;

CREATE INDEX idx_productName ON products(productName);


SHOW INDEX FROM products;

SELECT * 
FROM pg_indexes
WHERE tablename = 'products';


DROP INDEX IF EXISTS idx_productName;




-- ex5

DELIMITER $$

CREATE PROCEDURE getProductByPrice(priceInput DECIMAL)
BEGIN
    SELECT * 
    FROM products
    WHERE price > priceInput;
END $$

DELIMITER ;

CALL getProductByPrice(500000);



DELIMITER $$

CREATE PROCEDURE getOrderDetails(orderId INT)
BEGIN
    SELECT *
    FROM orders
    WHERE orderId = orderId;
END $$

DELIMITER ;


DROP PROCEDURE IF EXISTS getOrderDetails;

DELIMITER $$

CREATE PROCEDURE addNewProduct(
    IN productName VARCHAR(255), 
    IN price DECIMAL, 
    IN description TEXT, 
    IN quantity INT
)
BEGIN
    INSERT INTO products(productName, price, description, quantity)
    VALUES (productName, price, description, quantity);
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE deleteProductById(productId INT)
BEGIN
    DELETE FROM products
    WHERE productId = productId;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE searchProductByName(productNamePattern VARCHAR(255))
BEGIN
    SELECT *
    FROM products
    WHERE productName LIKE CONCAT('%', productNamePattern, '%');
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE filterProductsByPriceRange(minPrice DECIMAL, maxPrice DECIMAL)
BEGIN
    SELECT *
    FROM products
    WHERE price BETWEEN minPrice AND maxPrice;
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE paginateProducts(pageNumber INT, pageSize INT)
BEGIN
    SET @offset = (pageNumber - 1) * pageSize;
    SET @limit = pageSize;

    PREPARE stmt FROM 'SELECT * FROM products LIMIT ? OFFSET ?';
    EXECUTE stmt USING @limit, @offset;
    DEALLOCATE PREPARE stmt;
END $$

DELIMITER ;
