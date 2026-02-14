-- TEMP Syntax and Example
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46108779#overview
/*
 So let's see how we can create a temporary table. So the syntax is very simple, we just need to add the keyword TEMP or TEMPORARY after the CREATE TABLE. So we can write it like this:
 
 CREATE TEMPORARY TABLE temp_table_name AS
 (
 SELECT column1, column2, column3, ...
 FROM existing_table_name
 WHERE condition
 );
 
 -- So once you create this table, this table is going to be available for you only in the current session. So if you close this session and open a new one, you will not find this table anymore. So it's like a temporary table that is created for you in your session, and once you close it, it's going to be dropped automatically.
 
 */
--==================================
-- Do few modifications on the table orders, but won't do it directly at the table orders, and take a copy from the sales db and create from it a temporary table.
--==================================
SELECT *
FROM sales.orders;
--
CREATE TEMPORARY TABLE orders AS(
SELECT *
FROM sales.orders
);
-- OUTPUT: SELECT 10 -->> 10 rows are affected.
--
-- salesdb=# \dt+
--   Schema   |  Name  | Type  |  Owner   | Persistence | Access method | Size  | Description
-- -----------+--------+-------+----------+-------------+---------------+-------+-------------
--  pg_temp_4 | orders | table | postgres | temporary   | heap          | 16 kB |
-- (1 row)
-- You can see the presistence as temporary
--
SELECT * FROM orders;
--
DELETE FROM orders WHERE orderstatus = 'Delivered';
-- OUTPUT: DELETE 5
--
SELECT * FROM orders;
SELECT *
FROM sales.orders;
--
--
-- And now we can do whatever we want to this copy. We can analyze it, We can modify it, We can go and insert a new data so we can do whatever manipulation we want on this copy.
--
-- And now if you say, I like these temp table results, And I would like to have it not only during the session, maybe I'm going to need it for tomorrow or something, so now what we're going to do, we're going to do the exact opposite. We're going to store the result of that TEMP or TEMPORARY table back to our database, so that we don't lose this intermedaite result. 
SELECT * INTO sales.orderstest
FROM orders;
-- OUTPUT: SELECT 5
SELECT *
from sales.orderstest;
-- salesdb=# \dt+ sales.orderstest
--                                      List of relations
--  Schema |    Name    | Type  |  Owner   | Persistence | Access method | Size  | Description
-- --------+------------+-------+----------+-------------+---------------+-------+-------------
--  sales  | orderstest | table | postgres | permanent   | heap          | 16 kB |
--
-- You can see the presistence as permanent
--
-- After restart the postgresql server
-- To restart
-- $ sudo systemctl restart postgresql
SELECT *
FROM orders;
-- ERROR:  relation "orders" does not exist
-- LINE 2: FROM orders;
-- 
-- So as you can see, once you close the session everything going to get lost.