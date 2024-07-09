SHOW DATABASES;

CREATE DATABASE Temp;
USE Temp;

SHOW TABLES;

CREATE TABLE Customer (
	id INT PRIMARY KEY,
    cname VARCHAR(255),
    Address VARCHAR(255),
    Gender CHAR(2),
    City VARCHAR(255),
    Pincode INT
);

INSERT INTO Customer (id, cname, Address, Gender, City, Pincode) VALUES
	(1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
    (1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001),
    (245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
    (210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
    (500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 141001);
    
INSERT INTO Customer (id, cname) VALUES
	(800, 'Ram Kumar3');
    
INSERT INTO Customer VALUES
	(1252, 'Ram Kumar3', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);
    
-- Replace
REPLACE INTO Customer VALUES
	(1252, 'Kishanlal', 'Lake Town', 'M', 'Maharashtra', NULL);
    
REPLACE INTO Customer SET id = 1252, cname = 'Abhishek'; -- Mostly used Syntax

REPLACE INTO Customer(id, cname, City) SELECT id, cname, City From Customer WHERE id = 1252;
    
DROP TABLE Customer;

SELECT * FROM Customer;

-- UPDATE
UPDATE Customer SET cname = 'Kishanlal Choudhary', Address = 'Bibwewadi', Gender = 'M' WHERE id = 800;
UPDATE Customer SET Pincode = Pincode + 5 WHERE id = 800;

-- UPDATE MULTIPLE ROWS
UPDATE Customer SET Pincode = 144000; -- When safe update mode is on the we are not allowed to perform this operation 
SET SQL_SAFE_UPDATES = 0; -- To disable safe update mode
SET SQL_SAFE_UPDATES = 1; -- To Enable safe update mode

-- DELETE
DELETE FROM Customer WHERE id = 800;
DELETE FROM Customer; -- When safe update mode is on the we are not allowed to perform this operation

CREATE TABLE Order_details (
	Order_id INT PRIMARY KEY,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY (cust_id) 
    REFERENCES Customer (id)
    ON UPDATE CASCADE
);

DROP TABLE Order_details;

INSERT INTO Customer VaLUES
	(210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002);

INSERT INTO Order_details VALUES (1, '2019-03-11', 210);

SELECT * FROM Order_details;

DELETE FROM Customer WHERE id = 210;

UPDATE Customer SET id = 150, cname = 'Kishanlal' WHERE id = 210;

-- ON UPDATE CASCADE
ALTER TABLE Order_details ADD CONSTRAINT cust_id FOREIGN KEY (cust_id) REFERENCES Customer (id) ON UPDATE CASCADE;

-- ON DELETE CASCADE
ALTER TABLE Order_details ADD CONSTRAINT cust_id FOREIGN KEY (cust_id) REFERENCES Customer (id) ON DELETE CASCADE;

-- ON DELETE SET NULL
ALTER TABLE Order_details ADD CONSTRAINT cust_id FOREIGN KEY (cust_id) REFERENCES Customer (id) ON DELETE SET NULL;

DESC Order_details;

CREATE TABLE Bank_account (
	Bank_id INT PRIMARY KEY,
    Username VARCHAR(255) UNIQUE,
    Balance INT NOT NULL DEFAULT 1500,
    CONSTRAINT acc_bal_chk CHECK (Balance >= 1000) 
);

INSERT INTO Bank_account VALUES (1, 'Kisan008', 10000);

INSERT INTO Bank_account VALUES (2, 'Abhishek01', 800);

INSERT INTO Bank_account VALUES (3, 'Kisan008', 20000);

INSERT INTO Bank_account (Bank_id, Username) VALUES (4, 'Sunay25');

DROP TABLE Bank_account;

SELECT * FROM Bank_account;

-- ADD new Column
ALTER TABLE Bank_account ADD Interest INT NOT NULL DEFAULT 0; 

-- MODIFY
ALTER TABLE Bank_account MODIFY Interest FLOAT NOT NULL DEFAULT 0; 

DESC Bank_account;

-- CHANGE COLUMN - Rename column name
ALTER TABLE Bank_account CHANGE COLUMN Interest Saving_Interest DOUBLE NOT NULL DEFAULT 0;

-- DROP COLUMN
ALTER TABLE Bank_account DROP COLUMN Saving_Interest; 

-- RENAME the TABLE
ALTER TABLE Bank_account RENAME TO Account_Details;

SELECT * FROM Account_Details;