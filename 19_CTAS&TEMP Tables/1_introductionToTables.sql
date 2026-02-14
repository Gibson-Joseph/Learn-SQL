-- Introduction to Tables:
/*
 We have learned that in each SQL server there are multiple databases. And in each database there are multiple schemas. And inside each schema we can define multiple objects like we can define tables and views.
 
 We can use the language DDL data definition language, which is a set of SQL commands in order to define this database structure.
 So we can use the SQL command CREATE in order ot define a new table or ALTER, in order to update the structure or DROP in order to drop the whole table.
 So a TABLE is an object in the database structure.
 
 What are tables?
 --  A database table is a structured collection of data, it's like a simple grid or spreadsheet that you might find in Excel. So it has different columns like each columns represents a field like the ID, Name, Country. 
 --  And the table has as well multiple rows. And each rows represents a record or an entry of the data. For example, if the table is about the employees then each record each row is one employee. 
 --  Now the intersect between the rows and columns we call it cell. And cell is a single piece of data.
 --  Now the whole table can be stored physically in the database as database files. So they are in the database like multiple files that are holding the information about the table. And those files are stored physically in that disk storage of database. So that means you data inside the tables are not stored like spreadsheet like an Excel, but they are stored in special database files that usual deverlopers and end users don't have access to those files.
 --  So tables is like an abstraction and representation for the actual data that are in the files. So actually each time you are querying table, the database has to go to those files and fetch the data for you.
 
 Table Types:
 We have different types of tables in SQL.
 We have tables that stays forever, we call it premanent tables. So they stay as long as you don't drop them.
 And you have another type of tables they called the temporary tables, and those tables can be deleted and dropped once the session ends.
 
 Permanent Tables: There are two ways on how to create them. The first way is classical way where you create a table from the scratch, and then you go and insert your data, So we call it CREATE, INSERT. And the other way called CTAS Create Tables As Select it can create as well a table but based on SQL query.
 */