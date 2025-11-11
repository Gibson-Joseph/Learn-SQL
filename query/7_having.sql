-- =================================
-- HAVING - filter aggregated data
-- =================================
/*
 You can use HAVING in ordet to filter your data but after the aggregation. So that means we can use the HAVING only after using the GROUP BY
 */
--=============================
--Syntax 
--=============================
/*
 SELECT 
 country, 
 SUM(score) # Aggregation
 FROM Table
 GROUP BY country
 HAVING SUM(score) 
 */
SELECT country,
    sum(score) as total_score
from customers
GROUP BY country
HAVING sum(score) > 800;
/*
 1. If you want to filter the data before aggregation, you want to filter the original data then you can go and use the WHERE clause. 
 
 2. But If you want to filter the data after the aggregations after the GROUP BY then you go and use the HAVING
 */
--=======================
SELECT *
FROM customers;
--=======================
--=============================
--flow 
--=============================
/*
 1. from customers
 2. WHERE score > 400
 3. GROUP BY country
 4. HAVING sum(score) > 800;
 */
SELECT country,
    sum(score)
from customers
WHERE score > 400
GROUP BY country
HAVING sum(score) > 800;
--===============================
-- Find the avarage score for each country considering only customer with score note equal to 0. 
-- And return only those countries with an avarage score greater than > 430
--===============================
SELECT country,
    avg(score) as avg_score
from customers
WHERE score != 0
group by country
HAVING avg(score) > 430;