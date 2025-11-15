-- INNER JOIN
-- INNER JOIN returns only the matching rows from both tables.
-- If there is no match, the row is not included in the final output.
--------------------------------------------------------------------
-- SYNTAX:
-- SELECT * FROM A [type] INNER JOIN B ON A.key = B.key
-- type is INNTER by default
-- We have to find out the common column in order to match the data.
-- The order of table doesn't matter for INNER join
--------------------------------------------------------------------
-- Why INNER JOIN Is Useful
-- Get only related data from multiple tables.
-- Remove unmatched items.
--==========================================
-- Get all customers along with their orders, but only for customers who have placed an order.
--==========================================
SELECT *
FROM customers
    INNER JOIN orders on id = customer_id;
--------------------------------------------------------------------
SELECT id,
    first_name,
    order_id,
    sales
FROM customers
    INNER JOIN orders on id = customer_id;
--------------------------------------------------------------------
-- Sometims if you have two tables you might have columns having the same names. Like imagine the order ID in the order table it's called ID. so that means we have same name in both tables and this kind of makes SQL very confused.
-- Column Ambiguity ==> Add the table name before colum to avoid confustion in joins with same-named columns
--------------------------------------------------------------------
SELECT customers.id,
    customers.first_name,
    orders.order_id,
    orders.sales
FROM customers
    INNER JOIN orders ON customers.id = orders.customer_id;
--------------------------------------------------------------------
-- Using alias
--- All columns from C and O
SELECT *
from customers as C
    INNER JOIN orders as O on C.id = O.customer_id;
--------------------------------------------------------------------
SELECT C.*,
    -- All column from the customers
    O.* -- All columns from the orders
FROM customers as C
    INNER JOIN orders as O on c.id = O.customer_id;
--------------------------------------------------------------------
SELECT C.id,
    C.first_name,
    O.order_id,
    O.sales
from customers as C
    INNER JOIN orders as O on C.id = O.customer_id;