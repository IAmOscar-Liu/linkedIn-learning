-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter3\Chapter3_Video1_Demo1.sql -- 
-----------------------------------------------------
USE sakila_new;

-- Demo - Join Limitations
-- Show latest movie rented for each category

SELECT 	c.category,
		(	
			SELECT 	r.title -- , r.rental_datetime
			FROM 	rentals AS r 
					INNER JOIN 
					title_categories AS tc 
					ON tc.title = r.title
			WHERE	tc.category = c.category
			ORDER BY r.rental_datetime DESC
			LIMIT 1 -- 3
		) AS latest_rental
FROM 	categories AS c
ORDER BY c.category







-- Show latest 3 movies rented, per category

SELECT 	c.category,
		r.title,
		r.rental_datetime
FROM 	categories AS c 
		CROSS JOIN 
		(	SELECT  r.title, 
					r.rental_datetime
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

-- EOF