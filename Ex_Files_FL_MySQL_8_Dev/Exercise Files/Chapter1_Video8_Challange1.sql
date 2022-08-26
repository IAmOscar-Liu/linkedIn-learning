----------------------------------------------------------
-- LinkedIn Learning -------------------------------------
-- First look into MySQL8 --------------------------------
-- Ami Levin 2019 ----------------------------------------
-- .\Code Demos\Chapter1\Chapter1_Video8_Challenge1.sql -- 
----------------------------------------------------------
USE sakila_new;

-- Challenge :
-- Write a query that calculates customers total annual payments.
-- In addition, show the average payment for all customers in the same year,
-- and the highest amount the customer paid in a single payment that year.
-- Order the result by customer and year.

/* Desired result:

|customer_email                 |payment_year|total_payment|average_amount_this_year|highest_amount_this_year|
|-------------------------------|------------|-------------|------------------------|------------------------|
|AARON.SELBY@sakilacustomer.org |2005        |714.77       |653.433160              |714.77                  |
|AARON.SELBY@sakilacustomer.org |2006        |690.83       |1029.677407             |176.55                  |
|AARON.SELBY@sakilacustomer.org |2007        |6807.50      |6552.445159             |1410.59                 |
|AARON.SELBY@sakilacustomer.org |2008        |866.01       |1051.616043             |866.01                  |
|ADAM.GOOCH@sakilacustomer.org  |2006        |2186.72      |1029.677407             |1487.97                 |
|ADAM.GOOCH@sakilacustomer.org  |2007        |6970.81      |6552.445159             |1181.15                 |
|ADAM.GOOCH@sakilacustomer.org  |2008        |967.10       |1051.616043             |967.10                  |
|ADRIAN.CLARY@sakilacustomer.org|2005        |525.05       |653.433160              |456.26                  |
... <Trimmed> ...
*/



-- EOF