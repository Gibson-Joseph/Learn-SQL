-- IS NULL & IS NOT NULL
--
-- These are predicates, not functions.
-- They are the only correct way to check for NULL in SQL.
-----
/*
 IS NULL
 Return TRUE if the value IS NULL, otherwise it returns the FALSE.
 
 SYNTAX
 value IS NULL
 */
/*
 IS NOT NULL
 IS NOT NULL Returns TRUE if the value IS NOT NULL, otherwise it return the FALSE.
 
 SYNTAX
 value IS NOT NULL
 */
--====================================
-- TASKS
-- Identify the customers who have no scores.
--====================================
SELECT *
from sales.customers
WHERE score is NULL;
--====================================
-- List all customers who have scores.
--====================================
SELECT *
from sales.customers
WHERE score is NOT NULL;
--====================================
-- List all details for customers who have not placed any orders.
--====================================
SELECT *
from sales.customers;
SELECT *
from sales.orders;
--
SELECT c.*, o.orderid
from sales.customers c
    LEFT JOIN sales.orders o ON c.customerid = o.customerid
WHERE o.customerid IS NULL;