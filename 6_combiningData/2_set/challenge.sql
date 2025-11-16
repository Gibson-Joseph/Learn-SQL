--============================================
-- Orders are stored in seperate tables (Orders and OrderArchive). Combine all orders into one report without duplicates.
--============================================
SELECT *
FROM sales.orders
UNION
SELECT *
FROM sales.ordersarchive;
-- BAST PRACTICES: Never use an astrisk(*) to combine tables; list needed columns instead.
SELECT 'Orders' AS source_table,
    orderid,
    productid,
    customerid,
    salespersonid,
    orderdate,
    shipdate,
    orderstatus,
    shipaddress,
    billaddress,
    quantity,
    sales,
    creationtime
FROM sales.orders
UNION
SELECT 'OrdersArchive' AS source_table,
    orderid,
    productid,
    customerid,
    salespersonid,
    orderdate,
    shipdate,
    orderstatus,
    shipaddress,
    billaddress,
    quantity,
    sales,
    creationtime
FROM sales.ordersarchive
ORDER BY orderid;
-- SOURCE FLAG: Include additional column to indicate the source of each row.