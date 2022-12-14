--------------------------------------------
-- LinkedIn Learning -----------------------
-- Advanced SQL - Query Processing Part 2 --
-- Ami Levin 2020 --------------------------
-- .\Chapter3\Challenge.sql ----------------
--------------------------------------------

-- GitHub
https://github.com/ami-levin/LinkedIn/tree/master/Query%20Processing%20Part%202/Chapter3%20-%20More%20on%20Grouping/Challenge.sql

-- DBFiddle UK
/*SQL Server*/	https://dbfiddle.uk/?rdbms=sqlserver_2019&fiddle=ff5780541829f07ad26b4afd5fdc3a85
/*PostgreSQL*/	https://dbfiddle.uk/?rdbms=postgres_12&fiddle=a3bbb61d21adf12d24192d557a23ca30

/*
   ________          ____                    
  / ____/ /_  ____ _/ / /__  ____  ____ ____ 
 / /   / __ \/ __ `/ / / _ \/ __ \/ __ `/ _ \
/ /___/ / / / /_/ / / /  __/ / / / /_/ /  __/
\____/_/ /_/\__,_/_/_/\___/_/ /_/\__, /\___/ 
                                /____/       

Your last challenge is to write a query that returns a statistical report of vaccinations.
The report should include the total number of vaccinations for several dimensions:
π’ Annual
π’ Per species
π’ For each species per year
π’ By each staff member
π’ By each staff member per species
And to make it interesting, letβs throw in the latest vaccination year for each of these groups.

Expected results:

βββββββββββββ¬ββββββββββββββββ¬ββββββββββββββββββββββββββββββββββββ¬ββββββββββββ¬ββββββββββββ¬ββββββββββββββββββββββββ¬ββββββββββββββββββββββββ
βYear		βSpecies		βEmail								βFirst_Name	βLast_Name	βNumber_Of_Vaccinations	βLatest_Vaccination_Yearβ
βββββββββββββΌββββββββββββββββΌββββββββββββββββββββββββββββββββββββΌββββββββββββΌββββββββββββΌββββββββββββββββββββββββΌββββββββββββββββββββββββ€
β2016		βAll Species	βAll Staff							β			β			β11						β2016					β
β2016		βCat			βAll Staff							β			β			β2						β2016					β
β2016		βDog			βAll Staff							β			β			β7						β2016					β
β2016		βRabbit			βAll Staff							β			β			β2						β2016					β
β2017		βAll Species	βAll Staff							β			β			β23						β2017					β
β2017		βCat			βAll Staff							β			β			β7						β2017					β
β2017		βDog			βAll Staff							β			β			β15						β2017					β
β2017		βRabbit			βAll Staff							β			β			β1						β2017					β
β2018		βAll Species	βAll Staff							β			β			β32						β2018					β
β2018		βCat			βAll Staff							β			β			β9						β2018					β
β2018		βDog			βAll Staff							β			β			β18						β2018					β
β2018		βRabbit			βAll Staff							β			β			β5						β2018					β
β2019		βAll Species	βAll Staff							β			β			β29						β2019					β
β2019		βCat			βAll Staff							β			β			β10						β2019					β
β2019		βDog			βAll Staff							β			β			β17						β2019					β
β2019		βRabbit			βAll Staff							β			β			β2						β2019					β
βAll Years	βAll Species	βAll Staff							β			β			β95						β2019					β
βAll Years	βAll Species	βashley.flores@animalshelter.com	βAshley		βFlores		β34						β2019					β
βAll Years	βAll Species	βdennis.hill@animalshelter.com		βDennis		βHill		β5						β2019					β
βAll Years	βAll Species	βgerald.reyes@animalshelter.com		βGerald		βReyes		β10						β2019					β
βAll Years	βAll Species	βrobin.murphy@animalshelter.com		βRobin		βMurphy		β11						β2019					β
βAll Years	βAll Species	βwanda.myers@animalshelter.com		βWanda		βMyers		β28						β2019					β
βAll Years	βAll Species	βwayne.carter@animalshelter.com		βWayne		βCarter		β7						β2019					β
βAll Years	βCat			βAll Staff							β			β			β28						β2019					β
βAll Years	βCat			βashley.flores@animalshelter.com	βAshley		βFlores		β10						β2018					β
βAll Years	βCat			βdennis.hill@animalshelter.com		βDennis		βHill		β2						β2019					β
βAll Years	βCat			βgerald.reyes@animalshelter.com		βGerald		βReyes		β4						β2019					β
βAll Years	βCat			βrobin.murphy@animalshelter.com		βRobin		βMurphy		β2						β2019					β
βAll Years	βCat			βwanda.myers@animalshelter.com		βWanda		βMyers		β9						β2019					β
βAll Years	βCat			βwayne.carter@animalshelter.com		βWayne		βCarter		β1						β2019					β
βAll Years	βDog			βAll Staff							β			β			β57						β2019					β
βAll Years	βDog			βashley.flores@animalshelter.com	βAshley		βFlores		β23						β2019					β
βAll Years	βDog			βdennis.hill@animalshelter.com		βDennis		βHill		β2						β2019					β
βAll Years	βDog			βgerald.reyes@animalshelter.com		βGerald		βReyes		β3						β2019					β
βAll Years	βDog			βrobin.murphy@animalshelter.com		βRobin		βMurphy		β7						β2019					β
βAll Years	βDog			βwanda.myers@animalshelter.com		βWanda		βMyers		β16						β2019					β
βAll Years	βDog			βwayne.carter@animalshelter.com		βWayne		βCarter		β6						β2019					β
βAll Years	βRabbit			βAll Staff							β			β			β10						β2019					β
βAll Years	βRabbit			βashley.flores@animalshelter.com	βAshley		βFlores		β1						β2019					β
βAll Years	βRabbit			βdennis.hill@animalshelter.com		βDennis		βHill		β1						β2018					β
βAll Years	βRabbit			βgerald.reyes@animalshelter.com		βGerald		βReyes		β3						β2019					β
βAll Years	βRabbit			βrobin.murphy@animalshelter.com		βRobin		βMurphy		β2						β2018					β
βAll Years	βRabbit			βwanda.myers@animalshelter.com		βWanda		βMyers		β3						β2017					β
βββββββββββββ΄ββββββββββββββββ΄ββββββββββββββββββββββββββββββββββββ΄ββββββββββββ΄ββββββββββββ΄ββββββββββββββββββββββββ΄ββββββββββββββββββββββββ

Guidelines:

π’ 	ORDER BY Year, Species, First_Name, Last_Name and be careful with the order by aliases...

   ______                __   __               __   __
  / ____/___  ____  ____/ /  / /   __  _______/ /__/ /
 / / __/ __ \/ __ \/ __  /  / /   / / / / ___/ //_/ / 
/ /_/ / /_/ / /_/ / /_/ /  / /___/ /_/ / /__/ ,< /_/  
\____/\____/\____/\__,_/  /_____/\__,_/\___/_/|_(_)   
                                                      
*/