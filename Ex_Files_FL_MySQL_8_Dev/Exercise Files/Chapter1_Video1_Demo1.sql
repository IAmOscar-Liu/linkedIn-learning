-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter1\Chapter1_Video1_Demo1.sql -- 
-----------------------------------------------------
USE sakila_new;

-- [Window Function] OVER()

-- The titles table
SELECT 	* 
FROM 	titles 
LIMIT 	20;

-- Show total number of film titles alongside film details
-- Using subquery
SELECT 	title,	
		(
			SELECT 	COUNT(*) 
			FROM 	titles
		) AS total_titles
FROM 	titles;

-- Using window function
SELECT 	title,	
		COUNT(*) OVER() AS total_titles
FROM 	titles;

-- EOF