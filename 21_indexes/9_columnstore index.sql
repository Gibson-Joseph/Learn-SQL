-- What is columnstore Index?
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46646589#overview
/*
 Rowstore Index:
 ================
 Now let's say that we have a table. We have multiple rows and multiple columns. Now if we use Rowstore index this is the classical one. What can happen, our table is going to be splite into multiple rows. And as we learned each group of rows is going to be stored inside the datapage. So that means we are organizing the data row by row, which means all the columns for each row are going to be stored together. This is the treditional way on how the databases organize their data, where the informations are stored row by row.
 
 
 Column Index:
 ================
 But in the other side, if you using the columnstore index, the SQL is going to go and splite your table into multiple separate colums, And then SQL can go and store the values of one column together in datapage. So that means if you go and open the database, you find only the values of one columns, you will not find the eitire row. So if it's like the firt name, you will see only the firt name informations, you wil not see last name information in this data page.
 
 
 So if you compare them the rowstore index store the data row by row that columnstore index stores the data column by column.
 */