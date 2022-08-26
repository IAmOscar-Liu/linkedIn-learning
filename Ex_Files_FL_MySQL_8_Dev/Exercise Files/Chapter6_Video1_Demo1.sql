-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter6\Chapter6_Video1_Demo1.sql -- 
-----------------------------------------------------
USE sakila_new;






-- Descending Indexes

EXPLAIN
SELECT 	title, rental_datetime
FROM 	rentals
WHERE 	language = 'Italian'
ORDER BY rental_datetime DESC;

CREATE INDEX ix1 ON rentals(language, rental_datetime);

CREATE INDEX ix2 ON rentals(language, rental_datetime DESC);

DROP INDEX ix1 ON rentals;





EXPLAIN
SELECT 	title, rental_datetime, return_datetime
FROM 	rentals
ORDER BY rental_datetime, return_datetime DESC;

CREATE INDEX ix3 ON rentals(rental_datetime, return_datetime);

DROP INDEX ix3 ON rentals;

CREATE INDEX ix4 ON rentals(rental_datetime, return_datetime DESC);

DROP INDEX ix4 ON rentals;




-- cleanup
DROP INDEX ix1 ON rentals;
DROP INDEX ix2 ON rentals;
DROP INDEX ix3 ON rentals;
DROP INDEX ix4 ON rentals;



-- EOF