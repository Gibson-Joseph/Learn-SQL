-- INTERSECT
/*
 The INTERSECT operator in SQL returns only the rows that are common to both queries.
 
 It gives the overlapping rows.
 
 It also removes duplicates automatically.
 
 This helps us find rows that appear in both datasets.
 
 Its similiar to the INNER JOIN but removes the duplicate rows.
 */
/*
 What INTERSECT Does
 1. Returns rows that exist in Query A AND Query B
 2. Filters out values not shared
 3. Removes duplicates
 4. Helps us combine only common rows
 */
SELECT firstname,
    lastname
FROM sales.customers
INTERSECT
SELECT firstname,
    lastname
FROM sales.employees;