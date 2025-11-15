-- FULL ANTI JOIN
/*
 A FULL ANTI JOIN returns:
 1. Rows from LEFT table that do NOT match the RIGHT table
 2. Rows from RIGHT table that do NOT match the LEFT table
 3. It does NOT return matching rows
 */
/*
 or simply:
 Give me all rows that DO NOT match between the two tables.
 */
--=============================
-- Find customers without orders and orders without customers
--=============================
SELECT *
FROM customers AS C
    FULL JOIN orders AS O ON C.id = O.customer_id
WHERE C.id IS NULL
    OR O.customer_id is NULL;