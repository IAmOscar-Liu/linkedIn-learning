-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter2\Chapter2_Video2_Demo2.sql -- 
-----------------------------------------------------
USE sakila_new;

-- Demo 2 - Code reuse


-- Show categories that are performing better than average 
-- based on number of rentals
SELECT 	tc1.category,
		COUNT(*) AS number_of_rentals
FROM	title_categories AS tc1
		INNER JOIN 
		rentals AS r1
		ON r1.title = tc1.title		
GROUP BY tc1.category
HAVING 	COUNT(*) >	(	SELECT AVG(number_of_rentals)
						FROM 	(
									SELECT  COUNT(*) AS number_of_rentals
									FROM 	title_categories AS tc2
											INNER JOIN 
											rentals AS r2
											ON r2.title = tc2.title					
									GROUP BY tc2.category
								) AS category_rentals
					)
ORDER BY number_of_rentals DESC;



-- Code reuse and simplification with a CTE
WITH category_rentals
AS
(
	SELECT 	tc.category,
			COUNT(*) AS number_of_rentals
	FROM	title_categories AS tc
			INNER JOIN 
			rentals AS r
			ON r.title = tc.title		
	GROUP BY tc.category
),
average_category_rental
AS
(
	SELECT 	AVG(number_of_rentals) AS average_category_rental 
	FROM	category_rentals
)
SELECT	category,
		number_of_rentals
FROM	category_rentals AS cr 
WHERE	number_of_rentals >		(
								SELECT average_category_rental
								FROM  average_category_rental 
								)
ORDER BY number_of_rentals DESC;
								
-- EOF