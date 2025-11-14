-- Logical Operators
-- We can combine multiple condition using the logical operator
-- ============================
-- AND
-- All condition must be TRUE in the WHERE clause
-- ============================
-- <condition1> AND <condition2> ==> Both are TRUE in order to keep the row in the results.
-- country = 'USA' AND score > 500
-- ============================
-- Retrive all customers who are from teh USA AND have a score greater than 500
-- ============================
SELECT *
FROM customers
WHERE country = 'USA'
    AND score > 500;
-- ============================
-- OR 
-- At least one condition msut be TRUE
-- ============================
-- <condition1> OR <condition2> ==> At least one are TRUE in order to keep the row in the results.
-- country = 'USA' OR score > 500
-- ============================
-- Retrive all customers who are either from the USA OR have a score greater than 500
-- ============================
SELECT *
FROM customers
WHERE country = 'USA'
    OR score > 500;
-- ============================
-- NOT 
-- (Reverse) Excludes matching values
-- Its is a reverse operator. It's going to go and exlude the matching values.
-- This operator will not go and combine two conditions. So you can use it with only one condtion.
-- The NOT operator going to make the TRUE FALSE and the FALSE TRUE
-- ============================
-- ============================
-- NOT <condition1>  ==> Exclude matching rows
-- NOT country = 'USA'
-- ============================
-- ============================
-- Retrive all customers with a score NOT less than 500
-- ============================
SELECT *
FROM customers
WHERE NOT score < 500;