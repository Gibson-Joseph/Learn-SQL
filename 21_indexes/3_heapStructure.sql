-- Heap Structure
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46581287#overview
/*
 Before we dive into how the indexes works in databases, let's understand first what happens to the database tables, if you don't use any index.  
 
 When you create a new table in your database, like for example, the customers table where you have, let's say 20 customers inside this table. What you're going to see at the client side is like spreadsheets, like a table with rows and columns.
 But behind the scenes, the database stored it a bit differently. It can store the data in a data file on the disk, and inside this file, the data can be stored inside blocks called pages. So it's not like rows and columns that are stored inside data files. And inside the data files we have pages.
 
 What is a page?
 A page is the unit of data storage in a database. And it is fixed size of eight kilobytes(8 KB), where the SQL database can store anything inside it.
 It can insdie it the rows of your tables or columns, metadata, indexes, and so on.
 And every time you are interacting with your data, the SQL is reading and writhing to those pages. So as you can see, the SQL is not storing the data inside like rows and columns. So if you are running a query, the SQL is not like selecting a specific column, it always fits a database in order to read the rows inside this page.
 
 We have two types of pages:
 1. Data Page
 2. Index page
 
 So how the database look like, it is divided into multiple sections. 
 1. Page Header:
 The first section is page header, where the database can store key information about the metadata, like the page ID, and it has the following formats. It start with the file ID like 1 and the we have a unique number for each page. So the page header is a fixed size of 96 bytes.
 
 2. Varaible Size:
 This is where your data row is going to stored. So your actual ata are row is going to stored in this section. And the SQL is going to try and fit as many rows as it can in one single page, and this of course depends on the size of each row. So if you like a large table where the rows are really big so SQL can fit only few rows in one single page.
 
 3. Offset Array:
 This is like quick index for the rows stored inside this page. It keeps track of where each rows begins, so that the SQL easily locate a specific row without having SQL, like scanning the entire page in order ot find a row.
 
 And this is exactly how the SQL stores data inside the databases.
 
 =======================
 So a Heap table is a table without a clustered index. That menas the rows are stored randomly witout any particluar order. This is not really bad because it's going to be very quick INSERT data inside this table. But of course, finding somethign from this table is goint to be very slow. You have very fast writes but a very reads. 
 Think about it like you are throwing all your papers in a drawer without organizing them. So you can toss things very quickly in this drawer, But if you want search for a specific paper later, it can be a very long process unit you find it, because nothing's in order.
 
 
 Table FUll Scane:
 When you have a heap table, the only way to find something inside this table is to do a full scan. So you have to scan the entire table until you find what you're looking for. So if you have a large table with millions of rows, it can be a very long process to find something inside this table. So that's why it's not recommended to use heap tables in production environments, because they can cause performance issues when you have a large amount of data.
 */