-- FULL JOIN
/*
 FULL JOIN returns:
 1. All rows from the LEFT table
 2. All rows from the RIGHT table
 3. Matching rows are merged
 
 Non-matching rows show NULL on the opposite side
 */
/*
 SYNTAX:
 SELECT * FROM A FULL JOIN B ON A.key = B.key
 
 left = FROM <table_name>
 rignt = JOIN <table_name>
 */
--=======================================================
-- Get all customers and all orders, even if there's no match
--=======================================================
SELECT C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM customers AS C
    FULL JOIN orders AS O ON C.id = O.customer_id;