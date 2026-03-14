-- Prcess of Building Columstore index.
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46646605#overview
/*
 So now let's say that we have a table for the customers. We have 3 columns Id, name, status, And as well we have around 2 million rows which means 2 million customers.
 
 And as we learned as a default, teh table can be built as a heap structure where the rows are stored row by row insdie the data pages.
 
 But now we are going to create a column store index on top of this table. So once you do that, SQL go through a process in order to build the column store.
 
 1. Row Groups:
 -- So the first step is, SQL go and divide the data the rows into row groups. Now in SQL server each row group can contain around like 1 million row. So in this example our table can be split into 2 row groups.
 -- Why we are spliting the rows? - Well, this is just a pre step in order just to optimize the performance and to do parllel processing.
 
 2. Column Segment:
 -- In the next step is SQL going to go and segment the columns. So now SQL will go for each row group and start splitting the by the columns. And that's we call it a column store because we are separaring the columns from each others. So that means we have one segment for the ID, another one for the name and a third one for the status. And this can happen for each row group.
 
 3. Data Compressoin:
 -- This is the most important step in this process because it is the reason why column store is very fast compared to the rowstore.
 -- So in this process there are like different techniques on how to do data compression. And the most famous one is that it's going ot go and create like a dictionary.
 -- Let's take for example the column status, the status of the customer, whether it is active or inactive. So the word active and inactive can be repeated like 2 million times because we have 2 million customers. And since it is like string, it is like taking a lot of space and storage.
 -- But now instead of that we're going to go and compress the data. So first it's going to go and create a dictionary by replacing the value active and inactive into smaller values like one and two ({active: 1, inactive: 2}). So we have like a mapping between the long value to small value. And after that it's going to store like a data stream where we have like only two values [1,2,1,2,2,1,1]. So we can have like a big stream of 2 million rows. So SQL going to go and do this for each column. And with that the size of each column is going to be changed. Depends of course on how much different values you have in each column.
 -- So this step is very importent in order to reduce the size of the data and as well to increase the performance.
 
 4. Store:
 -- So now once everything is organized and compressed, SQL is going to go and start storing the results in data pages.
 -- but SQL will not use the standard data pages, but instead it's going to use a special data pages called LOB(Large Object Page).
 
 
 -- So now we cann't just create a column store without defining whether it is clustered index or non-clustered index.
 -- So if you create such index, SQL of cource will not be building B-Tree structure, SQL is going to use exactly this structure, the column store structure.
 */