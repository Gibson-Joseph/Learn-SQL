-- Window AVG
/*
 Retruns the average of values within a window.
 */
--=======================  
-- Find the average sales across all orders
-- And find the average sales for each product
-- Additionally provide details such order id, order date.
--=======================
SELECT orderid,
    orderdate,
    productid,
    sales,
    ROUND(AVG(COALESCE(sales, 0)) OVER(), 2) total_avg,
    ROUND(AVG(sales) OVER(PARTITION BY productid), 2) total_avg_by_products
FROM sales.orders;
--=======================  
-- Find the average scores of customers
-- Additionally provide details such customer id and last name
--=======================
SELECT lastname,
    score,
    ROUND(AVG(COALESCE(score, 0)) OVER(), 2) avg_score
FROM sales.customers;
--=======================  
-- Find all orders where salses are higher than the average sales across all orders.
--=======================
SELECT *
FROM (
        SELECT orderid,
            orderdate,
            productid,
            sales,
            AVG(COALESCE(sales, 0)) OVER() total_avg
        FROM sales.orders
    ) t
WHERE t.sales > t.total_avg;