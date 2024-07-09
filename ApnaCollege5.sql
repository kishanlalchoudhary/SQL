USE college;

SHOW TABLES;

CREATE TABLE department (
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

DROP TABLE department;

CREATE TABLE teacher (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

DROP TABLE teacher;

INSERT INTO department VALUES
	(1, "COMP"),
    (2, "ENTC");
    
SELECT * FROM department;

INSERT INTO teacher VALUES (1, "Adam", 1);
INSERT INTO teacher VALUES (2, "Eve", 2);
    
SELECT * FROM teacher;

-- on update cascade
UPDATE department SET id = 3 WHERE id = 2;
UPDATE department SET id = 2 WHERE id = 3;

-- on delete cascade
DELETE FROM department WHERE name = "COMP";
INSERT INTO department VALUES (1, "COMP");


-- ALTER TABLE command

-- ADD COLUMN 
ALTER TABLE teacher ADD COLUMN college VARCHAR(50) DEFAULT "PICT";

-- CHANGE COLUMN
ALTER TABLE teacher CHANGE COLUMN college college_name VARCHAR(50) DEFAULT "PICT";

-- MODIFY COLUMN
ALTER TABLE teacher MODIFY COLUMN college_name VARCHAR(20) DEFAULT "COEP";

-- DROP COLUMN
ALTER TABLE teacher DROP COLUMN college_name;

-- RENAME TABLE
ALTER TABLE teacher RENAME TO teacher_table;
SELECT * FROM teacher_table;
ALTER TABLE teacher_table RENAME TO teacher;


-- TRUNCATE TABLE - deletes table data
TRUNCATE TABLE teacher;

-- DROP TABLE - deletes table
DROP TABLE teacher;