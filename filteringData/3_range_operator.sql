-- Logical Operators
-- ============================
-- BETWEEN 
-- Check if a value is with in a range
-- In order to build a range you need two things. You need lower boundary for the range and you need as well the upper boundary. Once you have two boundries then you have a range and everthing BETWEEN htose two boundaries going to be TRUE and everything outside those boundaries going to be false
-- ============================
-- ============================
-- SYNTAX
-- <Lower Boundary> BETWEEN <Upper Boundary>
-- 100 BETWEEN 500
-- ============================
-- The boundaries are inclusive. So that means if a value is exactly 100 or exactly 500 then it's going to considered as a TRUE.
-- ============================
-- Retrive all customers whose score falls in the range between 100 and 500
-- ============================
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;
-- ============================
-- NOT BETWEEN 
-- ============================
-- Check if a value is outside in a range
SELECT *
FROM customers
WHERE score NOT BETWEEN 100 AND 500;