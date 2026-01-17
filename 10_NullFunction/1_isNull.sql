-- ISNULL() -> SQL server specific
-- Replaces 'NULL' with a specified value.
/*
 SYNTAX
 ISNULL(value, replacement_value)
 
 Limited to to values one is actual value and the second one is replacement value. 
 ISNULL is faster than COALESCE
 
 ISNULL(shipping_address, 'unknown')
 Here the 'unknown' is a default value.
 
 ISNULL(shipping_address, billing_address)
 */
-- HANDLE THE NULL BEFORE DOING DATA AGGREGATIONS.
--==================================
--Find the average scores of the customers.
--==================================
SELECT ROUND(AVG(score)) AS average_score -- wrong avg score; becase we haven't handle the NULL score in here. Postgres automatically skip the NULL value.
from sales.customers;
-- 
SELECT customerid,
    score,
    COALESCE(score, 0) AS score2,
    AVG(score) OVER () avg_scores,
    -- Wrong avg score, because we haven't handle the NULL score here. Postgres automatically skip the NULL value.
    AVG(COALESCE(score, 0)) OVER() avg_scores2 -- Correct avg score
FROM sales.customers;