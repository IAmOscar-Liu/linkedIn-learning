-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter2\Chapter2_Video2_Demo1.sql -- 
-----------------------------------------------------
USE sakila_new;

-- Demo 1 - Query simplifaction
-- Improve readability of the solution for the previous chapter's challenge
WITH customer_annual_payments
AS	
(
	SELECT	customer_email,
			YEAR(payment_datetime) AS payment_year,
			SUM(amount) AS total_payment,
			MAX(amount) AS highest_amount_this_year		
	FROM	payments
	GROUP BY 	customer_email,
				YEAR(payment_datetime)
)
SELECT 	*,
		AVG(total_payment) 
			OVER	(PARTITION BY payment_year)
		AS average_amount_this_year		
FROM	customer_annual_payments
ORDER BY 	customer_email,
			payment_year;

-- EOF