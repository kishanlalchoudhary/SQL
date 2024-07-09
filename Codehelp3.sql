SHOW DATABASES;
USE temp;
SHOW TABLES;

CREATE TABLE Employee (
	emp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(255),
    lname VARCHAR(255),
    age INT,
    email_id VARCHAR(255),
    phone_no INT,
    city VARCHAR(255)
);

SELECT * FROM Employee;

CREATE TABLE Client_Table (
	client_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fname VARCHAR(255),
    lname VARCHAR(255),
    age INT,
    email_id VARCHAR(255),
    phone_no INT,
    city VARCHAR(255),
    emp_id INT NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

SELECT * FROM Client_Table;

CREATE TABLE Project (
	p_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    proj_name VARCHAR(255),
    startdate DATE,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client_Table(client_id),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

SELECT * FROM Project;

INSERT INTO Employee VALUES 
	(1, 'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'Delhi'),
    (2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', 222, 'Palam'),
    (3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 444, 'Kolkata'),
    (4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'Raipur'),
    (5, 'PK', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');
    
INSERT INTO Client_Table VALUES
	(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', 333, 'Kolkata', 3),
    (2, 'Max', 'Poirier', 27, 'max@gmail.com', 222, 'Kolkata', 3),
    (3, 'Peter', 'Jain', 24, 'peter@abc.com', 111, 'Delhi', 1),
    (4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', 45454, 'Hyderabad', 5),
    (5, 'Pratap', 'Singh', 36, 'p@xyz.com', 77767, 'Mumbai', 2);
    
INSERT INTO Project VALUES
	(1, 1, 'A', '2021-04-21', 3),
    (2, 2, 'B', '2021-03-12', 1),
    (3, 3, 'C', '2021-01-16', 5),
    (4, 3, 'D', '2021-04-27', 2),
    (5, 5, 'E', '2021-05-21', 4);
    
----------------------------- Joins -------------------------------------
    
-- INNER JOIN
-- Enlist all the employees ID's, names along with the Project allocated to them
SELECT e.emp_id, e.fname, e.lname, p.p_id, p.proj_name FROM Employee as e 
INNER JOIN Project as p ON e.emp_id = p.emp_id;

-- Fetch out all the employee ID's and their contact detail who have been working
-- From Jaipur with the clients name working in Hyderabad.
SELECT e.emp_id, e.email_id, e.phone_no, c.fname, c.lname 
FROM Employee as e INNER JOIN Client_Table as c
ON e.emp_id = c.emp_id
WHERE c.city = 'Hyderabad' AND e.city = 'Jaipur';

-- LEFT JOIN
-- Fetch out each project allocated to each employee.
SELECT e.*, p.* 
FROM Employee as e LEFT JOIN Project as p 
ON e.emp_id = p.emp_id;

-- RIGHT JOIN 
-- List out all the projects along with the employee's name and their respective allocated email ID.
SELECT p.p_id, p.proj_name, e.fname, e.lname, e.email_id
FROM Employee as e RIGHT JOIN Project as p
ON e.emp_id = p.emp_id;

-- CROSS JOIN
-- List out all the combinations possible for the employee's name and projects that can exist.
SELECT e.emp_id, e.fname, e.lname, p.proj_name 
FROM Employee as e CROSS JOIN Project as p;

-- Using INNER JOIN without using JOIN Keyword
SELECT e.emp_id, e.fname, e.lname, c.client_id, c.fname, c.lname
FROM Employee as e, Client_Table as c 
WHERE e.emp_id = c.emp_id;

----------------------------- SubQueries -------------------------------------

-- Where Clause Same Table
SELECT * FROM Employee WHERE age IN (SELECT age FROM Employee WHERE age > 30);

-- Where Clause with Different Table
-- emp details working in more than 1 project
SELECT * FROM Employee WHERE emp_id IN (SELECT emp_id FROM Project GROUP BY emp_id HAVING count(emp_id) > 1); 

-- Single Value Subquery
-- emp details having age greater than avg (age)
SELECT * FROM Employee WHERE age > (SELECT avg(age) FROM Employee);

-- FROM CLAUSE
-- select max age person whose first name contains 'a'
SELECT max(age) FROM (SELECT * FROM Employee WHERE fname LIKE '%a%') AS Temp; 
-- Subqueries are nothing but the derived tables

-- Corelated subquery
SELECT * FROM Employee e1 WHERE 3 = (SELECT count(e2.age) FROM Employee e2 WHERE e2.age >= e1.age);

-------------------------- VIEWS ----------------------------

SELECT * FROM Employee;

-- Creating a view
CREATE VIEW Custom_view AS SELECT fname, age FROM Employee;

-- VIEWING FROM VIEW
SELECT * FROM Custom_view;

-- ALTERING THE VIEW
ALTER VIEW Custom_view AS SELECT fname, lname, age FROM Employee;

-- DROPING THE VIEW
DROP VIEW IF EXISTS Custom_view;