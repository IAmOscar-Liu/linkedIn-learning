-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter1\Chapter1_Video6_Demo1.sql -- 
------------------------------------------------------
USE sakila_new;



-- Offset Window Functions

-- The rentals table
SELECT 	*
FROM 	rentals
LIMIT 	20;


















-- Show the previous title rented  by the same customer for each rental row
-- Using subqueries
SELECT 	r1.rental_datetime, r1.customer_email, r1.title,
		(	SELECT 	title 
			FROM 	rentals AS r2
			WHERE	r1.customer_email = r2.customer_email
					AND
					r2.rental_datetime = 	
					(	SELECT 	MAX(rental_datetime)
						FROM  	rentals AS r3
						WHERE 	r3.customer_email = r1.customer_email
								AND
								r3.rental_datetime < r1.rental_datetime
					)
		) AS previous_title
FROM	rentals AS r1
ORDER BY 	r1.customer_email, r1.rental_datetime;
















-- Using a window function
SELECT 	rental_datetime, customer_email, title,
		LAG(title, 1) 
			OVER (PARTITION BY 	customer_email
				  ORDER BY rental_datetime
		) AS previous_title
FROM	rentals
ORDER BY 	customer_email, rental_datetime;














-- EOF