-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter1\Chapter1_Video7_Demo1.sql -- 
------------------------------------------------------
USE sakila_new;

-- Analytic Window Functions

SELECT	customer_email,
		COUNT(*) AS total_rentals,
		CUME_DIST() 
			OVER (	ORDER BY COUNT(*)
				 ) AS cumulative_distribution,
		PERCENT_RANK() 
			OVER (	ORDER BY COUNT(*)
				 ) AS percent__rank
FROM	rentals
GROUP BY 	customer_email
ORDER BY 	total_rentals DESC;
		








-- EOF