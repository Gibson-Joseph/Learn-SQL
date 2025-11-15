-- LEFT JOIN
/*
 LEFT JOIN returns:
 
 1. All rows from the LEFT table
 2. Matching rows from the RIGHT table
 3. If there is no match, the RIGHT table columns become NULL
 */
/*
 SYNTAX:
 SELECT * FROM A LEFT JOIN B ON A.key = B.key
 
 left = FROM <table_name>
 rignt = JOIN <table_name>
 */
--=======================================================
-- Get all customer along with their orders, including those without orders.
--=======================================================
SELECT C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM customers AS C
    LEFT JOIN orders AS O ON c.id = O.customer_id;
--=======================================================
-- Get all customer along with their orders, including orders wintout matching customers 
--=======================================================
SELECT C.id,
    C.first_name,
    O.order_id,
    O.sales
from orders AS O
    LEFT JOIN customers AS C ON C.id = O.customer_id;