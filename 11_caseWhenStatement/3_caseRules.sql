-- CASE Rules
-- There is one rule to follow if you are using case statements, and that is that "data types of the results must be matching".
--===============================================
-- This is wrong qury, because we have returns two different data types in the CASE STATEMENT.
SELECT category,
    SUM(sales) AS total_sales
FROM(
        -- Inner query (subquery)
        SELECT orderid,
            sales,
            CASE
                WHEN sales > 50 THEN 'High'
                WHEN sales BETWEEN 20 AND 50 THEN 2
                ELSE 'Low' -- ELSE 1
            END category
        FROM sales.orders
    ) t
GROUP BY category
ORDER BY total_sales DESC;
/*
 ERROR:  invalid input syntax for type integer: "Low"
 LINE 10:                 ELSE 'Low'
 */
--===============================================
-- This is correct query:
SELECT category,
    SUM(sales) AS total_sales
FROM(
        -- Inner query (subquery)
        SELECT orderid,
            sales,
            CASE
                WHEN sales > 50 THEN 'High'
                WHEN sales BETWEEN 20 AND 50 THEN 'Medium'
                ELSE 'Low'
            END category
        FROM sales.orders
    ) t
GROUP BY category
ORDER BY total_sales DESC;
--===============================================
-- CASE Statement can be used anywhere in the query. So there are no restrictions and we have only this one rule.