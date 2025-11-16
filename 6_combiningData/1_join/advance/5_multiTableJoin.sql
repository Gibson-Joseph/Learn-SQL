-- MULTI TABLE JOIN
-- A multi-table join is when you join 3 or more tables together in one SQL query.
/*
 Example:
 A JOIN B JOIN C
 
 There is no limit — you can join 5, 10, or even 20 tables if your schema requires it.
 */
/*
 Using Sales DB, Retrive a list of all orders, along with the related customer, product, and employee details.
 
 For each order, display:
 - Order ID
 - Customer's name
 - Product name
 - Sales amount
 - Product price
 - Salesperson's name
 */
-- NOTE: before execute this query please connect the salesdb;
-- \c salesdb
-- \dn
SELECT O.orderid,
    C.firstname AS customer_first_name,
    C.lastname AS customer_last_name,
    P.product as prodcut_name,
    O.sales,
    P.price,
    E.firstname AS employee_first_name,
    E.lastname AS employee_last_name
FROM sales.orders AS O
    LEFT JOIN sales.customers AS C ON O.customerid = C.customerid
    LEFT JOIN sales.products AS P ON O.productid = P.productid
    LEFT JOIN sales.employees as E ON O.salespersonid = E.employeeid;