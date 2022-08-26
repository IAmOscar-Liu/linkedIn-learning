-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter4\Chapter4_Video1_Demo1.sql -- 
-----------------------------------------------------
USE sakila_new;

-- Changes to auto increment persistance

CREATE TABLE things (
						id 		INT AUTO_INCREMENT PRIMARY KEY,
						name 	VARCHAR(20) NOT NULL,
						color 	ENUM ('Blue', 'Green', 'Red', 'Black')
					);
				
INSERT INTO Things (name, color)
VALUES 	('Plane', 'Blue'), 
		('Bird', 'Green');

SELECT * FROM things;

START TRANSACTION;

INSERT INTO Things (name, color)
VALUES 	('Superman', 'Red');

SELECT * FROM things;

-- Restart Service

SELECT * FROM things;

INSERT INTO Things (name, color)
VALUES 	('Superman', 'Red');

SELECT * FROM things;

ALTER TABLE things AUTO_INCREMENT = 1000;

-- Migrate to new server

INSERT INTO things (name, color)
VALUES 	('Spiderman', 'Black');

SELECT * FROM things;

-- Cleanup
DROP TABLE things;

-- EOF