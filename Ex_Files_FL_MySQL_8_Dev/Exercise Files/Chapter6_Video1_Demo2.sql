-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter6\Chapter6_Video1_Demo2.sql -- 
-----------------------------------------------------
USE sakila_new;





-- Invisible Indexes

EXPLAIN
SELECT 	title, rental_datetime, return_datetime
FROM 	rentals
ORDER BY rental_datetime, return_datetime DESC;

ALTER TABLE rentals ALTER INDEX ix4 INVISIBLE;
ALTER TABLE rentals ALTER INDEX ix3 INVISIBLE;

ALTER TABLE rentals ALTER INDEX ix4 VISIBLE;






-- Cleanup
DROP INDEX ix1 ON rentals;
DROP INDEX ix2 ON rentals;
DROP INDEX ix3 ON rentals;
DROP INDEX ix4 ON rentals;




-- EOF