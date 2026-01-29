-- Use Case: Moving Average
--===================================
-- Calculate the moving average of sales for each product over time
--===================================
SELECT orderid,
    orderdate,
    productid,
    sales,
    AVG(sales) OVER(PARTITION BY productid) AS avg_by_product,
    AVG(sales) OVER(
        PARTITION BY productid
        ORDER BY orderdate
    ) moving_avg
FROM sales.orders;
--
-- (Or)
--

SELECT orderid,
    orderdate,
    productid,
    sales,
    AVG(sales) OVER(PARTITION BY productid) AS avg_by_product,
    AVG(sales) OVER(
        PARTITION BY productid
        ORDER BY orderdate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW -- NOTE: By default this frame will apply when we use the ORDER BY the OVER Clause
    ) moving_avg
FROM sales.orders;
--===================================
-- Calculating the moving average of sales for each prdouct over time, including only the next order.
--===================================
SELECT orderid,
    orderdate,
    productid,
    sales,
    AVG(sales) OVER(
        PARTITION BY productid
        ORDER BY orderdate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) moving_avg,
    AVG(sales) OVER(
        PARTITION BY productid
        ORDER BY orderdate ROWS BETWEEN CURRENT ROW
            AND 1 FOLLOWING
    ) rolling_avg
FROM sales.orders;