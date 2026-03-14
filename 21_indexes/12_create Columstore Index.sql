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
 
 */