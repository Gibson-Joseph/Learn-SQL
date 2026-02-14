-- Use Case: Optimize Performance.
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46079887#overview
/*
 Where it makes snese to use CTAS?
 -- If you have a scenario where your VIEWS are very slow, you have to go and prepare the data at night using the CTAS and prepare the tables to be analyzed from the end users.
 */
--=========================
-- Create a CTAS table that shows the total number or orders for each month.
--=========================
SELECT TO_CHAR(DATE_TRUNC('month', orderdate)::DATE, 'month') order_month,
    COUNT(orderid) total_order
FROM sales.orders
GROUP BY DATE_TRUNC('month', orderdate);
--
-- CREATE CTA TABLE
CREATE TABLE sales.monthly_orders AS(
    SELECT TO_CHAR(DATE_TRUNC('month', orderdate)::DATE, 'month') order_month,
        COUNT(orderid) total_order
    FROM sales.orders
    GROUP BY DATE_TRUNC('month', orderdate)
);
-- OUTPUT: SELECT 3 --> We wil not see here the result of the query. we're going to get here like 3 rows affected. Because this is DDL statement, it is not anymore query, and the database is telling us I have create now a table with 3 rows.
SELECT *
FROM sales.monthly_orders;
--  order_month | total_order
-- -------------+-------------
--  february    |           4
--  january     |           4
--  march       |           2
-- (3 rows)
--
-- So as you can see SQL is defining the structure of the table based on the result of our query. And of course the data inside hte table comes as well from the query. And the result of this table can stay like this as long as you don't change anything. So if you go and close this and open it after one year, it's going to show exact same results. So it's going to live in the database as loing as you don't drop this table. But if things change in the talbe orders, this table will not be udpated automatcially like we have learned in the VIEWs.
-- If you want to drop this table.
DROP TABLE sales.monthly_orders;
-- OUTPUT: DROP TABLE
--
-- How to Refresh CTAS?
-- Well we have to go and drop it first and then recreate it. And if you want to put everything in one statement we have to go and use TSQL is Transcat-sql. It's like extension where you can do some programming inisde SQL.
-- 
-- ONLY FOR SQL SERVER
IF OBJECT_ID('sales.monthly_orders', 'U') IS NOT NULL DROP TABLE sales.monthly_orders;
GO CREATE TABLE sales.monthly_orders AS(
        SELECT TO_CHAR(DATE_TRUNC('month', orderdate)::DATE, 'month') order_month,
            COUNT(orderid) total_order
        FROM sales.orders
        GROUP BY DATE_TRUNC('month', orderdate)
    );
--
-- FOR POSTGRESQL SERVER
DROP TABLE IF EXISTS sales.monthly_orders;
CREATE TABLE sales.monthly_orders AS(
    SELECT TO_CHAR(DATE_TRUNC('month', orderdate)::DATE, 'month') order_month,
        COUNT(orderid) total_order
    FROM sales.orders
    GROUP BY DATE_TRUNC('month', orderdate)
);
-- So if you keep executing this you are just refresing the content of this table.