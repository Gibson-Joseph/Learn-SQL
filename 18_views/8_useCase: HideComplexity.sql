-- Use Case: Hide Complexity
/*
 In many scenarios, we work with a very large and complex databases, and we can use views in order to reduce the complexity and make things easier for the users.
 */
--==============================================
-- Provide a view that combines details from orders, producets, customers, and employees
--==============================================
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
    LEFT JOIN sales.employees e ON e.employeeid = o.salespersonid;
--
--
CREATE VIEW sales.V_order_details AS(
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
);
--Output: CREATE VIEW
--
SELECT *
FROM sales.v_order_details;