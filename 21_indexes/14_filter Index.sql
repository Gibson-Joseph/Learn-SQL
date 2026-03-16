-- Filter Index.
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46689223?start=15#overview
/*
 What is Filtered index?
 A filtered index is a regualar index, but with a twist. It only includes rows that meet specific condition.
 
 A filtered index is an index that includes only a subset of rows from a table, based on a condition (filter). Instead of indexing the entire table, you index only the rows you actually care about.
 
 Why is it important to have filtered index?
 --  Well the biggest benefit is we're going to have targed optmizations.
 --  So for example, if you have a table with a million rows, but you only care about the rows where the status is 'active', then you can create a filtered index on the status column where status = 'active'. This way, when you query for active records, the database can use the filtered index to quickly find those records without having to scan through all million rows.
 -- Now the second benefit if you think about the storage, since the size of the B-Tree structure is going to be smaller, that means we're going to need less storage space in order to store in index, which is a great thing if you have large tables in your database.
 
 So the filtered index is going to make the structure of the index smaller, which can improve the speed and the performance, and as well reduce the storeage that is needed for your index.
 
 SYNTAX:
 CREATE [UNIQUE] INDEX index_name ON table_name (column_name1, column_name2, ...) WHERE [condition];
 
 RULE:
 1. You cannot create a filtered index on a clustered index.
 2. You cannot create a filtered index on a columnstore index.
 
 So it is only allowed for the non-clustered index becuase it makes no sense if you create clustered index, the entire table should reorganized and ordered. So it will not work for only subset of data. And it is only allowed if you are using row store.
 
 You can go and combine the unique index together with the filtered index.
 */
SELECT *
FROM sales.customers
WHERE country = 'USA';
-- 
-- CREATE INDEX idx_customers_country ON sales.customers(country) --> If you do like this, SQL going to go and create a non-clustered index for all customer not only from USA but for everything
--
CREATE INDEX idx_customers_country ON sales.customers(country)
WHERE country = 'USA';
-->> It will be focused and targeted only for supset of data, only for the data that fullfill this coindtion.
--
-- salesdb=# CREATE INDEX idx_customers_country ON sales.customers(country)
-- WHERE country = 'USA';
-- CREATE INDEX
-- salesdb=#
--
-- salesdb=# \d sales.customers
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
--     "idx_customers_country" btree (country) WHERE country::text = 'USA'::text
--