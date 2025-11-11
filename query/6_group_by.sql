--=============================
-- GROUP BY - aggrigate our data
--=============================
/*
 The GROUP BY comes between WHERE and ORDER BY
 What is exactly GROUP BY?
 It's going to go and combine the rows with the same value. So its going to go and combine and smash press your rows to make it aggregate and more combined.
 
 So all GROUP BY does it aggregates a column by another column.
 */
--=============================
--Syntax 
--=============================
/*
 SELECT 
 country, # this is the value that we want to group the data by.
 SUM(score) # Aggregation
 FROM Table
 GROUP BY country
 -- so that mean each value of the country must be presented in the output only once and for each country we want to see the aggregation and that is the total of score.
 */
SELECT *
from customers;
--===============================
--Flow
--===============================
/*
 1. from country
 2. group by - SQL will group up the data by country and its understand it aggregate the score for that. So SQL going to go and find the rows that are sharing the same value.
 */
--===============================
-- Find the total score for each country
--===============================
SELECT country,
    SUM(score)
from customers
group by country;
/*
 As (Alias)
 Shorthand name (Lable) assigned to column or table in a query
 */
SELECT country,
    sum(score) AS total_score
from customers
GROUP BY country;
--===============================
-- GROUP BY RULE 
--===============================
/*
 All columns in the SELECT must be either aggregated or included in the GROUP BY.
 */
/*
 So If you want the non-aggregated columns that you adding in the select myst be as well mentioned in the group by
 */
-- column "customers.first_name" must appear in the GROUP BY clause or be used in an aggregate function
-- SELECT country,
--     first_name
-- from customers
-- GROUP BY country;
SELECT country,
    first_name,
    sum(score)
from customers
GROUP BY country,
    first_name;
--===========================================
-- The result of GROUP BY determined by the unique value of the grouped cloumns
--===========================================
--===========================================
-- Find the total score and total number of customers for each counry
--===========================================
SELECT country,
    sum(score) as total_score,
    count(id) as total_customers
from customers
GROUP BY country