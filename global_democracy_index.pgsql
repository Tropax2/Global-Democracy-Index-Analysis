CREATE TABLE global_democracy_index(
    contry_code VARCHAR(3),
    country_name VARCHAR(30),
    score_2018 NUMERIC,
    score_2022 NUMERIC
);

COPY global_democracy_index
FROM 'directory'
WITH (FORMAT CSV, HEADER);

SELECT  country_name AS "Country",
        score_2022 AS "2022"
FROM global_democracy_index
ORDER BY score_2022 DESC
LIMIT 10;    
/*
We verify that 8 out of the 10 contries with highest index in 2022 are European. 
Moreover the majority of them are scandinavian contries.
This comes with no surprise since they are considered by many the countries with 
the most advanced societies.
*/
-- Lets verify what countries had the biggest increase and decline as well as the percentage change.
SELECT  country_name AS "Country",
        score_2018 AS "2018",
        score_2022 AS "2022",
        score_2022 - score_2018 AS "difference",
        ROUND((score_2022 - score_2018)/score_2018 * 100, 2) AS "percentage change"
FROM global_democracy_index
ORDER BY "percentage change" DESC;
/*
The top 3 countries with the biggest negative change are Afghanistan, Myanmar and Haiti.
The political regimes of each of these countries were affected due to events that  
occurred during this 4 years. First, Afghanistan saw the withdrawl of American troops and a Taliban 
autocratic regime was put into place. Myanmar saw a military coup in February 2021, while Haiti 
had their president assassinated in 2021.

On the other end of the spectrum, Thailand, Guinea-Bissau and Armenia saw the biggest increases, 
probably associated with political stability and economic prosperity.
*/

