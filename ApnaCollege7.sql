CREATE DATABASE college;

USE college;

CREATE TABLE student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

DROP TABLE student;

TRUNCATE TABLE student;

INSERT INTO student VALUES
	(101, "Anil", 78, "C", "Pune"),
    (102, "Bhumika", 93, "A", "Mumbai"),
    (103, "Chetan", 85, "B", "Mumbai"),
    (104, "Dhruv", 96, "A", "Delhi"),
    (105, "Emanuel", 12, "F", "Delhi"),
    (106, "Farah", 82, "B", "Delhi");

-- Sub Queries - Nested Queries

-- get names of all students who scored more than class average - Example with WHERE
-- sub query
SELECT AVG(marks) FROM student;
-- main query
SELECT name FROM student WHERE marks > (SELECT AVG(marks) FROM student);

-- find the names of all students with even roll numbers - Example with WHERE
-- sub query
SELECT rollno FROM student WHERE rollno%2 = 0;
-- main query
SELECT name FROM student WHERE rollno IN (SELECT rollno FROM student WHERE rollno%2 = 0);

-- find the maximum marks from the students of Delhi - Example with FROM
-- sub query
SELECT * FROM student WHERE city = "Delhi";
-- main query
SELECT MAX(marks) FROM (SELECT * FROM student WHERE city = "Delhi") AS delhi_student;

-- Example with SELECT
SELECT name, city, (SELECT MAX(marks) FROM student as t2 WHERE t2.city = t1.city) as max_marks FROM student as t1;


-- VIEWS
CREATE VIEW teacher_view AS SELECT rollno, name, marks FROM student;
SELECT * FROM teacher_view;
DROP VIEW teacher_view;