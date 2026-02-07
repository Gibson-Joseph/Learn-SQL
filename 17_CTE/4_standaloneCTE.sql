-- Standalone CTE
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/45843987#overview
/*
 It is a CTE query that is defined and used independently in the query. So this means it is self-contained and it doesn't depend on anything. It doesn't depend on any other CTE or queries.
 
 So that means we can run the standalone query independently from anyting inside our query. 
 
 CTE query first need to be executed, Then the main query can be executed.
 
 Now in order to put inside a CTE we can go and use the WITH clause.
 
 SYNTAX:
 -->> CTE Query
 WITH CTE-Name AS
 (
 SELECT ...
 FROM ...
 WHERE ...
 )
 
 -->> Main Query
 SELECT ...
 FROM CTE-Name
 WHERE ...
 */
--=========================================
-- Find the total sales per customer.
--=========================================
WITH CTE_total_sales AS (
    -- CTE Query
    SELECT customerid,
        SUM(sales) AS total_sales
    FROM sales.orders
    GROUP BY customerid
) -- Main Query
SELECT c.customerid,
    c.firstname,
    c.lastname,
    cts.total_sales
FROM sales.customers c
    LEFT JOIN CTE_total_sales cts ON c.customerid = cts.customerid;
-- Now of course in the CTE you can use any kind of clauses like SELECT, FROM, JOIN, GROUP BY, HAVING everything that you want Window Functions, all aggregate function, but there is only one restriction. You cannot go and use the ORDER BY cluase, so you cannot sort the in the CTE.
-- CTE-RULE: You cannot use ORDER BY directly within the CTE.