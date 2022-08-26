-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter6\Chapter6_Video1_Demo3.sql -- 
-----------------------------------------------------

USE sakila_new;






-- Functional Indexes

EXPLAIN
SELECT 	title, rental_datetime
FROM 	rentals
WHERE 	YEAR(rental_datetime) = 2006
ORDER BY rental_datetime DESC;


CREATE INDEX ix5 ON rentals((YEAR(rental_datetime)), rental_datetime DESC);





-- Cleanup
DROP INDEX ix1 ON rentals;
DROP INDEX ix2 ON rentals;
DROP INDEX ix3 ON rentals;
DROP INDEX ix4 ON rentals;




-- EOF