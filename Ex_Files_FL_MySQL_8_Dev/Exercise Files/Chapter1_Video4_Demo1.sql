-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter1\Chapter1_Video4_Demo1.sql -- 
------------------------------------------------------
USE sakila_new;

-- Aggregate Window Functions with framing

-- The payments table
SELECT 	* 
FROM 	payments 
LIMIT 	20;
















-- Show customer payments alongside a running total of all his payments to date
-- Using subquery
SELECT	p1.customer_email, p1.payment_datetime, p1.amount, 
		(
			SELECT 	SUM(p2.amount) 
			FROM	payments AS p2
			WHERE	p2.customer_email = p1.customer_email
					AND 
					p2.payment_datetime <= p1.payment_datetime
		) AS total_payments_to_date
FROM	payments AS p1
ORDER BY 	p1.customer_email, p1.payment_datetime;

-- Using window function
SELECT	customer_email, payment_datetime, amount,
		SUM(amount) 
			OVER (	PARTITION BY customer_email
					ORDER BY payment_datetime
					ROWS BETWEEN 	UNBOUNDED PRECEDING
									AND CURRENT ROW
				 ) AS total_payments_to_date
FROM	payments
ORDER BY 	customer_email, payment_datetime;

-- EOF