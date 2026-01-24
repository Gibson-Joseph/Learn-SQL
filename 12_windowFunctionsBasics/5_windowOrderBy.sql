-- Window Order By
/*
 So the ORDER clause is very important in order to sort your data within a WINDOW. (Ascending | Descending)
 So the ORDER BY is very important as well for many functions.
 
 ORDER BY is optional in Aggregate functions, So you could leave it or add it. But for the Rank functions as well as the Value functions they are a must. So if you want to use those functions you must use the ORDER BY Clause, because it makes no sense For example, if you are Ranking the dta without sorting your data first.
 */
--=====================================
-- Rank each order based on their sales from highest to lowest
-- Additionaly provide details such order ID, order date.
--=====================================
--  What is RANK()?
-- RANK() is a window function that assigns a rank to each row within a partition, based on a specified order.
SELECT orderid,
    orderdate,
    sales,
    RANK() OVER(
        ORDER BY sales DESC
    ) sales_rank
from sales.orders;
/*
 orderid | orderdate  | sales | sales_rank
 ---------+------------+-------+------------
 8 | 2025-02-18 |    90 |          1
 4 | 2025-01-20 |    60 |          2
 10| 2025-03-15 |    60 |          2
 6 | 2025-02-05 |    50 |          4
 7 | 2025-02-15 |    30 |          5
 5 | 2025-02-01 |    25 |          6
 3 | 2025-01-10 |    20 |          7
 9 | 2025-03-10 |    20 |          7
 2 | 2025-01-05 |    15 |          9
 1 | 2025-01-01 |    10 |         10
 (10 rows)
 */
--
--  Default Sorting: As default ORDER BY sorts the data in ascending order "ASC"(from lowest to highest)
SELECT orderid,
    orderdate,
    sales,
    RANK() OVER(
        ORDER BY sales
    ) sales_rank
from sales.orders;