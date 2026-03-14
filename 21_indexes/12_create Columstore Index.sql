-- How to create Columstore Index.
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46646609#overview
-- Ref: https://stackoverflow.com/questions/69972426/columnstore-index-in-postgresql
/*
 SYNTAX:
 CREATE [ CLUSTERED | NONCLUSTERED ] [COLUMNSTORE] INDEX index_name ON table_name (column1, column2, ...)
 
 If you want to create Row columnstore index, then you don't have to specify anything like COLUMNSTORE, there is no keyword for the row store.
 
 In PostgreSQL, Columnstore indexes do not exist like they do in systems such as SQL Server. PostgreSQL is primarily a row-store database, so it does not support Clustered Columnstore Index or Non-Clustered Columnstore Index syntax.
 
 ==============================
 
 Storage Efficiency:
 1. columnstore Index
 2. Heap Table
 3. Rowstore Clustered Index
 
 
 SYNTAX:
 Create Index: (Non-Cluster)
 CREATE UNIQUE INDEX index_name ON table_name (column_name);
 
 Cluster Table Using the Index:
 CLUSTER customers USING idx_customer_id;
 
 The default is Not Unique.
 CREATE INDEX ix_customers_email ON customer(email) -->> Index allows duplicates
 CREATE UNIQUE INDEX ix_customers_email ON customer(email) -->> Duplicates are not allowed
 */
CREATE UNIQUE INDEX idx_products_category ON sales.products(category);
-- salesdb=# CREATE UNIQUE INDEX idx_products_category ON sales.products(category);
-- ERROR:  could not create unique index "idx_products_category"
-- DETAIL:  Key (category)=(Accessories) is duplicated.
-- salesdb=#
--
-- salesdb=# select * from sales.products ;
--  productid | product |  category   | price
-- -----------+---------+-------------+-------
--        101 | Bottle  | Accessories |    10
--        102 | Tire    | Accessories |    15
--        103 | Socks   | Clothing    |    20
--        104 | Caps    | Clothing    |    25
--        105 | Gloves  | Clothing    |    30
-- (5 rows)
-- Why can't we create uniuqe index is, we have duplicate category in the category column.
--
-- RULE: Dplicates in the columns will prevents creating a unique index.
-- But you can still create this unique index if the table is empty, and SQL will not allow you to insert any duplicates about the categories.
--

CREATE UNIQUE INDEX idx_products_product ON sales.products(product);
-->> Here we have targeting the product column.
--
-- salesdb=#   CREATE UNIQUE INDEX idx_products_product ON sales.products(product);
-- CREATE INDEX
-- salesdb=# \d sales.products
--                        Table "sales.products"
--   Column   |         Type          | Collation | Nullable | Default
-- -----------+-----------------------+-----------+----------+---------
--  productid | integer               |           | not null |
--  product   | character varying(50) |           |          |
--  category  | character varying(50) |           |          |
--  price     | integer               |           |          |
-- Indexes:
--     "products_pkey" PRIMARY KEY, btree (productid)
--     "idx_products_product" UNIQUE, btree (product)
--
-- Now check the data integrity. Are we allwowed not to add any duplicate to this table.
INSERT INTO sales.products (productid, product)
VALUES (106, 'Bottle');
--
-- salesdb=# INSERT INTO sales.products (productid, product)
-- VALUES (106, 'Bottle');
-- ERROR:  duplicate key value violates unique constraint "idx_products_product"
-- DETAIL:  Key (product)=(Bottle) already exists.
-- salesdb=#
-- 
-- So as you can see this index is now helping us and improving the quality of my table.