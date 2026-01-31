-- Window LEAD and LAG
/*
 The LEAD function can allow you to access a value fromt he next row within a window.
 The LAG function is exactly oposite. it can allow you to access a value from the previous row within a window.
 
 SYNTAX:
 LEAD(expr, offset, default_value) OVER(PARTITION BY product_id ORDER_BY order_date)
 expr - Expression is required (Any Data Type) 
 offset - Number of rows forward or backward from current row and the default is 1. And this is optional.
 default_value - Returns default value if next/previous row is not available! The default value is NULL. And this is optional.
 */
-- Use Case: Month-Over-Month (MoM)
/*
 Time Series Analysis
 It is the method of analyzing our business, our data in order to understand the patterns, trends and behavious over the time.
 */
--======================================
-- Analyze the month-over-month performance by finding the percentage change in sales between the current and previous months
--======================================
SELECT *,
    current_month_sales - previous_month_sales AS mom_change,
    ROUND(
        (
            (current_month_sales - previous_month_sales)::numeric / previous_month_sales
        ) * 100,
        1
    ) AS mom_change_percentage
FROM (
        SELECT DATE_TRUNC('month', orderdate)::date AS order_month,
            SUM(sales) AS current_month_sales,
            LAG(SUM(sales)) OVER (
                ORDER BY DATE_TRUNC('month', orderdate)::date
            ) AS previous_month_sales
        FROM sales.orders
        GROUP BY DATE_TRUNC('month', orderdate)::date
    ) t;
/*
 Customer Retentions Analysis
 Mesure customer 's behavior and loyalty to help businesss build strong relationships with customers.
 */
--=================================
-- In order to analyze customer loyalty, rank customers based on the average days between their orders.
--=================================
SELECT customerid,
    ROUND(AVG(days_until_next_order)) avg_days,
    RANK() OVER(
        ORDER BY ROUND(AVG(days_until_next_order))
    ) rank_avg
FROM (
        SELECT orderid,
            customerid,
            orderdate AS current_order,
            LEAD(orderdate) OVER(
                PARTITION BY customerid
                ORDER BY orderdate
            ) next_order,
            LEAD(orderdate) OVER(
                PARTITION BY customerid
                ORDER BY orderdate
            ) - orderdate AS days_until_next_order
        FROM sales.orders
    ) t
GROUP BY customerid;
--
--=====================================
-- Find the average shipping duration in days for each month
--=====================================
SELECT DATE_TRUNC('month', orderdate)::DATE,
    ROUND(AVG(shipdate - orderdate)) AS avg_ship
FROM sales.orders
GROUP BY DATE_TRUNC('month', orderdate)::DATE
ORDER BY DATE_TRUNC('month', orderdate)::DATE;
--
-- Time Gap Analysis
--=====================================
-- Find the number of days betweeen each order and the previous order.
--=====================================
SELECT orderid,
    orderdate AS current_order_date,
    LAG(orderdate) OVER(
        ORDER BY orderdate
    ) previous_order_date,
    orderdate - LAG(orderdate) OVER(
        ORDER BY orderdate
    ) AS days_between_next_order
FROM sales.orders;