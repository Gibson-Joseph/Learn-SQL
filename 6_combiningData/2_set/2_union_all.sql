-- UNION ALL
/*
 The UNION ALL operator in SQL is used to combine the rows from two or more SELECT queries without removing duplicates.
 It is the only SET operator doesn't remove the duplicates.
 UNION ALL is generally faster than the UNION
 
 It stacks all results vertically, exactly as they appear.
 */
/*
 What UNION ALL Does
 1. Combines rows from Query 1 and Query 2
 2. Keeps duplicates
 3. Returns every row from both queries
 4. Helps us combine rows exactly as they are
 */
/*
 Requirements
 To use UNION ALL:
 1. Both queries must return the same number of columns
 2. Columns must be in the same order
 3. Column data types must be compatible
 */
--========================================================
-- Combine the data from employee and customers into one table, inculding duplicate.
--========================================================
SELECT firstname,
    lastname
FROM sales.customers
UNION ALL
SELECT firstname,
    lastname
FROM sales.employees;
-- If you're confident there are no duplicates, use UNION ALL.