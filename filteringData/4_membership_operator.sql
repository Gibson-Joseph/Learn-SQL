-- Membership Operators
-- Membership operators are used to check whether a value belongs to a group (list, set, or result from a subquery).
-- ============================
--  IN
-- Check if value exists in a list
-- ============================
-- Retrive all customers from either Germany or USA
SELECT *
FROM customers
WHERE country IN ('Germany', 'USA');
----------------------------------------
SELECT *
FROM customers
WHERE country = 'Germany'
    OR country = 'USA';
-- ============================
-- NOT IN
-- Check if value not exists in a list
-- ============================
SELECT *
FROM customers
WHERE country NOT IN ('Germany', 'USA');
-- TIP: Use IN instead of OR for multiple values in same column to simply SQL