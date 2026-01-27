-- Window Functions Rules (4x rules)
/*
 1. Window functions can be used only in SELECT and ORDER BY Clauses. 
 2. Nesting window functions is not allowed!
 3. SQL execute WINDOW Functions after WHERE Clause.
 4. Window function can be used together with GROUP BY. And in the same query, ONLY if the same columns are used
 */
--   1. Window functions can be used only in SELECT and ORDER BY Clauses. So window function can't used to filter the data.
SELECT orderid,
    orderdate,
    orderstatus,
    sales,
    SUM(sales) OVER (PARTITION BY orderstatus) AS total_sales
from sales.orders
ORDER BY SUM(sales) OVER (PARTITION BY orderstatus) DESC;
--
-- 2.Nesting window functions is not allowed !
SELECT orderid,
    orderdate,
    orderstatus,
    sales,
    SUM(SUM(sales) OVER (PARTITION BY orderstatus)) OVER (PARTITION BY orderstatus) AS total_sales
from sales.orders;
-- ERROR:  window function calls cannot be nested
-- LINE 5:     SUM(SUM(sales) OVER (PARTITION BY orderstatus)) OVER (PA...
--
-- 3. SQL execute WINDOW Functions after WHERE Clause.
-- TASK: Find the total sales for each order status, only for two products 101 and 102.
SELECT orderid,
    orderdate,
    orderstatus,
    sales,
    SUM(sales) OVER(PARTITION BY orderstatus) AS total_sales
FROM sales.orders
WHERE productid IN (101, 102);
--      orderid | orderdate  | orderstatus | sales | total_sales
-- ---------+------------+-------------+-------+-------------
--        7 | 2025-02-15 | Delivered   |    30 |          60
--        3 | 2025-01-10 | Delivered   |    20 |          60
--        1 | 2025-01-01 | Delivered   |    10 |          60
--       10 | 2025-03-15 | Shipped     |    60 |         185
--        8 | 2025-02-18 | Shipped     |    90 |         185
--        2 | 2025-01-05 | Shipped     |    15 |         185
--        9 | 2025-03-10 | Shipped     |    20 |         185
-- (7 rows)
--
--
-- 4. Window function can be used together with GROUP BY. And in the same query, ONLY if the same columns are used
-- TASK: Rank Customer based on their total sales.
SELECT customerid,
    SUM(sales) total_sales,
    RANK() OVER (
        ORDER BY SUM(sales) DESC
    ) AS rank
from sales.orders
GROUP BY customerid;
--  customerid | total_sales | rank
-- ------------+-------------+------
--           3 |         125 |    1
--           1 |         110 |    2
--           4 |          90 |    3
--           2 |          55 |    4
-- (4 rows)
-- As you can see, SQL allows us to use window function together with the GROUP BY but only with one rule. Anything that you are using inside the window funciton should be part of the group by. So for example, we fulfill the rule because we are using the SUM() of the sales in the part of the GROUP BY and window function.
--
-- Here we have broke the 4th rule.
SELECT customerid,
    SUM(sales) total_sales,
    RANK() OVER (
        ORDER BY sales DESC
    ) AS rank
from sales.orders
GROUP BY customerid;
-- ERROR:  column "orders.sales" must appear in the GROUP BY clause or be used in an aggregate function
-- LINE 4:         ORDER BY sales DESC
--
-- The following query will work. Because, here the customerID is part of the GROUP BY.
SELECT customerid,
    SUM(sales) total_sales,
    RANK() OVER (
        ORDER BY customerid DESC
    ) AS rank
from sales.orders
GROUP BY customerid;