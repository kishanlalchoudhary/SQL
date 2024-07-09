-- Practice Question 1

CREATE DATABASE xyz;

USE xyz;

CREATE TABLE employee (
	id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT
);

DROP TABLE employee;

INSERT INTO employee VALUES
	(1, 'adam', 25000),
    (2, 'bob', 30000),
    (3, 'casey', 40000);
    
SELECT * FROM employee;