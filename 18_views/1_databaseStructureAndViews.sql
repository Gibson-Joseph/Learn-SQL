-- Database Structure And Views
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/45916599#overview
/*
 Now, if you is not like a query that you can use in SQL, it is an object that we can find in the database.
 
 Structure of the database:
 We have like hierarchy structure. And the highest level of this hierarchy is the SQL SERVER. 
 1.SQL Server: 
 -- The SQL server manages multiple databases. It's like the control center that keeps everything running and accesible. Now inside the SQL server we have multiple databases.
 
 2. Database:
 -- A database is a collection of affirmations that are stored in structure way. It's where all your data is kept and oragnized in different tables and objects. And each databases is seperated from others and it has its own data.
 -- Now inside each datase we can find multiple schemas.
 
 3. Schemal:
 -- A schema is like a logical way on how you group up related objects like tables and views together within a database.
 -- Like for example, If you have a database called sales, we can group different tables about the orders underneath the schema orders. And maybe we have like multiple views and tables about customers where we can put it in the schema customers.
 -- So if you find like multiple tables and views that are describing the same object, the same topic we put them all together underneath one schema.
 -- So again, a datbase could be like the sales database and the HR database, they are completely different types of data. And underneath the sales we can have like different sections. We have sections about the orders and sections about the customers.
 -- And now, what we can find inside the schema we can find TABLES and VIEW.
 
 4.a. Tables:
 -- A table is where actually your data is stored. It contains multiple columns and rows. So it is where the data physically lives.
 
 4.b. Views:
 -- Views is like a virtual tables that has a structure and everything, but inside it we don't have any data. 
 -- So the view doesn't store any data. And in order to see the data, we have to exectute the query behind the view. And only after that we are going to see some data, but it is not like the tables. It doesn't store the data permanently
 -- Iniside the tables we can define multiple stuff like columns and as well keys, And the same thing for views. Inside the views we can define multiple columns.
 
 Now in order for you to build and manage this structure we have set of commands and we call it DDL the shortcut of data definition language.
 
 DDL: The DDL is a set commends that allow us to define and manage the structure of the database. So we have commends like below.
 1. CREATE -> It help us to create database, schemas, tables, views.
 2. ALTER -> After you creat someting you would like, maybe later to do changes and updates.
 3. DROP -> In order to remove any database object like dropping a schema, dropping a database, tables, views.
 4. ...
 
 So the DDL commends can help us to manage the database structure.
 */