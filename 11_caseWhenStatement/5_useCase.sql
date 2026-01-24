--==========================
-- Use Case: Handling Nulls
--==========================
/*
 Replace NULLs with a specifi value.
 Sometimes NULLs can lead to inaccurate results, which can lead to wrong decision-making.
 */
--==========================
-- Task
-- Find the average scores of customers and tread NULLs as 0
-- And additional provide details such customerID * LastName
--==========================
-- This is wrong queyr, becuase we have NULL in the score
SELECT customerid,
    lastname,
    score,
    AVG(score) OVER() avg
from sales.customers;
--

SELECT customerid,
    lastname,
    score,
    CASE
        WHEN score is NULL THEN 0
        ELSE score
    END score_clean,
    AVG(
        CASE
            WHEN score is NULL THEN 0
            ELSE score
        END
    ) OVER () avg_clean,
    AVG(score) OVER() avg
from sales.customers;
--
--==========================
-- Use Case: CONDTITIONAL AGGREGATION
-- Apply aggregate functions only on subsets of data that fullfil certain conditions.
-- Conditional aggregations means we can go and apply an aggregate functions in SQL like SUM, AVG, COUNT but this time only on a subset of data that meet specific contitions.
--==========================
--==========================
-- TASK
-- Count how many times each customer has made an order with sales greater than 30.
--==========================
SELECT customerid,
    SUM(
        -- Contional aggregation.
        CASE
            WHEN sales > 30 THEN 1
            ELSE 0
        END
    ) AS total_orders_above_30,
    COUNT(*) AS total_orders -- Normal aggregation
from sales.orders
GROUP BY customerid;