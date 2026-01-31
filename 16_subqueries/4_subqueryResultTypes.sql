-- Subquery results types.
/*
 We have different types of subqueires based on the results. So this means the amount of data that the subquery can return.
 
 Restult types:
 1. Scalar subquery - It's return only one single value.
 2. Row subquery - It's returns multiple rows and a single column.
 3. Table subquery - It's returns multiple rows and as well multiple columns like any regular tables.
 */
-- Scalar subquery
-- So it has only one row and only one column
SELECT AVG(sales)
FROM sales.orders;
--          avg
-- ---------------------
--  38.0000000000000000
-- (1 row)
--
--
-- Row subquery
-- So it has a single column and as well multiple rows.
SELECT customerid
FROM sales.orders;
--  customerid
-- ------------
--           2
--           3
--           1
--           1
--           2
--           3
--           1
--           4
--           2
--           3
-- (10 rows)
--
--
-- Table subquery
--
--
SELECT *
FROM sales.customers;
--  customerid | firstname | lastname | country | score
-- ------------+-----------+----------+---------+-------
--           1 | Jossef    | Goldberg | Germany |   350
--           2 | Kevin     | Brown    | USA     |   900
--           3 | Mary      |          | USA     |   750
--           4 | Mark      | Schwarz  | Germany |   500
--           5 | Anna      | Adams    | USA     |
-- (5 rows)
-- We got here multiple rows and as well multiple columns.
SELECT orderid,
    orderdate
FROM sales.orders;
--  orderid | orderdate
-- ---------+------------
--        1 | 2025-01-01
--        2 | 2025-01-05
--        3 | 2025-01-10
--        4 | 2025-01-20
--        5 | 2025-02-01
--        6 | 2025-02-05
--        7 | 2025-02-15
--        8 | 2025-02-18
--        9 | 2025-03-10
--       10 | 2025-03-15
-- (10 rows)
-- In the output we have multiple colums and multiple rows. That's why this kind of query is as well a table query.