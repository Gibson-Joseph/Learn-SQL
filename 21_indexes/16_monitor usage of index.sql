-- Monitor Usage:
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46725925#overview
/*
 --  Over the time the indexes get fragmented, outdated, unused and this can lead to a poor performance in your queries and as well can increase the storage costs.
 --  And the overall performance of your database cannot drop down.
 --  So indexs like having a car, it needs maintenance. So you need to change the oil and the tire of the car, And the same thing goes for the indexes. You have to maintain them, they need attention to keep everything running smoothly
 --
 
 INDEX Monagement & Monitoring:
 ==============================
 -
 -
 Monitor Index Usage:
 ==============================
 -- The first question we have to ask ourselves over the time are we using really the indexes that you have created? Are the really helping improving the speed of my queries, or was it just a good idea at the start of the project and later no one use those indexes. 
 -- This is very crucial becuase if you are having an unused index, you are consuming unnecessar storage space and as well, the write performance in the tables can slow, which is completely unnecessary if you are not using the index.
 -- So now our task is to find out the usage of each index that we have in the projects.
 
 */
--
-- List all indexes on a specific table:
-- ========================================
--  salesdb=# \d sales.dbcustomers
--                       Table "sales.dbcustomers"
--    Column   |         Type          | Collation | Nullable | Default
-- ------------+-----------------------+-----------+----------+---------
--  customerid | integer               |           |          |
--  firstname  | character varying(50) |           |          |
--  lastname   | character varying(50) |           |          |
--  country    | character varying(50) |           |          |
--  score      | integer               |           |          |
-- Indexes:
--     "idx_dbcustomers_countryscore" btree (country, score)
--     "idx_dbcustomers_customerid" btree (customerid) CLUSTER
--     "idx_dbcustomers_firstname" btree (firstname)
--     "idx_dbcustomers_lastname" btree (lastname)
--
-- Check Index Usage:
-- ==========================
-- List all indexes
--=======
-- SELECT 
--     schemaname,
--     tablename,
--     indexname,
--     indexdef
-- FROM pg_indexes;
--
-- Check index usage (IMPORTANT)
--=======
-- SELECT 
--     relname AS table_name,
--     indexrelname AS index_name,
--     idx_scan
-- FROM pg_stat_user_indexes;
--
-- Join with table stats (advanced)
--=======
-- SELECT 
--     t.relname AS table_name,
--     i.relname AS index_name,
--     s.idx_scan,
--     s.idx_tup_read,
--     s.idx_tup_fetch
-- FROM pg_class t
-- JOIN pg_index ix ON t.oid = ix.indrelid
-- JOIN pg_class i ON i.oid = ix.indexrelid
-- JOIN pg_stat_user_indexes s ON s.indexrelid = i.oid
-- WHERE t.relkind = 'r';