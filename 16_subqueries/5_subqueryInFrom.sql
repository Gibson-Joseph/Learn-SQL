-- Subquery in FROM Clause.
/*
 We typically use the subqueries in the FROM clause in order to create temporary results sets, that act as a table for the main query.
 So it's like in some scenarios we cannot use the tables directly from the database, we have to prepare it somehow before we do our actualy query.
 
 SYNTAX:
 SELECT column1, column2, ...
 FROM ( SELECT column FROM table1 WHERE condition ) AS alias;
 
 We have to use the prentheses at hte start and at the ends, this is the subquery, this is not the main query.
 And after the parentheses we can go and define the alias for the results that we're going ot get from this subquery. In many database this alias is an optional, but for the SQL server we have to go and specifiy an alias.
 */
--=================================
-- Find the products that have a price higher than the average price of all products.
--=================================
SELECT * -- Main Query
FROM (
        -- Subqury
        SELECT productid,
            price,
            AVG(price) OVER() avg_price
        from sales.products
    ) as t -- "t" stans for "Table"
WHERE price > avg_price;
-- this filtering is done in the main query.
--
--==================================
-- Rank customres based on their total amount of sales.
--==================================
SELECT *,
    -- Main query
    RANK() OVER(
        ORDER BY total_sales DESC -- Here we have used the 'total_sales' that we have already prepared in the subquery.
    )
FROM (
        -- Sub query
        SELECT customerid,
            SUM(sales) AS total_sales
        FROM sales.orders
        GROUP BY customerid
    ) t;
-- The first step does SQL going to go and identify the subquery. And then it's going to go and execute it. So once the subquery is executed, the next step is that the result is going ot be introduced as an intermediate results. So these intermediate results we will not see it in the output, it's going to be like temporarily saved in the memory. So now the next step is that SQL is going to go to the main query, and it's going to execute it based on the intemediate results. So that means the main query will not go back to the original table. And the output of the main query is going to be the final results.