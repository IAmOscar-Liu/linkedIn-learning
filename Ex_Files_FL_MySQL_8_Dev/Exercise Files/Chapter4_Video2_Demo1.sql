-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter4\Chapter4_Video2_Demo1.sql -- 
-----------------------------------------------------
USE sakila_new;

CREATE TABLE some_table (some_column CHAR(1));

DROP TABLE some_table, non_exists_table;

SHOW TABLES LIKE 'some%';

START TRANSACTION;

	DROP TABLE some_table;
						
	DROP TABLE non_exists_table;

COMMIT;

SHOW TABLES LIKE 'some%';










-- Cleanup
DROP TABLE some_table;

-- EOF