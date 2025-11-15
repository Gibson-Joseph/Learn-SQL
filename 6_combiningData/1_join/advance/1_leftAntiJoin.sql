-- LEFT ANTI JOIN
/*
 A LEFT ANTI JOIN returns:
 
 1. Rows from the LEFT table
 2. that do NOT have a match in the RIGHT table
 3. It returns only unmatched rows
 4. Right table columns do NOT appear at all
 */
--=============================
-- or simply:
-- Give me rows in A that are NOT in B.
--=============================
/*
 SYNTAX:
 --------
 SELECT * 
 FROM A 
 LEFT JOIN B 
 ON A.key = B.key 
 WHERE B.key is NULL # If the key is null so that means there is no match on the right side. 
 
 left = FROM <table_name>
 rignt = JOIN <table_name>
 */
--===================================================
-- Get all customers who haven't placed any order.
--===================================================
SELECT *
FROM customers AS C
    LEFT JOIN orders AS O ON C.id = O.customer_id
WHERE O.customer_id is NULL;
-----------------------------------------------------
SELECT C.id,
    C.first_name,
    C.country
FROM customers AS C
    LEFT JOIN orders AS O ON C.id = O.customer_id
WHERE O.customer_id is NULL;
--=======================================
-- Get all orders without matching customers
--=======================================
SELECT *
from orders AS O
    LEFT JOIN customers AS C ON C.id = O.customer_id
WHERE C.id is NULL;