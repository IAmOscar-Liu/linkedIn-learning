---------------------------------------------------------
-- LinkedIn Learning ------------------------------------
-- First look into MySQL8 -------------------------------
-- Ami Levin 2019 ---------------------------------------
-- .\Code Demos\Chapter2\Chapter2_Video5_Solution1.sql -- 
---------------------------------------------------------
USE sakila_new;

-- CTE solution
-- Write a query to generate all Fibonacci numbers smaller than 1,000

WITH RECURSIVE fibonacci (m, n)
AS
(
	SELECT 	0, 1
	UNION ALL
	SELECT  m + n,
			m + n + n
	FROM 	fibonacci
	WHERE 	m + n + n <= 1000
)
SELECT 	*
FROM 	fibonacci;

-- EOF
