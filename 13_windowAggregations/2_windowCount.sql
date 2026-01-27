-- Window COUNT
/*
 It returns the number of rows within a window
 It counts all the rows in table, regardless of whether any value is NULL.
 COUNT(column) - Count the number of non-NULL values in the column.
 We can use COUNT(1) instead of COUNT(*). COUNT(1) equal to COUNT(*)
 It counts the number of values in column, regardless of their data types.
 */
--
--  TASK: Find the total number of orders
SELECT COUNT(1) AS total_orders
FROM sales.orders;
--
--  TASK: Find the total number of orders. Additionaly provide details such as order Id, order date
SELECT orderid,
    orderdate,
    COUNT(*) OVER() AS total_orders
FROM sales.orders;
--
--=======================  
-- Find the total number of orders. 
-- Find the total number orders for each customer. 
-- Additionaly provide details such as order Id, order date
--=======================
SELECT orderid,
    orderdate,
    customerid,
    COUNT(*) OVER() AS total_orders,
    COUNT(*) OVER(PARTITION BY customerid) AS total_order_by_customers
FROM sales.orders;
--=======================  
-- Find the total number of customers. 
-- Find the total number of scores for the customers.
-- Additionaly provide all customer detail.
--=======================
SELECT *,
    COUNT(*) OVER() total_num_customers,
    COUNT(score) OVER() total_num_scores
FROM sales.customers;
--=======================
-- Check whether the table 'orders' contains any dubplicate rows
--=======================
SELECT orderid,
    CASE
        WHEN COUNT(*) OVER(PARTITION BY orderid) > 1 THEN 'Duplicate'
        ELSE 'No Duplicate'
    END AS check_duplicate
from sales.orders;
--=======================
-- Check whether the table 'orders' contains any dubplicate rows
--=======================
SELECT orderid,
    COUNT(*) OVER (PARTITION BY orderid) duplicate_order
FROM sales.ordersarchive;
--=======================
-- Check whether the table 'ordersarchive' contains any dubplicate rows, and return the dubplicate records only
--=======================
SELECT orderid,
    duplicate_order
FROM (
        -- This is subquery
        SELECT orderid,
            COUNT(*) OVER (PARTITION BY orderdate) duplicate_order
        FROM sales.ordersarchive
    ) t
WHERE duplicate_order > 1;