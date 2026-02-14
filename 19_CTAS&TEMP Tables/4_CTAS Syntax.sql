-- CTAS Syntax
/*
 CREATE/INSERT;
 
 -- 1. Create the table first
 CREATE TABLE table_name (
 column1 datatype,
 column2 datatype,
 column3 datatype,
 ....
 );
 -- 2. Insert data into the table
 INSERT INTO table_name (column1, column2, column3, ...)
 VALUES (value1, value2, value3, ...);
 
 CTAS:
 
 CREATE TABLE new_table_name AS
 (
 SELECT column1, column2, column3, ...
 FROM existing_table_name
 WHERE condition
 );
 
 */