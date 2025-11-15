-- RIGHT ANTI JOIN
/*
 A RIGHT ANTI JOIN returns:
 
 1. Rows from the RIGHT table
 2. that do NOT have a matching row in the LEFT table
 3. Left table columns do not appear
 4. Only unmatched RIGHT table rows are returned
 */
--=============================
-- or simply:
-- Give me rows in B that are NOT in A.
--=============================
/*
 SYNTAX:
 --------
 SELECT * 
 FROM A 
 RIGHT JOIN B 
 ON A.key = B.key 
 WHERE A.key is NULL # If the key is null so that means there is no match on the left side. 
 
 left = FROM <table_name>
 rignt = JOIN <table_name>
 */
--=======================================
-- Get all orders without matching customers
--=======================================
SELECT *
FROM customers AS C
    RIGHT JOIN orders AS O ON C.id = O.customer_id
WHERE C.id is NULL;