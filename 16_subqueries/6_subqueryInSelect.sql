-- Subquery in SELECT
/*
 We typically use the subqueries in the select clause to aggregate the data side by side with the columns of the main query.
 
 SYNTAX:
 SELECT column1, (SELECT column FROM table1 WHERE condition) AS alias FROM table1;
 
 The alias is here optional and not must to add an alias.
 
 RULE:
 The result of this subquery must be 'scalar query', that means the result must be single value because otherwise it will not work.
 */
--=================================
-- Show the product IDs, names, prices and total number of orders
--=================================
SELECT productid,
    productid,
    price,
    (
        -- scalar sub queyr
        SELECT COUNT(*)
        FROM sales.orders
    ) AS total_orders
FROM sales.products;
-- This is what we call scalar subquery inside the SELECT clause.
-- If you are using a subquery inside the SELECT clause only the scalar subquery is allowed.