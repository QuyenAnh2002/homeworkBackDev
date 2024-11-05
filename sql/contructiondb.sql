CREATE DATABASE contructiondb;
USE contructiondb;

CREATE TABLE hostad(
	id int PRIMARY KEY,
    `name` varchar(45),
    `address` varchar(45)
);

CREATE TABLE contractor(
	id int PRIMARY KEY,
    `name` varchar(45),
    `address` varchar(255),
    contractor varchar(45)
);


CREATE TABLE building(
	id int PRIMARY KEY,
    `name` varchar(45),
    `address` varchar(45),
    `city` varchar(45),
	cost float(10, 2),
    `start` DATE,
    hostID int, FOREIGN KEY (id) REFERENCES hostad(id),
    contractor_id int, FOREIGN KEY (id) REFERENCES contractor(id)
    
 );
 
 CREATE TABLE contructiondb.architect(
	id int PRIMARY KEY,
    `name` varchar(255),
    `sex` tinyint(1),
    birthday date,
    place varchar(255),
    address varchar(255)
 );
 
 
 CREATE TABLE design(
	building_id int, FOREIGN KEY (id) REFERENCES building(id),
    architect_id int, FOREIGN KEY (id) REFERENCES architect(id),
    benefit varchar(45)
 );
 CREATE TABLE worker(
	id int,
    `name` varchar(45),
    birthday varchar(45),
    `year` varchar(45),
    skill varchar(45)
 );
 
 CREATE TABLE workk(
	building_id int, FOREIGN KEY (id) REFERENCES building(id),
    worker_id int, FOREIGN KEY (id) REFERENCES worker(id),
    `date` date,
    total varchar(45)
);
 