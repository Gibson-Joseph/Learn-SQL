-- Use Case: Data Security.
/*
 -- We can use VIEWS in order to implement security and to protect our data in the database.
 -- In many scenarios, we have sensitive informations in our data and we cannot go and share it with everyone.
 -- So one of the best practices is to create VIEWS in order to protect your data before sharing it with users.
 */
--=======================================
-- Provide a VIEW for the EU sales team that combines details from all tables and excludes data related to the USA.
--=======================================
CREATE VIEW sales.V_order_details_eu AS(
    SELECT o.orderid,
        o.orderdate,
        p.product,
        p.category,
        CONCAT(c.firstname, ' ', c.lastname) AS customer_name,
        c.country AS customer_country,
        CONCAT(e.firstname, ' ', e.lastname) AS sales_name,
        e.department,
        o.sales,
        o.quantity
    FROM sales.orders o
        LEFT JOIN sales.products p ON p.productid = o.productid
        LEFT JOIN sales.customers c ON c.customerid = o.customerid
        LEFT JOIN sales.employees e ON e.employeeid = o.salespersonid
    WHERE c.country != 'USA'
);
-- And with this, we are doing now row level security, that means we are hiding now all the orders, all the rows that are not allwed to be seen and consumed from this group of users.
--
-- OutPut: CREATE VIEW
SELECT *
from sales.v_order_details_eu;
-- So with that we are providing VIEW that protects few rows like the orders from USA.
-- So as you can see, VIEWS are realy great in order to provide security to our data, whether we are protecting the columns or the rows.