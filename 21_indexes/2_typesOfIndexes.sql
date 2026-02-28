-- Types of Indexes
/*
 We can divide the indexes in databases into three categories.
 
 1. Structure
 2. Storage
 3. Function
 
 1. Structure:
 The first one is how the first one is organizing and referencing the data. And here we have two types.
 - 1. Clustered Index
 - 2. Non-Clustered Inex
 Those are very importent to understand.
 
 2. Storage:
 And in this category we are talking about how the data is stored physically in the database. And we have two types.
 - 1. Rowstore Index
 - 2. Columnstore Index
 
 3. Function
 And in this category we are talking about the function of the index. And here we have two types.
 - 1. Unique Index
 - 2. filtered Index
 
 
 Trade-off
 Some indexes are better for reading, others for writing performance(INSERT and UPDATE).
 */