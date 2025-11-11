--===========================
-- LIMIT - Limit our data
--===========================
/*
 In other database we will call it TOP. 
 If you use it, it's going to go and restrict the number of rows returned in the results.
 So you have control on how many rows you want to see in the results
 */
--===========================
-- Syntax 
--===========================
/*
 SELECT * from Table LIMIT <number>;
 */
--===========================
--  Flow 
--===========================
/*
 1. From Table
 2. Select *
 3. LIMIT <number> For each row in database, we have a row number. 
 */
--===========================
--  Retrive only 3 customers 
--===========================
SELECT *
from customers
LIMIT 3;
--===========================
-- Retrive the top 3 customers with the highest score 
--===========================
SELECT *
FROM customers
ORDER BY score DESC
LIMIT 3;
--===========================
-- Retrive the top 3 customers with the lowest score 
--===========================
SELECT *
from customers
ORDER BY score ASC
LIMIT 2;
--===========================
-- Get two most recent orders
--===========================
SELECT *
from orders
ORDER BY order_date DESC
LIMIT 2;