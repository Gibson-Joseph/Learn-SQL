-- Window SUM 
/*
 Returns the sum of values within a window.
 It ignore the NULL in the calculation.
 It allow only integer (number).
 */
--=======================  
-- Find the total sales across all orders.
-- Find the total sales for each products.
-- Additionaly provide details such as order Id, order date
--=======================
SELECT orderid,
    orderdate,
    productid,
    sales,
    SUM(sales) OVER() total_sales,
    SUM(sales) OVER(PARTITION BY productid) total_sales_by_product
FROM sales.orders;
--=======================  
-- Find the precentage contribution of each prdouct's sales to the total sales.
--=======================
SELECT orderid,
    productid,
    sales,
    SUM(sales) OVER() total_sales,
    ROUND(
        sales::numeric / SUM(sales) OVER() * 100,
        2
    ) avg_sales_contribution_by_products
from sales.orders;