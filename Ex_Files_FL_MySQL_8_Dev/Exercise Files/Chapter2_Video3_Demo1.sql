-----------------------------------------------------
-- LinkedIn Learning --------------------------------
-- First look into MySQL8 ---------------------------
-- Ami Levin 2019 -----------------------------------
-- .\Code Demos\Chapter2\Chapter2_Video3_Demo1.sql -- 
-----------------------------------------------------
USE sakila_new;


-- Demo - Recursive CTE
-- Generating time series (PostgreSQL 'generate_series' alternative)
-- Generate a series of all days in 2019, one row per day
WITH RECURSIVE days_of_2019 (day) 
AS
(
	SELECT CAST('20190101' AS date)
	UNION ALL
	SELECT 	day + INTERVAL 1 DAY 
	FROM 	days_of_2019
	WHERE 	day <= ('20191231')
)
SELECT 	* 
FROM 	days_of_2019
ORDER BY day;









-- Web link crawling
CREATE TABLE weblinks 
(
	URL VARCHAR(256) NOT NULL,
	points_to_URL VARCHAR(256) NOT NULL,
	PRIMARY KEY (URL, points_to_URL),
	CHECK (URL <> points_to_URL)
);

INSERT INTO weblinks (URL, points_to_URL)
VALUES 	('U1', 'U11'), ('U1', 'U12'), 
		('U2', 'U13'), ('U2', 'U14'),
		('U3', 'U1') ,('U3', 'U2') ,('U3', 'U4') ,('U3', 'U11') ,
		('U4', 'U2') ,('U4', 'U1') ,('U5', 'U4') ,('U5', 'U12')

SELECT 	* 
FROM 	weblinks;

-- Crawl the web starting with URL U4
WITH RECURSIVE crawler (from_URL, to_URL, lvl)
AS
(
	SELECT 	'root', 
			CAST('U4' AS CHAR(3)),
			0 
	UNION ALL
	SELECT 	c.to_URL, 
			w.points_to_URL,
			lvl + 1
	FROM 	weblinks AS w 
			INNER JOIN 
			crawler AS c
			ON w.URL = c.to_URL
)
SELECT 	CONCAT(REPEAT('-', lvl), ' ', from_URL, ' -> ',  to_URL) AS URL_Path
FROM 	crawler
ORDER BY lvl, from_URL, to_URL;

-- Cleanup
DROP TABLE weblinks;		

-- EOF
