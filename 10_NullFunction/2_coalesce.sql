-- COLALESCE
/*
 Returns the "first non-null" value from a list
 
 SYNTAX
 ------
 COALESCE(value1, value2, value3, value4, ...)
 COALESCE is slower than ISNULL
 
 It accepts like a list of many values. So we are creating here a list of values to be checked.
 
 EXAMPLE
 COALESCE(shipping_address, 'unknown') - Here unkonw is a default value.
 COALESCE(shipping_address, billing_address)
 COALESCE(shipping_address, billing_address, 'unknown')
 */
-- 1. HANDLE THE NULL BEFORE DOING DATA AGGREGATIONS.
SELECT ROUND(AVG(score)) AS average_score -- wrong avg score; becase we haven't handle the NULL score in here. Postgres automatically skip the NULL value.
from sales.customers;
--==================================
--Find the average scores of the customers.
--==================================
-- 
SELECT customerid,
    score,
    COALESCE(score, 0) AS score2,
    AVG(score) OVER () avg_scores,
    -- Wrong avg score, because we haven't handle the NULL score here. Postgres automatically skip the NULL value.
    AVG(COALESCE(score, 0)) OVER() avg_scores2 -- Correct avg score
FROM sales.customers;
-- 
-- 2. HANDLE THE NULLS BEFORE DOING MATHEMATICAL OPERATIONS.
--==================================
-- Display the full name of customers in a single filed
-- By merging their first and last names,
-- and add 10 bonus points to each customer's score.
--==================================
-- In Postgres Use || (string concatenation operator)
--- Wrong full name query
SELECT customerid,
    firstname,
    lastname,
    firstname || ' ' || lastname AS full_name,
    score
from sales.customers;
-- correct full name query
SELECT customerid,
    firstname,
    lastname,
    firstname || ' ' || COALESCE(lastname, '') AS fullname,
    score
FROM sales.customers;
-- wrong score with bonus query
SELECT customerid,
    firstname,
    lastname,
    firstname || ' ' || COALESCE(lastname, '') AS fullname,
    score,
    score + 10 AS score_with_bonus
FROM sales.customers;
-- correct score with bonus query
SELECT customerid,
    firstname,
    lastname,
    firstname || ' ' || COALESCE(lastname, '') AS fullname,
    score,
    COALESCE(score, 0) + 10 AS score_with_bonus
FROM sales.customers;
-- 3. HANDLE THE NULL BEFORE JOINING THE TABLES.
-- EXAMPLE
SELECT a.year,
    a.type,
    a.orders,
    b.sales
FROM Table1 a
    JOIN Table2 b ON a.year = b.year
    AND COALESCE(a.type, '') = COALESCE(b.type, '');
-- If we forgot to handle the NULL, sql will skip the row even though the both value is NULL. If you find NULLS, go immediately and handle it so you don't lose any records in the results and you get accurate analysis.
---
-- 4. HANLDE THE NULL BEFORE SORTING DATA.
-- So Imagine we have the following sales 15, 25, and NULL. Now if you go and sort the data by the sales ascending from the lowest to the highest, what can happen, sql going to show the NULLS at the starts. And that is not because the NULL is the lowest value, because NULL has no value. So SQL place it at the start, and then below it we're going to have the lowest value. NULL -> 15 -> 25.
-- Now if you are doing the exact opposite where you are sorting the data from the highest to the lowest using descending. So what can happen, SQL going to sort it like this, 25 -> 15 -> NULL. And that is again not because NULLS are the lowest value, it has no values, but SQL do it like this. So this is how SQL deals with the NULLS if you are sorting the data.
--================
-- SQL TASKS
-- Sort the customes from lowest to highest scores, with NULLs appearing last.
--================
-- BUT in POSTGRESQL its working fine default behavior
SELECT customerid,
    score
from sales.customers
ORDER BY score;
-- ORDER BY column ASC -->> NULLs come LAST in PostgreSQL
--- 
-- But in SQL server:
SELECT customerid,
    score
FROM sales.customers
ORDER BY CASE
        WHEN score is NULL THEN 1
        ELSE 0
    END,
    score;