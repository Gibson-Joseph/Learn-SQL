--ALTER
--define structure of your data
/*
 If you have already a table, what we can do, we can go and edit and change the definition
 ALTER means you want to edit the definition of your table and you want to change it like adding new column or maybe changing the data type and anything in the definition of the table.
 */
--=========================
-- Add a new column called email to the persons table
--=========================
--======================================
-- (ADD column_name data_type constraint) 
--======================================
ALTER TABLE persons
ADD email VARCHAR(50) not NULL;
-- The new columns are appended at the end of table by default.
-- This is not a query. This is a DDL command
SELECT *
from persons;
--=========================
-- Remove the column phone from the persons table
--=========================
ALTER TABLE persons drop column phone;
-- This is how we can edit the definition of our table by adding and removing columns.