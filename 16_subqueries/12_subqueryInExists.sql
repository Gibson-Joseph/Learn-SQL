-- Subquery using Exists.
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/45589419#overview
/*
 So now in some scerarios as you are querying the data from one table, you would need to go and check whether the rows of this table exist in another table. So that means you are checking like the existence of your rows in different table.
 
 EXISTS - It's simply check wheter the subquery returns any results any rows. 
 
 SYNTAX:
 SELECT column1, column2, ...
 FRORM Table2
 WHERE EXISTS ( SELECT 1 FROM Table1 WHERE Table1.ID = Table2.ID )
 */
--================================
-- Show the order details for customes in Germany.
--================================
SELECT *
FROM sales.orders o
WHERE EXISTS (
        SELECT country
        FROM sales.customers c
        WHERE country = 'Germany'
            AND o.customerid = c.customerid
    );
--================================
-- Show the order details for customes in not Germany.
--================================
SELECT *
FROM sales.orders o
WHERE NOT EXISTS (
        SELECT country
        FROM sales.customers c
        WHERE country = 'Germany'
            AND o.customerid = c.customerid
    );