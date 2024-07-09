USE college;

CREATE TABLE city (
	id INT PRIMARY KEY,
    name VARCHAR(20)
);

DROP TABLE city;

INSERT INTO city VALUES
	(1, 'PUNE'),
    (2, 'MUMBAI');

CREATE TABLE student (
	id INT,
    name VARCHAR(50),
    age INT DEFAULT 21,
    city_id INT,
	PRIMARY KEY (id, name),
    FOREIGN KEY (city_id) REFERENCES city (id)
);

DROP TABLE student;

INSERT INTO student (id, name, city_id) VALUES
	(1, 'A', 1),
    (1, 'B', 2),
    (2, 'B', 1),
    (3, 'C', 2);
    
SELECT * FROM student;

CREATE TABLE teacher (
	id INT PRIMARY KEY,
    age INT,
    salary INT CHECK (salary >= 0), 
    course VARCHAR(50) UNIQUE,
    CONSTRAINT age_check CHECK (age >= 18)
);

DROP TABLE teacher;

INSERT INTO teacher VALUES (1, 22, 25000, 'ENGLISH');

-- unique course constraint violation
INSERT INTO teacher VALUES (2, 20, 10000, 'ENGLISH');

-- age_check constraint violation 
INSERT INTO teacher VALUES (3, 5, 20000, 'HINDI');

-- salary constraint violation 
INSERT INTO teacher VALUES (4, 21, -23, 'MATH');