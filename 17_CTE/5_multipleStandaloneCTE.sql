-- Multiple Standalone CTE
/*
 In multiple standalone CTE, SQL can execute it from the top to the bottom. So the CTE one then two, three and so on. But they have noting to do with each others.
 
 All those CTEs are independent from each others.
 
 Each CTE is self-contained and it could be exectuted on its own without depending on any other results from any other CTE or any other query.
 
 In order to add another CTE to our query, what we're going to do, we're goint to go after the first definition of the CTE, and below it we're going to go and start defining the our second CTE, But this time, as you can see, we are not using WITH clause, we are using the comma. So that means only the first CTE is going to be using the WITH clause, in order to tell SQL we are talking about CTE, all the other CTEs you can separate it using the comma.
 
 SYNTAX:
 -->> CTE Query
 WITH CTE-Name AS
 (
 SELECT ...
 FROM ...
 WHERE ...
 )
 , CTE-Name2 AS
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
--================================================
-- Find the total sales per customer.
-- Find the last order date per customer.
--================================================
WITH CTE_total_sales AS (
    SELECT customerid,
        SUM(sales) AS total_sales
    FROM sales.orders
    GROUP BY customerid
),
-- Multiple standalone CTE
CTE_last_order AS (
    SELECT customerid,
        MAX(orderdate) AS last_order
    FROM sales.orders
    GROUP BY customerid
)
SELECT c.customerid,
    c.firstname,
    c.lastname,
    cts.total_sales,
    clo.last_order
FROM sales.customers c
    LEFT JOIN CTE_total_sales cts ON cts.customerid = c.customerid
    LEFT JOIN CTE_last_order clo ON clo.customerid = c.customerid;
-- If you want to add more CTEs use the comma(,).