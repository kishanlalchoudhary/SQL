SHOW DATABASES;
USE temp;
SHOW TABLES;

CREATE TABLE Dept1 (
	emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(255),
    emp_role VARCHAR(255)
);

CREATE TABLE Dept2 (
	emp_id INT NOT NULL PRIMARY KEY,
    emp_name VARCHAR(255),
    emp_role VARCHAR(255)
);

INSERT INTO Dept1 VALUES
	(1, 'A', 'engineer'),
    (2, 'B', 'salesman'),
    (3, 'C', 'manager'),
    (4, 'D', 'salesman'),
    (5, 'E', 'engineer');
    
INSERT INTO Dept2 VALUES
    (3, 'C', 'manager'),
    (6, 'F', 'marketing'),
    (7, 'G', 'salesman');
    
SELECT * FROM Dept1;

SELECT * FROM Dept2;

----------------------------- Set Operations -------------------------------------
    
-- List out all  the employess in the company
SELECT * FROM Dept1
UNION 
SELECT * FROM Dept2;

-- List out all the employees in all departments who work as salesman
SELECT * FROM Dept1 WHERE emp_role = 'salesman'
UNION 
SELECT * FROM Dept2 WHERE emp_role = 'salesman';

-- List out all the employees who work in all the departments.
SELECT Dept1.* FROM Dept1 INNER JOIN Dept2 ON Dept1.emp_id = Dept2.emp_id;
SELECT Dept1.* FROM Dept1 INNER JOIN Dept2 using(emp_id);
SELECT * FROM Dept1 INNER JOIN Dept2 using(emp_id);

-- List out all the employees working in dept1 but not in dept2.
SELECT d1.* FROM Dept1 as d1 LEFT JOIN Dept2 as d2 using(emp_id) WHERE d2.emp_id IS NULL;