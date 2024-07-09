CREATE DATABASE college;

USE college;

CREATE TABLE student (
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

-- delete data as well as data 
DROP TABLE student;

-- delete data only
TRUNCATE TABLE student;

INSERT INTO student VALUES
	(101, "Anil", 78, "C", "Pune"),
    (102, "Bhumika", 93, "A", "Mumbai"),
    (103, "Chetan", 85, "B", "Mumbai"),
    (104, "Dhruv", 96, "A", "Delhi"),
    (105, "Emanuel", 12, "F", "Delhi"),
    (106, "Farah", 82, "B", "Delhi");
 
 -- display all columns 
SELECT * FROM student;

-- display specific columns
SELECT name, marks FROM student; 

-- display distinct rows
SELECT DISTINCT city FROM student;


-- WHERE CLAUSE

-- display data based on some conditions
SELECT * FROM student WHERE marks >= 85;

-- students who are from mumbai
SELECT * FROM student WHERE city = "Mumbai";

-- students who are from mumbai and have atleast 85 marks
SELECT * FROM student WHERE city = "Mumbai" AND marks >= 85;

-- studenst who are not from mumbai 
SELECT * FROM student WHERE city != "Mumbai";

-- studenst who are from mumbai and have marks+10 more than 100 
SELECT * FROM student WHERE city = "Mumbai" AND marks+10 > 100;

-- use of AND operator
SELECT * FROM student WHERE marks > 80 AND city = "Mumbai"; 

-- use of OR operator
SELECT * FROM student WHERE marks > 90 OR city = "Mumbai"; 

-- students who have marks between 80 and 90
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;

-- students from grade a or b or q
SELECT * FROM student WHERE grade IN ("A", "B", "Q");

-- students not from grade a or b
SELECT * FROM student WHERE grade NOT IN ("A", "B");


-- LIMIT CLAUSE AND ORDER BY CLAUSE

-- students in ascending order wrt marks 
SELECT * FROM student WHERE city = "Delhi" ORDER BY marks;

-- atmost 2 students from delhi
SELECT * FROM student WHERE city = "Delhi" LIMIT 2;

-- 2 students from delhi which has highest marks
SELECT * FROM student WHERE city = "Delhi" ORDER BY marks DESC LIMIT 2;


-- AGGREGATE FUNCTIONS

-- maximum marks 
SELECT MAX(marks) FROM student; 

-- minimum marks 
SELECT MIN(marks) FROM student; 

-- average marks
SELECT AVG(marks) FROM student; 

-- sum of marks
SELECT SUM(marks) FROM student; 

-- count no of students
SELECT COUNT(rollno) FROM student;


-- GROUP BY CLAUSE 

-- count no of students in each city
SELECT city, COUNT(rollno) FROM student GROUP BY city;

-- count no of students in each grade
SELECT grade, COUNT(rollno) FROM student GROUP BY grade ORDER BY grade; 

-- count no of students in each grade in each city
SELECT city, grade, COUNT(rollno) FROM student GROUP BY city, grade; 

-- average marks of students in each city in ascending order
SELECT city, AVG(marks) FROM student GROUP BY city ORDER BY AVG(marks) DESC;

-- count no of students in each city where max marks cross 90
SELECT city, COUNT(rollno) FROM student GROUP BY city HAVING MAX(marks) > 90;


-- General Order SELECT --> FROM --> WHERE --> GROUP BY --> HAVING --> ORDER BY --> LIMIT
SELECT city, COUNT(rollno) FROM student WHERE grade = "A" GROUP BY city HAVINg MAX(marks) >= 90 ORDER BY city DESC LIMIT 1;


-- off safe mode for updating table
SET SQL_SAFE_UPDATES = 0;

-- on safe mode for updating table
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM student;

-- update grade to "O" for students with grade "A"
UPDATE student SET grade = "O" WHERE grade = "A"; 
UPDATE student SET grade = "A" WHERE grade = "O"; 

-- update marks of student with roll no 105 from 12 to 82
UPDATE student SET marks = 82 WHERE rollno = 105; 
UPDATE student SET marks = 12 WHERE rollno = 105;

-- increment marks of all students by 1
UPDATE student SET marks = marks + 1;

-- decrement marks of all students by 1
UPDATE student SET marks = marks - 1;

-- delete student with marks less than 15
DELETE FROM student WHERE marks < 33;
INSERT INTO student VALUES (105, "Emanuel", 12, "F", "Delhi");