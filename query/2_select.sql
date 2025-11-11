-- SELECT
--  using the select query we can asking the database for data. Once you execute the query, the database going to go and fetch your data and then it prepares the result to us.
-- The query will not modify anthing, will not change the data inside your tabls or even change the structure of the database.
--  So you use select statement only in order to read something from the database.
-- Retrive all customers 
SELECT *
FROM customers;
-- select *; its going to retrive all the columns from the tabls
-- from clause; its going to tell sql where to find the data
-- Each query will start with select
-- Sql run the qury in the fllowing order;
-- 1. FROM customers;
-- 2. SELECT *
-- SQL first retrive the all data from the database to the result, and then in the next step going to go and check SELECT statement. So which column we have to keep in the results, since we are saying *, then the sql going to keep everything all the columns and rows.
SELECT *
FROM orders;
-- Select few columns from the database
-- Instead of using the * we are going to go and make a list of columns that we want to see in the output
-- syntax
/**
 select col1, col2 from table 
 */
SELECT country,
    first_name,
    score
from customers