CREATE DATABASE ECommerceDB;
use ECommerceDB;
CREATE TABLE users(
	`id` int PRIMARY KEY AUTO_INCREMENT, 
    `username` varchar(50) UNIQUE NOT NULL,
    `passwordHasd` varchar(255) NOT NULL,
    `email` varchar(100) UNIQUE NOT NULL
    
);

CREATE TABLE product(
	`id` int PRIMARY KEY AUTO_INCREMENT,
    `productName` varchar(100) NOT NULL,
    `description` text,
    `price` decimal(10, 2) NOT NULL,
    `stock` int NOT NULL
);

CREATE TABLE cart(
	`id` int PRIMARY KEY AUTO_INCREMENT,
    `userID` int, FOREIGN KEY (id) REFERENCES users(id),
    `total` int NOT NULL
  	
);

CREATE TABLE cartItems(
	`id` int PRIMARY KEY AUTO_INCREMENT,
    `cartID` int, FOREIGN KEY (id) REFERENCES product(id),
    `productID` int, FOREIGN KEY (id) REFERENCES product(id),
    `quantity` int NOT NULL
);

