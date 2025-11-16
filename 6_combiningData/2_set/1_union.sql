-- UNION
/*
 The UNION operator in SQL is used to combine the rows from two or more SELECT queries and remove duplicate rows from the final result.
 
 It stacks the results vertically, one on top of another.
 
 UNION going to make sure that each row going to appear only once. 
 */
/*
 Requirements
 
 To use UNION:
 1. Both queries must return the same number of columns
 2. The columns must be in the same order
 3. The columns must have compatible data types
 */
--=================================================
-- Combine the data from employees and customers into one table.
--=================================================
SELECT C.firstname,
    C.lastname
FROM sales.customers AS C
UNION
SELECT E.firstname,
    E.lastname
FROM sales.employees AS E;
-- ORDER OF QUERIES: The order of queries in UNION operation does not affect restult.