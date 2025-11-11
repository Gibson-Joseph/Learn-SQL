-- We us where in order to filter our data based on a condition and any data that fulfill the condition going to stay in the output in the results and the data that don't meet the condition will be filtered out of the resluts.
--===================================
-- Syntax
--===================================
/**
 select * 
 from table
 where condition
 */
--===================================
--Execution flow;
--===================================
/**
 1. from table
 2. where condition
 3. select * 
 */
--===================================
--  Retrive customers with a score not equal to 0
--===================================
SELECT *
FROM customers
WHERE score != 0;
--===================================
--  Retrive customers from germany 
--===================================
SELECT first_name,
    country
from customers
WHERE country = 'Germany';
-- In sql if you want to write a value that contains characters then you have to put in beteween two single quotes.
-- If our columns contains only numbers we can write it without single quoutes