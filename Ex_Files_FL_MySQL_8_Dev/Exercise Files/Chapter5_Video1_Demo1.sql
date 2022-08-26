-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter5\Chapter5_Video1_Demo1.sql -- 
-----------------------------------------------------
USE sakila_new;









-- Using roles

CREATE USER 'jane'@'localhost' IDENTIFIED BY 'janes_password';

CREATE ROLE 'titles_read';

GRANT SELECT ON sakila_new.titles TO 'titles_read';

GRANT 'titles_read' TO 'jane'@'localhost'; -- ,'jim'@'localhost', 'john'@'localhost'...;


SET DEFAULT ROLE 'titles_read' TO 'jane'@'localhost';


GRANT SELECT ON inventory TO 'titles_read';






-- Cleanup

DROP USER 'jane'@'localhost';
DROP ROLE 'titles_read';





-- EOF