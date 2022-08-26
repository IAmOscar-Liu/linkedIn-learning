-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter1\Chapter1_Video5_Demo1.sql -- 
------------------------------------------------------
USE sakila_new;

-- Ranking Window Functions

-- Rank the most creative years in terms of title releases
SELECT 	release_year,
		COUNT(*) AS total_films_this_year,
FROM 	films
GROUP BY release_year
ORDER BY total_films_this_year DESC;
















-- EOF