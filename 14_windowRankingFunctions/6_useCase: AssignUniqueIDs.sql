-- Use Case: Assign Unique IDs 
-- We might be in a situation where you have a table without any primary key and you would like to create an ID for each row. So in order to do that, we can use the function ROW_NUMBER in order to generate unique identifier IDs for each row insider our table, if we don't have one.
--======================================
-- Task
-- Assign unique IDs to the rows of the 'Orders Archive' table
--======================================
SELECT *,
    ROW_NUMBER() OVER(
        ORDER BY orderid,
            orderdate
    ) primary_key
FROM sales.ordersarchive;