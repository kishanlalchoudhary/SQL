-- create new database
CREATE DATABASE IF NOT EXISTS temp1;

-- drop any database
DROP DATABASE IF EXISTS temp1;

CREATE DATABASE college;

-- display list of databases
SHOW DATABASES;

-- select any database
USE college;

-- create table
CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

-- insert data into table
INSERT INTO student VALUES (1, 'Kishanlal', 22);
INSERT INTO student (id, name, age) VALUES 
	(2, 'Abhishek', 21),
    (3, 'Sunay', 23);

-- display list of tables
SHOW TABLES;

-- display table 
SELECT * FROM student; 

-- drop table
DROP TABLE student;