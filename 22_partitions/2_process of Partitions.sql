-- The Process of Partitions.
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/47105379#overview
/*
 1. Partition Function:
 -- We are going to go and define here in the function the logic on how to divide the table partitions. And this can be based on the partition key. 
 -- So that means we need a column in order ot define the logic. And we usually use columns with the dates like for example the order dates or in other scenarios we can use the region or country and so on. But the most famous one is the dates.
 -- And there are like multiple types of functions. We're going to focus on the range function.
 
 
 Create a partition function:
 In PostgreSQL, there is no direct concept called a “Partition Function” like in SQL Server.
 
 Types of "Partition Function Logic" in PostgreSQL
 1. RANGE
 2. LIST
 3. HASH
 
 These act like different partition functions
 */