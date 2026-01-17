-- NULLIF
-- 👉 Returns NULL if a = b, otherwise returns a.
-- “If these two values(a and b) are the same, treat it as NULL.”
/*
 NULLIF() going to go and compare two values and it's going to return a null if they are equal. Otherwise if they are not equal it will return the first value.
 
 SYNTAX
 NULLIF(value1, value2)
 */
--============================================
-- TASK
-- Find the sales price for each order by dividing the sales by the quantity.
--============================================
-- ERROR: division by zero
SELECT orderid,
    sales,
    quantity,
    sales / quantity AS sales_price
from sales.orders;
--
-- Correct query
SELECT orderid,
    sales,
    quantity,
    sales / NULLIF(quantity, 0) AS price -- And with that we are making sure that we are not dividing by zero.
from sales.orders;
-- And this is a very common use case for the NULLIF we can use it in order to prevent dividing by zero.