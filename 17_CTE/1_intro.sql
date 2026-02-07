-- Introduction to Common Table Expression (CTE)
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/45843959#overview
/*
 A Common table expression is a temporary named result set, like virtual table, that could be used multiple times within your query to simplify and organize complex query.
 
 The intermediate table that is created from the CET has two features.
 - 1. The intermediate table will not live long. So once the query ends what's going to happen is SQL going to go and destory this intermediate table.
 - 2. The intermediate table is only locally availbale for the main query in the same query. So that means it's not globally available like the database tables for any query. It is dedicated only for the main qury withing the same query.
 
 
 What is the different between Subquery and CTE?
 - The story is identical between the subqueries and the CTE. 
 - The subqueries are writing it from bottom to top. So first we have this inner query the subquery and then on top of it we have the main query.
 - But now, on the other hand, the CTE, we are writing it from top to bottom. So first we write this inner query the CTE query, and then beneath it we're going to go and write the main query.
 - So if we thinkg about the subqueries we start from bottom to top. If we thinking about CTE we start from top to bottom.
 - The subquery is introducing and intermediate result that is used later from teh main query, And the same thing for the CTE it presentes like intermediate table that is used as well from the main query.
 - In the subquery the result can be used only once. So you cannot have another place in your main query where you go and reuse the results from the subquery. So you can use it maximum only in one position and only once.
 - Whet the CTE technique you can think about the the sales table as a virtual table, and not only you can use it in one place in the main query, you can go and use it in many other places.
 
 
 So that means if you want the subquery in 2 or 3 different places, you have to write the subquery 3 different times.
 */