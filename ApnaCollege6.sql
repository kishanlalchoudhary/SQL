CREATE DATABASE school;

USE school; 

CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

DROP TABLE student;

CREATE TABLE course (
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

DROP TABLE course;

INSERT INTO student VALUES
	(101, "Adam"),
    (102, "Bob"),
    (103, "Casey");
    
INSERT INTO course VALUES
	(102, "English"),
    (105, "Math"),
    (103, "Science"),
	(107, "Hindi");

-- JOINS

-- INNER JOIN
SELECT * FROM student INNER JOIN course ON student.id = course.id;

-- LEFT JOIN
SELECT * FROM student LEFT JOIN course ON student.id = course.id;

-- RIGHT JOIN
SELECT * FROM student RIGHT JOIN course ON student.id = course.id;

-- FULL JOIN

-- UNION - distinct rows
SELECT * FROM student LEFT JOIN course ON student.id = course.id
UNION
SELECT * FROM student RIGHT JOIN course ON student.id = course.id;

-- UNION ALL - all rows
SELECT * FROM student LEFT JOIN course ON student.id = course.id
UNION ALL
SELECT * FROM student RIGHT JOIN course ON student.id = course.id;

-- LEFT EXCLUSIVE
SELECT * FROM student LEFT JOIN course ON student.id = course.id WHERE course.id IS NULL;

-- RIGHT EXCLUSIVE
SELECT * FROM student RIGHT JOIN course ON student.id = course.id WHERE student.id IS NULL;

CREATE TABLE employee (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id int
);

DROP TABLE employee;

INSERT INTO employee VALUES 
	(101, "Adam", 103),
    (102, "Bob", 104),
    (103, "Casey", NULL),
    (104, "Donald", 103);

-- SELF JOIN    
SELECT table1.name as manager, table2.name FROM employee as table1 INNER JOIN employee as table2 ON table1.id = table2.manager_id;