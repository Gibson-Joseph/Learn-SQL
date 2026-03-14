-- Columnstore Vs Rowstore Index
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46646607#overview
/*
 Why are we doing all those stuff? Why would I split my data by the columns?
 
 Well, it's all because of analytics. 
 Because it analytics we have like big complex query where we have a lot of data aggregations and stuff on big tables. And rowstore index is perfectly desinged in order to imporove the performance of such big queries.
 
 So now let's understand exactly why that columnstore index is way faster for data analysis than the rowstore index.
 
 And let's say we have like five customers where we have id, name and status. If we are using rowstore index the data can be stored in multiple data pages, And in each data pages we can have the whole recored, the whole information about one customer. So for this example we're going to have like three databases.
 
 But if you are using columnstore index it's going to be stored a little but differently. So the first column the id is going to stored in one data page, and here the SQL will not go and build a dictionary because the IDs are already short. So we're going to have like one data stream with all IDs. And now for the next column name, it's going to be stored in separate data page where we'are going to have and extra dictionary page where each name is going to to mapped to one small value so that that data can compressed. And we're going to save storage. Now the database is going to create for the third column the status one more data page. And the dictionary here is going to be very small. And in the data stream we will be storing only the ids of the dictionary.
 
 So now let's understand why the coliumnstore is faster.
 Let's have the following query.
 We want to find the total number of customers that are active.
 
 SELECT COUNT(*) FROM customers WHERE status = 'ACTIVE'
 
 Now if we query the table with the row store, what can happend is, SQL will have first to go and collect the data. And as you see SQL is reading the everything the whole row, the id, the name, the status. Even though that for the query we actually don'g need all those information. We just needs to count how many customers we need with the sttus ACTIVE. But SQL cann't go and selectively only reading the status, SQL has to read the whole record. After SQL has all the data, it's going to go and filter the data, so it's goint go and remove the inactive rows, And then it's going to do the aggregate operation, and with that we're going to get final result.
 
 But now let's see how SQL can query the columnstore. So SQL first have to analyze okay which columns do I need actually for this Query. Well, we need only the status. So SQL will not not go and open all three data pages and read it. SQL will target only one data page, the data page where we have columns status, so it can take this very simple data stream, And then it can go and understand the dictionary. And it can go and remove all the values where it is equivalent to INACTIVE, and with that we're going to get final result.
 ========================================
 
 Rowstore Index
 ====================
 Definition:
 --  Organizes and stores data row by row. It's really nice method if you need a lot of coluns in one row.
 Storage Efficiency:
 -- Less efficient in storage
 Read/Write Optimization:
 -- Fair speed for read & write operations.
 I/O Efficiency:
 -- Lower (retrives all columns)
 
 Column Index
 ====================
 Definition:
 -- Organizes and stores data column by column, which is really great if you're focusting one specific column.
 Storage Efficinecy:
 -- High efficient with compression.
 Read/Write Optimization:
 -- Fast read performance. Slow write performance.
 I/O Efficiency:
 -- Higher (retrives sepcific columns)
 */