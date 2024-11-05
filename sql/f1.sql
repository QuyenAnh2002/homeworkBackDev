-- CREATE SCHEMA `new_schema`;
-- create database `new_database`;
-- 


CREATE TABLE new_schema.information_student (
	`id` int,
    `fullname` varchar(200),
    `age` varchar(200),
    `gender` varchar(200),
    `address` varchar(200)
);

ALTER TABLE new_schema.information_student
MODIFY COLUMN address varchar(55);
-- DROP new_column;
-- ADD new_column varchar(250);

DROP TABLE new_schema.information_student;