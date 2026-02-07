-- Nested CTE
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/45843993#overview
/*
 - It is a CTE inside another CTE. So it's kind of like subqueries, a query inside another query.
 - So not only a main query can use the result of CTE, Another CTE can use the results from a CTE.
 - And of course the nested CTE is like a main query it's depend on other queries. That means you cann't go and select it and run it indepndently from the query. So always you have to run the CTE inside it first before seeing the result of that nested CTE.
 
 SYNTAX:
 -->> CTE Query
 WITH CTE-Name1 AS -->> Standalone CTE. It doesn't depend on anything
 (
 SELECT ...
 FROM ...
 WHERE ...
 )
 , CTE-Name2 AS -->> Nested CTE. It's completely depnd on the first CTE
 (
 SELECT ...
 FROM CTE-Name1
 WHERE ...
 )
 -->> Main Query
 SELECT ...
 FROM CTE-Name2
 WHERE ... 
 */
--================================================
-- Find the total sales per customer.
-- find the last order date per customer.
-- rank customers based on total sales per customer.
-- Segment customers based on their total sales.
--================================================
-- Find the total sales per customer.
WITH CTE_total_sales AS (
    -->> Standalone CTE
    SELECT customerid,
        SUM(sales) AS total_sales
    FROM sales.orders
    GROUP BY customerid
),
-- Find the total sales per customer.
CTE_last_order AS (
    SELECT customerid,
        MAX(orderdate) AS last_order
    FROM sales.orders
    GROUP BY customerid
),
-- Find the total sales per customer. (nested CTE)
CTE_customer_rank AS (
    SELECT customerid,
        RANK() OVER(
            ORDER BY total_sales DESC
        ) customer_rank
    FROM CTE_total_sales
),
-- Segment customers based on their total sales. (nested CTE)
CTE_customer_segments AS (
    SELECT customerid,
        CASE
            WHEN total_sales > 100 THEN 'High'
            WHEN total_sales > 50 THEN 'Medium'
            ELSE 'Low'
        END AS customer_segments
    FROM CTE_total_sales
)
SELECT c.customerid,
    c.firstname,
    c.lastname,
    cts.total_sales,
    clo.last_order,
    ccr.customer_rank,
    ccs.customer_segments
FROM sales.customers c
    LEFT JOIN CTE_total_sales cts ON cts.customerid = c.customerid
    LEFT JOIN CTE_last_order clo ON clo.customerid = c.customerid
    LEFT JOIN CTE_customer_rank ccr ON ccr.customerid = c.customerid
    LEFT JOIN CTE_customer_segments ccs ON ccs.customerid = c.customerid
ORDER BY ccr.customer_rank;
-- Here each block is responsible for one specific problem of whole report. CTE introudces modularity, So each CTE is self-contained and talk about one issue.