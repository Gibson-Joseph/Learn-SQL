-- Window Frame
/*
 REF: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/43406008?start=30#overview
 
 A window frame defines which rows are used for a calculation for the current row inside a window function.
 
 SYNTAX:
 <window_function>() OVER ( PARTITION BY ...  ORDER BY ...  <WINDOW FRAME>)
 
 AVG(sales) OVER ( PARTITION BY category ORDER BY order_date ROWS UNBOUNDED PRECEDING)
 
 ROWS UNBOUNDED PRECEDING -->> FRAME Cluase (Define a subset of rows in a window) 
 
 Using the window frame, we define a subset of rows within each window that is relevent for the calculation.
 
 Frame Types:
 1. ROWS
 2. RANGE
 
 Frame Boundary: (Lower Value)
 1. CURRENT ROW - Current row
 2. N PRECEDING - n rows before
 3. UNBOUNDED PRECEDING - From first row
 
 Frame Boundary: (Higher Value)
 1. CURRENT ROW - Current row
 2. N FOLLOWING - n rows after
 3. UNBOUNDED FOLLOWING - Till last row
 
 Example:
 AVG(sales) OVER (PARTITION BY category ORDER BY order_date ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) 
 
 So as you can see, we are defining like boundary or a range from low value to high value.
 
 RULES:
 1. We can't use the frame cluase without ORDER BY, so ORDER BY must be exist in the definition in order to use frame cluase.
 2. Lower boundary must be before the higher boundary. So always we start with lower boundary and we end up having the higher boundary. You can't switch that.
 */
SELECT orderid,
    orderdate,
    orderstatus,
    sales,
    SUM(sales) OVER (
        PARTITION BY orderstatus
        ORDER BY orderdate ROWS BETWEEN CURRENT ROW
            AND 2 FOLLOWING
    ) total_sales
from sales.orders;
--  orderid | orderdate  | orderstatus | sales | total_sales
-- ---------+------------+-------------+-------+-------------
--        1 | 2025-01-01 | Delivered   |    10 |          55
--        3 | 2025-01-10 | Delivered   |    20 |          95
--        5 | 2025-02-01 | Delivered   |    25 |         105
--        6 | 2025-02-05 | Delivered   |    50 |          80
--        7 | 2025-02-15 | Delivered   |    30 |          30
--        2 | 2025-01-05 | Shipped     |    15 |         165
--        4 | 2025-01-20 | Shipped     |    60 |         170
--        8 | 2025-02-18 | Shipped     |    90 |         170
--        9 | 2025-03-10 | Shipped     |    20 |          80
--       10 | 2025-03-15 | Shipped     |    60 |          60
-- (10 rows)
-- NOTE: The frame be caluculated within one window. So it won't consider anything outside of that window.
SELECT orderid,
    orderdate,
    orderstatus,
    sales,
    SUM(sales) OVER (
        PARTITION BY orderstatus
        ORDER BY orderdate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) total_sales
from sales.orders;
--  orderid | orderdate  | orderstatus | sales | total_sales
-- ---------+------------+-------------+-------+-------------
--        1 | 2025-01-01 | Delivered   |    10 |          10
--        3 | 2025-01-10 | Delivered   |    20 |          30
--        5 | 2025-02-01 | Delivered   |    25 |          55
--        6 | 2025-02-05 | Delivered   |    50 |          95
--        7 | 2025-02-15 | Delivered   |    30 |         105
--        2 | 2025-01-05 | Shipped     |    15 |          15
--        4 | 2025-01-20 | Shipped     |    60 |          75
--        8 | 2025-02-18 | Shipped     |    90 |         165
--        9 | 2025-03-10 | Shipped     |    20 |         170
--       10 | 2025-03-15 | Shipped     |    60 |         170
-- (10 rows)
--
--
/*
 COMPACT FRAME.
 We can use shortcuts but we can use them only with the PRECEDING.
 
 NORMAL FORM : ROWS BETWEEN CURRENT ROW n FOLLOWING
 SHORT FORM  : ROWS 2 FOLLOWING
 */
--  Example 1
SELECT orderid,
    orderdate,
    orderstatus,
    sales,
    SUM(sales) OVER (
        PARTITION BY orderstatus
        ORDER BY orderdate ROWS 2 PRECEDING
    ) total_sales
from sales.orders;
--  Example 2
SELECT orderid,
    orderdate,
    orderstatus,
    sales,
    SUM(sales) OVER (
        PARTITION BY orderstatus
        ORDER BY orderdate ROWS UNBOUNDED PRECEDING
    ) total_sales
from sales.orders;
--
--
-- NOTE: DEFAULT FRAME: SQL uses Default frame, if ORDER BY is used without FRAME
-- Default Frame: UNBOUNDED PRECEDING AND CURRENT ROW
SELECT orderid,
    orderdate,
    orderstatus,
    sales,
    SUM(sales) OVER (
        PARTITION BY orderstatus
        ORDER BY orderdate
    ) total_sales
from sales.orders;
--  orderid | orderdate  | orderstatus | sales | total_sales
-- ---------+------------+-------------+-------+-------------
--        1 | 2025-01-01 | Delivered   |    10 |          10
--        3 | 2025-01-10 | Delivered   |    20 |          30
--        5 | 2025-02-01 | Delivered   |    25 |          55
--        6 | 2025-02-05 | Delivered   |    50 |         105
--        7 | 2025-02-15 | Delivered   |    30 |         135
--        2 | 2025-01-05 | Shipped     |    15 |          15
--        4 | 2025-01-20 | Shipped     |    60 |          75
--        8 | 2025-02-18 | Shipped     |    90 |         165
--        9 | 2025-03-10 | Shipped     |    20 |         185
--       10 | 2025-03-15 | Shipped     |    60 |         245
-- (10 rows)
SELECT orderid,
    orderdate,
    orderstatus,
    sales,
    SUM(sales) OVER (
        PARTITION BY orderstatus
        ORDER BY orderdate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) total_sales
from sales.orders;
-- NOTE: ORDER BY always uses default FRAME. So be carefull when you use ORDER BY with the aggregate functions, there will be hidden frame or default frame like this between the unbounded precedding and the current row.