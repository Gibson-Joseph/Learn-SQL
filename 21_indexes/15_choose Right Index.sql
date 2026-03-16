-- Choose Right Index
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46689227#overview 
/*
 How to use the right Index and when to use which type?
 
 1. Heap
 -- It is a table without any index.
 -- So in which scenario we don't have to use any indexes in case you want to have fast inserts. So if you want to have a fast write performance then don't take any index. So you stay with the default with the heap structure of you table.
 -- And we usually use it in not very important tables, like the staging tables or temporary tales where we want to insert the data fast and then get rid of the data later. So here there is no need to utilize any index.
 
 2. Clustered Index:
 -- We usually use the clustered index for primary keys. It is even a default from the database. If you create any primary keys, then SQL going to go and create a clustered index. So this is the main usage of the clsutered index.
 -- And if there is like no primary key in your table then you can go and pick another column where sorting the is imporant, like for example a data column.
 -- For the rowstore index we use it usually for OLTP systems where you have a lot of transactions and so on.
 
 3. Columnstore Index:
 -- If you have liek big complex analytical queries where you are aggregating a lot of data, doing data aggregations, then go for the columnstore index because it going to give you amazing performance. 
 -- And as well if you are struggling with the size of tables. So if you have a super large table, you can go and use the columnstore index because it can go and compress the data and reduce the size of the whole table.
 -- For columnstore we use it usually for the OLAP systems where you have a data warehouse, reporting system, business intelligence and so on.
 
 4. Non-Clustered Index:
 -- We usually use htis index for non-primary key columns. So that means the rest of the columns of your tables could be candidates for the non-clustered index.
 -- For example, for the foreign keys or using it on the columns that are used in order to join two tables. And another place you can use non-clustered index for the columns that are used for the WHERE clause.
 
 5. Filtered Index:
 -- We use it in order to target a subset of data. So if in our query and analysis we are only focusing on a subset of data all time, it makes not sense to have one big index for all data. We can use the filtered index to have focused index. 
 -- And of course, if the size the index is a problem, then you can use a filtered index in order to reduce the overall size of the storage of the index.
 
 6. Unique index:
 -- You can go and use the unique index in order to ensure data integrity of your table.
 -- And as well it might prove slightly the performance of your query, and thus because SQL has less tasks to do if the index is uniuqe once SQL finds a match, it's going to skip the search.
 */