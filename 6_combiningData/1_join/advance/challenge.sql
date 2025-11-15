/*
 Get all customers along with their orders, But only for customers who have placed an order
 (Without using INNER JOIN)
 */
SELECT *
FROM customers AS C
    FULL JOIN orders AS O ON C.id = O.customer_id
WHERE O.customer_id IS NOT NULL;