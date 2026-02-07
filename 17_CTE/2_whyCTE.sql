-- Why CTE?
/*
 1. In subquery we are repeating the same query more than once for different purposes, which cause us to have two different subqueries. And this is exactly the weak point of the suqueries, It might introduce redundancies. So that means the subqueries alone will not help you to eleminate all the duplicates in your code.
 
 2. Using CTE we are reducing the number of steps which can lead to reduce the size of the query.
 
 3. We have another advantage of the CTE introduces modularity. So that means it breaks your code into smaller manageable parts. So this means instead of writing one huge complex query, you break it down into smaller chunks using CTE.
 
 4. Each CTE is like self-contained can handles specific part of the problem, and then you can combine them all together in the final query, It's liek we are putting together a puzzle piece by piece.
 
 5. And now one very important advantage of the CTE is the reusablility. So that means we can have a result set that is used multiple times inside our query. So that means you write the logic the code only once and then use it in different places inside your query.
 */