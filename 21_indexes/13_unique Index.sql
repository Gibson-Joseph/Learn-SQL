-- Unique Index
/*
 What is unique index?
 Unique index is a special type of indexes that can make sure no duplicates in your data. 
 
 And there are a couple of reasons why is it imporant to have a unique index.
 -- The first one and the most obvious reason is to have data integrity. So the unique index can go and enforce uniqueness in your data. For example, if you have a column like an email address or a product ID, having duplicate in such columns can mess up your data very badly. So having unique index on a column like an email can make sure there are no sneaky duplicates inside your data.
 
 -- The second important reason why unique index is imporant is to improve the performance. So for example, if you are searching for a specific email, the SQL can start searching for the email value, And once the SQL find the value, the SQL will stop searching becuause we are sure that there is no duplicates in the data. So with that, you are improving the performance of your queries. So if you are creating and index and you know htis column is unique then make sure to make the index as unique index.
 
 PERFORMANCE: 
 Writing to an unique index is slower then non-unique.
 Reading from and unique index is faster than non-uniuqe.
 
 
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
--
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