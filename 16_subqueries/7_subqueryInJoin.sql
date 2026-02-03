-- Subquery in JOIN Clause
/*
 Sometimes we have to go and prepare the data before donig the join to dynamically create a results sets for joining with another table.
 
 So we can not join tables directly, we have to do preparations step before doing the joins okay.
 */
--====================================
-- Show all customer details and find the total orders of each customer.
--====================================
SELECT c.*,
    o.total_orders
FROM sales.customers AS c
    LEFT JOIN (
        -- Table subquery
        SELECT customerid,
            COUNT(*) total_orders
        FROM sales.orders
        GROUP BY customerid
    ) AS o ON c.customerid = o.customerid;