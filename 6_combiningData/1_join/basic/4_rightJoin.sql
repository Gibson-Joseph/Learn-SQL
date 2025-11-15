-- RIGHT JOIN
/*
 RIGHT JOIN returns:
 
 1. All rows from the RIGHT table
 2. Matching rows from the LEFT table
 3. If there is no match, the LEFT table columns become NULL
 
 Think of it as the opposite of LEFT JOIN.
 */
/*
 SYNTAX:
 SELECT * FROM A RIGHT JOIN B ON A.key = B.key
 
 left = FROM <table_name>
 rignt = JOIN <table_name>
 */
--=======================================================
-- Get all customer along with their odres, including orders without matching customers.
--=======================================================
SELECT C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM customers as C
    RIGHT JOIN orders AS O ON C.id = O.customer_id;