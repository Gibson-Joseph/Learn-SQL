-- Window NTILE()
-- REF: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/43751826#overview
--

/*
 It going to go and divide you rows, your data into specific number of almost qual groups or sometimes we call them Buckets.
 
 FORMULA:
 Bucket Size = Number of Rows / Number of Buckets
 
 SYNTAX
 NTILE(bucketNumber) OVER (ORDER BY Sales DESC)
 
 In the NTILE function we must define the number. So we cannot leave it empty like the other ranking function.
 
 SQL RULE: Larger groups come first
 
 So you don't have here perfectly sized buckets, you have approimately or roughly equal sized buckets.
 */
select orderid,
    sales,
    ntile(10) over(
        order by sales desc
    ) AS ten_bucket,
    ntile(4) over(
        order by sales desc
    ) AS four_bucket,
    ntile(3) over(
        order by sales desc
    ) AS three_bucket,
    ntile(2) over(
        order by sales desc
    ) AS two_bucket,
    ntile(1) over(
        order by sales desc
    ) AS one_bucket
from sales.orders;
--
--
/*
 -- NTILE USE CASE
 
 1. Data segmentation (Data analysist)
 2. Equalizing load processing (Data engineer)
 
 Data segmentation (Data analysist)
 Divides a dataset into distinct subsets based on certain criteria. Fo example, you can go and group up you customers depend or their behavior like the total sales or the total number or orders. So with that you can make like ofr example VIP section and then Medium and then the Low.
 */
-- Data segmentation
--===============================
-- Segment all orders into 3 categories: high, medium and low sales.
--===============================
SELECT *,
    CASE
        WHEN bucket = 1 THEN 'High'
        WHEN bucket = 2 THEN 'Medium'
        WHEN bucket = 3 THEN 'Low'
    END
FROM (
        SELECT orderid,
            productid,
            sales,
            NTILE(3) OVER(
                ORDER BY sales DESC
            ) bucket
        FROM sales.orders
    ) t;
--
-- Equalizing load processing
--===============================
-- in order to export the data, divide the orders into 2 groups.
--===============================
SELECT NTILE(2) OVER(
        ORDER BY orderid
    ) AS bucket,
    *
FROM sales.orders;