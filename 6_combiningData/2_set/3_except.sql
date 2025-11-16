-- EXCEPT
/*
 The EXCEPT operator in SQL returns rows from the first query that do NOT exist in the second query.
 
 It compares the results of two SELECT statements and removes duplicates automatically.
 
 This helps us find rows that are unique to the first query.
 */
/*
 What EXCEPT Does
 1. Returns rows only from Query A
 2. Excludes any rows that also appear in Query B
 3. Removes duplicates in the final output
 4. Helps us find differences between two datasets
 */
--============================================
-- Find the employee who are not customers at the same time.
--============================================
SELECT firstname,
    lastname
FROM sales.employees
EXCEPT
SELECT firstname,
    lastname
from sales.customers;
-- ORDER OF THE QUERIES: The order of the quries does affect the result!!