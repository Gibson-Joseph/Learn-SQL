-- Execution Plan
-- REF: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46774207#overview
/*
 --  An Execution Plan is the step-by-step strategy used by the database engine to retrieve or modify data when a SQL query is executed. It shows how the database will access tables, use indexes, perform joins, and process filters.
 
 --  Understanding execution plans is very important for query optimization and performance tuning.
 
 What is an Execution Plan?
 When you run a SQL query, the database does not directly execute the statement as written. Instead, the query goes through several internal stages:
 --  1. Parsing – SQL syntax is checked.
 --  2. Rewriting – The query may be simplified or transformed.
 --  3. Planning (Optimization) – The optimizer decides the best way to execute the query.
 --  4. Execution – The selected plan is executed.
 The Execution Plan is the result of the planning stage.
 
 
 Common plan nodes and their performance characteristic:
 --  Seq Scan:   :   Scans full table; efficient for small tables, slow for large, unselective queries.
 --  Index Scan: :   Uses indexes for fast lookups, ideal for selective queries.
 --  Hash Join:  :   Efficiently merges large datasets using memory-based hashing.
 --  Sort        :   Orders data but is a blocking, potentially slow operation that may use disk. 
 */