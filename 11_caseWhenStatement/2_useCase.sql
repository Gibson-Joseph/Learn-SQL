--==========================
-- Use Case: Categorizing Data
--==========================
/*
 1. Main purpose is Data Transformation
 Drive new information - create new columns based on the existing data
 2. Categorizing data. 
 Group the data into different categories based on certain conditions.
 */
--==========================
-- Task
--==========================
-- Generate a report showing the total sales for each category:
-- HIGH: If the sales higher then 50
-- MEDIUM: IF the sales between 20 and 50
-- LOW: if the sales equal or lower then 20
-- Sort the result from the highest to lowest.
--==========================
SELECT orderid,
    sales,
    CASE
        WHEN sales > 50 THEN 'High'
        WHEN sales BETWEEN 20 AND 50 THEN 'Medium'
        ELSE 'Low'
    END categories
FROM sales.orders
ORDER BY sales DESC;
-- Aggrigate the sales amount too
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