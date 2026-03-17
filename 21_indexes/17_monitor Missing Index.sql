-- Monitor Missing Indexes
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46725937?start=15#overview
/*
 Identifying a missing index is as well very imporrant to imporove the prformance.
 So in SQL server you can get recommendations from the dataabase itself about missing indexes for your query.
 
 In PostgreSQL, there isn’t a direct built-in feature like SQL Server’s “missing index DMVs” (e.g., sys.dm_db_missing_index_*). PostgreSQL does not automatically suggest missing indexes.
 
 Use EXPLAIN / EXPLAIN ANALYZE
 -- Seq Scan → ❌ No index used (potential missing index)
 -- Index Scan → ✅ Index is used
 */
EXPLAIN ANALYZE
SELECT *
FROM sales.orders
WHERE customerid = 10;
--
-- salesdb=# EXPLAIN ANALYZE
-- SELECT *
-- FROM sales.orders
-- WHERE customerid = 10;
--                                              QUERY PLAN
-- ----------------------------------------------------------------------------------------------------
--  Seq Scan on orders  (cost=0.00..10.75 rows=1 width=1190) (actual time=0.410..0.411 rows=0 loops=1)
--    Filter: (customerid = 10)
--    Rows Removed by Filter: 10
--  Planning Time: 8.221 ms
--  Execution Time: 0.437 ms
-- (5 rows)
--

/*
 Even though no index is used, this is actually OK in your case 👇
 Reason:
 -- Table is very small (only 10 rows)
 -- Sequential scan is faster than using an index
 
 PostgreSQL optimizer is smart:
 “Why use index when scanning 10 rows is cheaper?”
 */
--
-- Force index usage (to test stats)
SET enable_seqscan = OFF;
-- (Only for learning — never in production.)
--
EXPLAIN ANALYZE
SELECT *
FROM sales.dbcustomers
WHERE customerid = 1;
--                                                                 QUERY PLAN
-- ------------------------------------------------------------------------------------------------------------------------------------------
--  Index Scan using idx_dbcustomers_customerid on dbcustomers  (cost=0.13..8.15 rows=1 width=362) (actual time=0.018..0.020 rows=1 loops=1)
--    Index Cond: (customerid = 1)
--  Planning Time: 0.100 ms
--  Execution Time: 0.043 ms
-- (4 rows)
-- salesdb=#
--
--===============================
-- Check Table Scan vs Index Usage Stats
SELECT relname AS table_name,
    seq_scan,
    idx_scan
FROM pg_stat_user_tables
ORDER BY seq_scan DESC;
--   table_name   | seq_scan | idx_scan
-- ---------------+----------+----------
--  dbcustomers   |       29 |        2
--  customers     |        9 |        0
--  orders        |        4 |        0
--  products      |        3 |        0
--  employees     |        0 |        0
--  ordersarchive |        0 |
-- (6 rows)
-- salesdb=#
--

/*
 When will index be used?
 Index becomes useful when:
 --  Table has large number of rows (1000s / millions)
 --  Query filters small subset of data
 *
 /