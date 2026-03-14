-- How to create Index.
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46603367#overview
/*
 Syntax:
 CREATE [CLUSTERED | NONCLUSTERED] INDEX index_name ON table_name (colunn1, column2, ...)
 
 If you don't define anything[CLUSTERED | NONCLUSTERED] the default can be non clustered.
 CREATE INDEX index_name ON table_name (colunn1, column2, ...)
 
 Example:
 CREATE CLUSTERED INDEX IX_customer_id ON customer (id) 
 CREATE NONCLUSTERED INDEX IX_customer_city ON customer (city) 
 */
--  Where can if find out the indexes in the databases?
-- salesdb=# \d sales.customers;
--                        Table "sales.customers"
--    Column   |         Type          | Collation | Nullable | Default
-- ------------+-----------------------+-----------+----------+---------
--  customerid | integer               |           | not null |
--  firstname  | character varying(50) |           |          |
--  lastname   | character varying(50) |           |          |
--  country    | character varying(50) |           |          |
--  score      | integer               |           |          |
-- Indexes:
--     "customers_pkey" PRIMARY KEY, btree (customerid)
-- 
-- In SQL server, if you define any of the columns as a primary Key, the SQL server is going to go by default, creating a clustered index for primary key, becuase it makes alwasy sense to create a clustered index on the primary key. 
-- ======================
-- We are going to create a new table without any indexes. We are going to go and load table customers into a new table.
SELECT * INTO sales.dbcustomers
FROM sales.customers;
-- salesdb=# SELECT * INTO sales.dbcustomers
-- FROM sales.customers;
-- SELECT 5
-- salesdb=# \d sales.dbcustomers
--                       Table "sales.dbcustomers"
--    Column   |         Type          | Collation | Nullable | Default
-- ------------+-----------------------+-----------+----------+---------
--  customerid | integer               |           |          |
--  firstname  | character varying(50) |           |          |
--  lastname   | character varying(50) |           |          |
--  country    | character varying(50) |           |          |
--  score      | integer               |           |          |
-- salesdb=#
-- So we don't have anything no clustered index or anything else. And this table has the structure of heep structure. So the data are inserted there randomly and it is not sorted.
-- ======================
-- Create Clustered index:
-- FOR SQL SERVER
CREATE INDEX idx_dbcustomers_customerid ON sales.dbcustomers (customerid);
--=================
-- FOR POSTGRESQL SERVER:
-- Create an Clustered Index: First, you must have a standard (non-clustered) index on the table that you want to use for the physical ordering.
-- Step 1 — Create the Index
CREATE INDEX idx_dbcustomers_customerid ON sales.dbcustomers (customerid);
-- Step 2 — Cluster the Table
-- Use the CLUSTER command to physically reorder the existing data in the table according to the specified index.
CLUSTER sales.dbcustomers USING idx_dbcustomers_customerid;
--
-- salesdb=# CREATE INDEX idx_dbcustomers_customerid ON sales.dbcustomers (customerid);
-- CREATE INDEX
--

-- salesdb=# \d sales.dbcustomers
--                       Table "sales.dbcustomers"
--    Column   |         Type          | Collation | Nullable | Default
-- ------------+-----------------------+-----------+----------+---------
--  customerid | integer               |           |          |
--  firstname  | character varying(50) |           |          |
--  lastname   | character varying(50) |           |          |
--  country    | character varying(50) |           |          |
--  score      | integer               |           |          |
-- Indexes:
--     "idx_dbcustomers_customerid" btree (customerid)
--

-- salesdb=# CLUSTER sales.dbcustomers USING idx_dbcustomers_customerid;
-- CLUSTER
--

-- salesdb=# \d sales.dbcustomers
--                       Table "sales.dbcustomers"
--    Column   |         Type          | Collation | Nullable | Default
-- ------------+-----------------------+-----------+----------+---------
--  customerid | integer               |           |          |
--  firstname  | character varying(50) |           |          |
--  lastname   | character varying(50) |           |          |
--  country    | character varying(50) |           |          |
--  score      | integer               |           |          |
-- Indexes:
--     "idx_dbcustomers_customerid" btree (customerid) CLUSTER
-- salesdb=#
--

CREATE INDEX idx_dbcustomers_firstname ON sales.dbcustomers (firstname);
CLUSTER sales.dbcustomers USING idx_dbcustomers_firstname;
-- salesdb=# \d sales.dbcustomers
--                       Table "sales.dbcustomers"
--    Column   |         Type          | Collation | Nullable | Default
-- ------------+-----------------------+-----------+----------+---------
--  customerid | integer               |           |          |
--  firstname  | character varying(50) |           |          |
--  lastname   | character varying(50) |           |          |
--  country    | character varying(50) |           |          |
--  score      | integer               |           |          |
-- Indexes:
--     "idx_dbcustomers_customerid" btree (customerid)
--     "idx_dbcustomers_firstname" btree (firstname) CLUSTER
-- As you can see there only one Clustered index even though I was trying to create the multiple Clusterd Index
--

-- How to DROP the index?
DROP INDEX sales.idx_dbcustomers_customerid;
-- salesdb=# DROP INDEX sales.idx_dbcustomers_customerid;
-- DROP INDEX
--

CREATE INDEX idx_dbcustomers_lastname ON sales.dbcustomers(customerid);
CLUSTER sales.dbcustomers USING idx_dbcustomers_customerid;
--

-- Create Non Clustered index for last Name
CREATE INDEX idx_dbcustomers_lastname ON sales.dbcustomers(lastname);
-- salesdb=# \d sales.dbcustomers
--                       Table "sales.dbcustomers"
--    Column   |         Type          | Collation | Nullable | Default
-- ------------+-----------------------+-----------+----------+---------
--  customerid | integer               |           |          |
--  firstname  | character varying(50) |           |          |
--  lastname   | character varying(50) |           |          |
--  country    | character varying(50) |           |          |
--  score      | integer               |           |          |
-- Indexes:
--     "idx_dbcustomers_customerid" btree (customerid) CLUSTER
--     "idx_dbcustomers_lastname" btree (lastname)
-- salesdb=#
-- 
-- Create Non Clustered index for last Name
CREATE INDEX idx_dbcustomers_firstname ON sales.dbcustomers(firstname);
--

-- salesdb=# CREATE INDEX idx_dbcustomers_firstname ON sales.dbcustomers(firstname);
-- CREATE INDEX
-- salesdb=# \d sales.dbcustomers
--                       Table "sales.dbcustomers"
--    Column   |         Type          | Collation | Nullable | Default
-- ------------+-----------------------+-----------+----------+---------
--  customerid | integer               |           |          |
--  firstname  | character varying(50) |           |          |
--  lastname   | character varying(50) |           |          |
--  country    | character varying(50) |           |          |
--  score      | integer               |           |          |
-- Indexes:
--     "idx_dbcustomers_customerid" btree (customerid) CLUSTER
--     "idx_dbcustomers_firstname" btree (firstname)
--     "idx_dbcustomers_lastname" btree (lastname)
-- salesdb=#