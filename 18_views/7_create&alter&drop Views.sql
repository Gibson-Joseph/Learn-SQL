-- CREATE & ALTER & DROP Views
/*
 SYNTAX:
 CREATE VIEW view_name AS
 (
 SELECT ...
 FROM ...
 WHERE ...
 
 )
 */
--=====================================
-- Find the running total of sales for each months
--=====================================
WITH CTE_monthly_summary AS (
    SELECT DATE_TRUNC('month', orderdate) order_month,
        SUM(sales) total_sales,
        COUNT(orderid) total_orders,
        SUM(quantity) total_quantities
    FROM sales.orders
    GROUP BY DATE_TRUNC('month', orderdate)
)
SELECT order_month,
    total_sales,
    total_orders,
    total_quantities,
    SUM(total_sales) OVER(
        ORDER BY order_month
    ) AS running_total
FROM CTE_monthly_summary;
--
-- CREATE VIEW
-- Here our DDL query in order to create the VIEW
CREATE VIEW V_monthly_summary AS(
    SELECT DATE_TRUNC('month', orderdate) order_month,
        SUM(sales) total_sales,
        COUNT(orderid) total_orders,
        SUM(quantity) total_quantities
    FROM sales.orders
    GROUP BY DATE_TRUNC('month', orderdate)
)
/*
 OUTPUT:
 
 CREATE VIEW
 */
-- To query the VIEW
SELECT *
FROM V_monthly_summary;
--         order_month        | total_sales | total_orders | total_quantities
-- ---------------------------+-------------+--------------+------------------
--  2025-02-01 00:00:00+05:30 |         195 |            4 |                8
--  2025-01-01 00:00:00+05:30 |         105 |            4 |                6
--  2025-03-01 00:00:00+05:30 |          80 |            2 |                2
-- (3 rows)
-- Now as you can see, we are getting now the result of the VIEW. And we're accessing now this logic from completely external query. So we can think about VIEW as any other table that we have in the database. 
-- And the big different between the VIEWS and the TABLES, the TABLES has the acutal data and everything there is persisted. But the VIEW is just an abstraction for us. And behind it there is like a query that goes to the table and query the tables in order to present their results.
SELECT order_month,
    total_sales,
    total_orders,
    total_quantities,
    SUM(total_sales) OVER(
        ORDER BY order_month
    ) AS running_total
FROM v_monthly_summary;
-- So this is how we can put your logic in central place using VIEWS.
--
--NOTE: If a TABLE or VIEW is created without specifying a schema, it defaults to the DBO.
--
-- Now in order to put our VIEW in the correct schema we don't want it to be in the defaults, we have to go and specify the schema name in the DDL.
CREATE VIEW sales.V_monthly_summary AS(
    SELECT DATE_TRUNC('month', orderdate) order_month,
        SUM(sales) total_sales,
        COUNT(orderid) total_orders,
        SUM(quantity) total_quantities
    FROM sales.orders
    GROUP BY DATE_TRUNC('month', orderdate)
);
-- CREATE VIEW
SELECT *
FROM sales.v_monthly_summary;
-- So this is how we can assign a VIEW or even a table to the correct schema.
--
-- DELETE VIEW
DROP VIEW v_monthly_summary;
/*
 DROP VIEW
 */
-- After droping the view
SELECT *
from v_monthly_summary;
-- ERROR:  relation "v_monthly_summary" does not exist
-- LINE 2: from v_monthly_summary;
--
-- ALTER VIEW
--
--
CREATE OR REPLACE VIEW sales.V_monthly_summary AS
SELECT DATE_TRUNC('month', orderdate) order_month,
    SUM(sales) total_sales,
    COUNT(orderid) total_orders -- SUM(quantity) total_quantities
FROM sales.orders
GROUP BY DATE_TRUNC('month', orderdate);
-- OR
DROP VIEW IF EXISTS sales.v_monthly_summary;
CREATE VIEW sales.v_monthly_summary AS
SELECT DATE_TRUNC('month', orderdate) AS order_month,
    SUM(sales) AS total_sales,
    COUNT(orderid) AS total_orders
FROM sales.orders
GROUP BY DATE_TRUNC('month', orderdate);
/*
 -- OutPut
 
 DROP VIEW
 CREATE VIEW
 */
-- OR
-- THIS IS FOR SQL Server
IF OBJECT_ID('sales.V_monthly_summary', 'V') IS NOT NULL DROP VIEW sales.V_monthly_summary;
GO CREATE VIEW sales.V_monthly_summary AS(
        SELECT DATE_TRUNC('month', orderdate) order_month,
            SUM(sales) total_sales,
            COUNT(orderid) total_orders -- SUM(quantity) total_quantities
        FROM sales.orders
        GROUP BY DATE_TRUNC('month', orderdate)
    );