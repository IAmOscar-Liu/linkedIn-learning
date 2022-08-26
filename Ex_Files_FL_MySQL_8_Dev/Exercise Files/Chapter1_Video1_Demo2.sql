-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter1\Chapter1_Video1_Demo2.sql -- 
------------------------------------------------------
USE sakila_new;

-- [Window Function] OVER(PARTITION BY ...)

-- the films table
SELECT 	*
FROM 	films
LIMIT 	20;

















-- Show the number of films released in the same year as current row
-- Using subquery
SELECT 	f1.title,
		f1.language,
		f1.release_year,
		(
			SELECT 	COUNT(*) 
			FROM 	films AS f2
			WHERE	f2.release_year = f1.release_year 
		) AS total_titles_this_year
FROM 	films AS f1
ORDER BY title, language;

-- Using window function
SELECT 	title,
		language,
		release_year,	
		COUNT(*) OVER(PARTITION BY release_year) 
		AS total_titles_this_year
FROM 	films
ORDER BY title, language;
















-- EOF