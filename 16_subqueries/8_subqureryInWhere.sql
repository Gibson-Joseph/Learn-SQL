-- Subquery in WHERE
/*
 Used for complex filtering logic and makes query more flexible and dynamic.
 In order to filter data using the WHERE Clause, we have to go and use operators, and we can split in into two groups, we have the compariosn operators and another set we can call it logical operators or sometimes we can call it subqueries operators.
 
 1. Comparison Operators (<, >, =, !=, >=, <=)
 2. Logical Operators (IN, ANY, ALL, EXISTS)
 
 Comparison Operators:
 We can use it in order to compare two values in order to help us filtering the data based on specific condition.
 
 SYNTAX:
 SELECT column1, column2, ...
 FROM table1
 WHERE column = ( SELECT column1 FROM table2 WHERE condition );
 
 And here in SQL, if you are using subquery with the comparison operators, we have a rule.
 
 RULE:
 The subquery must be scalar subquery. So only one single value.
 */
--====================================
-- Find the products that have a price higher than the average price of all products.
--====================================
SELECT *
FROM sales.products
WHERE price > (
        SELECT AVG(price)
        FROM sales.products
    );