-- Subquery in IN operator
/*
 IN Operator:
 Checks whether a vlaue matches any value from a list.
 
 SYNTAX:
 SELECT column_name(s)
 FROM table_name
 WHERE column_name IN ( SELECT column_name FROM table_name WHERE condition );
 
 The subquery is allowed to have multiple rows. So there is no rule about having like one single value scalar subquery.
 
 RULE:
 You can use only Row Subquery. So it means there is one column and multiple rows.
 */
--===================================
-- Show the details of orders made by customers in Germany
--===================================
SELECT *
FROM sales.orders AS o
WHERE o.customerid IN (
        SELECT customerid
        FROM sales.customers
        WHERE country = 'Germany'
    );
--===================================
-- Show the details of orders for customers who are not from Germany.
--===================================
SELECT *
FROM sales.orders AS o
WHERE o.customerid NOT IN (
        SELECT customerid
        FROM sales.customers
        WHERE country = 'Germany'
    );