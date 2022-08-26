---------------------------------------------------------
-- LinkedIn Learning ------------------------------------
-- First look into MySQL8 -------------------------------
-- Ami Levin 2019 ---------------------------------------
-- .\Code Demos\Chapter1\Chapter1_Video9_Solution1.sql -- 
---------------------------------------------------------
USE sakila_new;

-- Challenge
-- ------------  
-- Write a query that calculates customers total annual payments.
-- In addition, show the average payment for all customers in the same year
-- and the highest amount he paid in a single payment that year.
-- Order the result by customer and year.

-- Solution
SELECT	customer_email,
		YEAR(payment_datetime) AS payment_year,
		SUM(amount) AS total_payment,
		AVG(SUM(amount)) 
			OVER (PARTITION BY YEAR(payment_datetime))
		AS average_amount_this_year,
		MAX(amount) AS highest_amount_this_year		
FROM	payments
GROUP BY 	customer_email,
			YEAR(payment_datetime)
ORDER BY 	customer_email, 
			payment_year;

-- EOF