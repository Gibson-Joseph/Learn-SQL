-- CTAS vs CREATE/INSERT
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46075173#overview
/*
 CREATE/INSERT:
 --  The create insert method iis the classical way on how we define and create tables in SQL, where first we have to go and create the table and define the structure, and after that we insert our data into the database table where table.
 
 CTAS: 
 --  The CTAS Create Table As Select, this one can create a new table as well, but this time based on the result of SQL query.
 --  Here it's only one step where you define a query, and once you execute this query, what's going to happen? The database has to retrieve the data from another table, So it might retrieve data from our new table that we just created using create insert. So once the query in executed we will get a result.
 --  So now what the databse is going to do is going to create a new brand table, but this time the definition and the dta of this new table, it doesn't come from any definition that we specify, it comes from the result of the query. So whatever structure that we have in the results it's going to be reflected in our new table.
 */