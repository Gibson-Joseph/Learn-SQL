-- Use Case: Top/Bottom N Analysis
--
-- Top n analysis
--=================================
-- Find the top highest sales for each product.
--=================================
SELECT *
FROM (
        SELECT orderid,
            productid,
            sales,
            ROW_NUMBER() OVER(
                PARTITION BY productid
                ORDER BY sales DESC
            ) product_rank
        FROM sales.orders
    ) t
WHERE t.product_rank = 1;
--
-- Bottom n analysis
--=================================
-- Find the lowest 2 customers based on their total sales.
--=================================
-- When I try
SELECT *
FROM (
        SELECT *,
            ROW_NUMBER() OVER (
                ORDER BY t.total_sales
            ) AS rank
        FROM (
                SELECT customerid,
                    SUM(sales) total_sales
                FROM sales.orders
                GROUP BY customerid
            ) t
    ) e
WHERE e.rank IN (1, 2);
-- In Udemy
SELECT *
FROM(
        SELECT customerid,
            SUM(sales) total_sales,
            ROW_NUMBER() OVER(
                ORDER BY SUM(sales)
            ) rank
        FROM sales.orders
        GROUP BY customerid
    ) t
WHERE t.rank <= 2;