-- No Joins
------------------------------------------------
-- Get all the data without joining the tables.
------------------------------------------------
-- Returns Data from tables without combining them
-- Syntax
-- select * from A; select * from B;
-----------------------------------------
-- Retrive all data from customers and orders as seperate results.
-----------------------------------------
SELECT *
FROM customers;
SELECT *
FROM orders;
-- Here we don't have to go and combine them in one big query.