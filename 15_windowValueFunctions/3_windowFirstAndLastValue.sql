-- Window FIRST_VALUE and LAST_VALUE
-- REF: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/48564345#overview
/*
 First Value:
 The first value can allow you to access a value from the first row within a window.
 
 Last Value:
 The last value can allow you to access a value from the last row within a window.
 
 We must use ORDER BY 
 
 Default Frame:
 RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.
 
 You can use the FIRST_VALUE function like all window function without defining a frame, you can go with the default and you will get the effect of the first value.
 
 But the LAST_VALUE you have to go and define a frame like the below.
 LAST_VALUE(SALES) OVER (ORDER BY month ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING)
 */
--====================================
-- Find the lowest and highest sales for each product
--====================================
SELECT orderid,
    productid,
    sales,
    FIRST_VALUE(sales) OVER(
        PARTITION BY productid
        ORDER BY sales DESC
    ) highest_sales,
    LAST_VALUE(sales) OVER(
        PARTITION BY productid
        ORDER BY sales DESC ROWS BETWEEN CURRENT ROW
            AND UNBOUNDED FOLLOWING
    ) lowest_sales,
    FIRST_VALUE(sales) OVER(
        PARTITION BY productid
        ORDER BY sales
    ) lowest_sales_option_2
FROM sales.orders;
--====================================
-- Find the lowest and highest sales for each product
-- Find the difference in sales between the current and lowest sales
--====================================
SELECT orderid,
    productid,
    sales,
    FIRST_VALUE(sales) OVER(
        PARTITION BY productid
        ORDER BY sales DESC
    ) highest_sales,
    LAST_VALUE(sales) OVER(
        PARTITION BY productid
        ORDER BY sales DESC ROWS BETWEEN CURRENT ROW
            AND UNBOUNDED FOLLOWING
    ) lowest_sales,
    sales - FIRST_VALUE(sales) OVER(
        PARTITION BY productid
        ORDER BY sales
    ) AS sales_diff_current_to_lowest
FROM sales.orders;