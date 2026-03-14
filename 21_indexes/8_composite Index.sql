-- Composite Index
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46608679#overview
/*
 It is an index that has multiple columns inside the smae index.
 */
SELECT *
FROM sales.dbcustomers
WHERE country = 'USA'
    AND score > 500;
--
-- now we have to go and define a list of coliunns that you want to be included in this Index.
-- RULE: The columns of index order must match the order in your query. Our queyr start with country and score. You have to do it the same thing in the index.
CREATE INDEX idx_dbcustomers_countryscore ON sales.dbcustomers (country, score);
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
--     "idx_dbcustomers_countryscore" btree (country, score)
-- salesdb=#
--

/*
 now we have like a nice index for those two columns, what can happend if I go and use in my query only one of them like for example, the country.
 
 So now the question is, if I go and execute this query, is the SQL is using this index even though that I don't have the score?
 ANS: Yes
 
 Because it follows the leftmost prefix rule.
 
 LEFTMOST PREFIX RULE
 SQL can use the index if your using always the left columns. So here in our Index country is on the left, that's why it is working over here, But if you skip the left column it will not work.
 */
-- Indexing will work as we followed the Leftmost prefix rule
SELECT *
FROM sales.dbcustomers
WHERE country = 'USA';
--

-- Indexing won't work as we skip the country in the left
SELECT *
FROM sales.dbcustomers
WHERE score > 500;
--

-- So as long as you are including the left colunns, it will work evern though its in only one column. So in this scenario the first query can use the index, the second one will not be useing it.
--

-- Example
-- A, B, C, D -- These are indexes
-- Index will be used
-- A
-- A, B
-- A, B, C
-- Index won't be used.
-- B
-- A, C
-- A, B, D
--

-- So if you are using multiple columns insdie one index, be careful with the order of the columns that you are defining.