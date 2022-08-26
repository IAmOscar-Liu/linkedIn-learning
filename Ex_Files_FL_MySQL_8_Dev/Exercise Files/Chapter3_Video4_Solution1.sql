-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter3\Chapter3_Video4_Solution1.sql -- 
-----------------------------------------------------
USE sakila_new;

-- Using LATERAL derived tables 					
					
WITH customer_totals
AS
(
SELECT 	c.email, c.store_city, c.store_country,
		SUM(p.amount) AS total_paid
FROM 	payments AS p
		INNER JOIN 
		customers AS c 
		ON 	c.email = p.customer_email
GROUP BY 	c.email
)
SELECT 	tc.email,
		s.store_city, 
		s.store_country,
		tc.total_paid
FROM 	stores AS s 
		CROSS JOIN LATERAL
		(
			SELECT 	ct.email,
					ct.total_paid
			FROM 	customer_totals AS ct
			WHERE	(ct.store_city, ct.store_country) 
					=
					(s.store_city, s.store_country)
			ORDER BY ct.total_paid DESC 
			LIMIT 1 
		) AS tc -- tc for 'top customers'
ORDER BY total_paid DESC; 

-- Scroll down for an alternative solution using ranking window functions
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- -- An even better solution using RANK...

WITH customer_totals
AS
(
SELECT 	c.email,
		c.store_city, c.store_country,
		SUM(p.amount) AS total_paid,
		RANK() OVER (PARTITION BY c.store_city, c.store_country
					 ORDER BY SUM(p.amount) DESC
					) AS cust_rank
FROM 	payments AS p
		INNER JOIN 
		customers AS c 
		ON 	c.email = p.customer_email
GROUP BY 	c.email
)
SELECT 	ct.email,
		s.store_city, s.store_country,
		ct.total_paid
FROM 	stores AS s 
		INNER JOIN
		customer_totals AS ct 
		ON 	(s.store_city, s.store_country) 
			=
			(ct.store_city, ct.store_country)
WHERE 	cust_rank = 1
ORDER BY total_paid DESC;

-- EOF