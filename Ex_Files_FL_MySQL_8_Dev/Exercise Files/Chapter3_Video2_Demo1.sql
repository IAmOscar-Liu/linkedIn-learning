-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter3\Chapter3_Video2_Demo1.sql -- 
-----------------------------------------------------
USE sakila_new;


-- Demo - Join Limitations

SELECT 	c.category,
		r.title,
		r.rental_datetime
FROM 	categories AS c 
		CROSS JOIN 
		(	SELECT  r.title, r.rental_datetime
			FROM 	rentals AS r 
					INNER JOIN 
					title_categories AS tc
					ON r.title = tc.title
			WHERE 	c.category = tc.category
			ORDER BY r.rental_datetime DESC
			LIMIT 3
		)	AS r
ORDER BY 	c.category, 
			r.rental_datetime DESC;

		
		
		

-- Show the top paying customer for each store

WITH customer_totals
AS
(
SELECT 	c.email,
		c.store_city, c.store_country, -- MAX(c.store_city), MAX(c.store_country)
		SUM(p.amount) AS total_paid
FROM 	payments AS p
		INNER JOIN 
		customers AS c 
		ON 	c.email = p.customer_email
GROUP BY 	c.email -- , c.store_city, c.store_country 
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