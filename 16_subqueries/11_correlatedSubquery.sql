-- Correlated Subquery
/*
 1. Non-Correlated Subquery 
 - A Non correlated subquery means a subquery that can run independently from the main query. So that means the subquery is like a standalone query. Whatever we learns so for is Non Correlated subquery.
 
 2. Correlated Subquery
 - A Correlated subquery is a subquery that relies on values from the main query for each row it processes. So this means the subquery here is completely dependent on main query.
 - Now this tiem SQL is going to go and start executing the main query first. This is the first thing happens.
 - So the main query can go and query the database in order to get results. And SQL is going to process the results row by row.
 - The main query is going to go and pass the first row informations to the subquery. So now the subquery is going to get the data from teh main query. So SQL can execute the subquery.
 - So here it's very important to udnerstand that now the SQL or the main query is going to check is there a results from teh subquery. So SQL is checking the output for the subquery for the first row. So if there is a result SQL is going to go and return the row in the final results. 
 - So this is the whole interation happened only for the first row.
 - So now let's say that after executing the subquery there were no results, so the subquery is not returning anything after the execution. So now what can happen is SQL and main query are going to check, there is now resutls from the subquery, And this means this row should be excluded and not presented in the output. So we will not see this row at the output.
 */
--================================
-- Show all customer details and find the total orders of each customer.
--================================
--main query
SELECT *,
    (
        -- subquery
        SELECT COUNT(*)
        FROM sales.orders o
        WHERE o.customerid = c.customerid
    ) AS total_sales
from sales.customers c;
-- Here we have connecting the subquery with main query
/*
 Different between Correlated subquery and Non Correlated subquery
 
 Non-Correlated subquery:
 
 Definition - Subquery is independent of the main query
 Executions - Executed once and its result is used by the main query. It can be executed on its own.
 Easy to use - Easier to read
 Performance - Executed only once leads to better performance
 Usage - Static comparisons, Filtering with constants
 
 
 Correlated subqery:
 
 Definition - Subquery is dependtent of the main query.
 Executions - Executed for each row processed by the main query. It can't be executed on its own.
 Easy to use - Harder to read and more complex
 Performance - Executed multipel times leads to bad performance
 Usage - Row-by-Row comparisons, Dynamic Filtering
 
 */