---------------------------------------------------------- 
-- LinkedIn Learning -------------------------------------
-- First look into MySQL8 --------------------------------
-- Ami Levin 2019 ----------------------------------------
-- .\Code Demos\Chapter3\Chapter3_Video3_Challenge1.sql -- 
----------------------------------------------------------  
USE sakila_new;

-- Challenge - Show the top paying customer for each store using a LATERAL derived table.
-- This is the solution query from the previous demo, using a subquery with MAX
-- Hint - you can use the same CTE as your starting point...
WITH customer_totals
AS
(
SELECT 	c.email,
		c.store_city, c.store_country,
		SUM(p.amount) AS total_paid
FROM 	payments AS p
		INNER JOIN 
		customers AS c 
		ON 	c.email = p.customer_email
GROUP BY 	c.email
)
SELECT 	*
FROM 	customer_totals AS ct1
WHERE 	total_paid = 	( 	
							SELECT 	MAX(ct2.total_paid)
							FROM 	customer_totals AS ct2
							WHERE 	(ct1.store_city, ct1.store_country) 
									= 
									(ct2.store_city, ct2.store_country)
						)
ORDER BY total_paid DESC;

-- EOF