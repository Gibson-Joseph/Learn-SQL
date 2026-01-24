-- Window Partition By
/*
 How to define a window inside the OVER Clause?
 The first part that we can define is the PARTITION BY. It's very similar to the GROUP BY and other wording. So the first part is going to be the PARTITION Cluase.
 
 What it's going to do it's going to divide the entire data sets into groups or you can call it windows partitions. So here we tell SQL how to divide our data. 
 And Here we have two options.
 
 OPTION - 1
 So if we don't use anything so we have it empty like SUM(sales) OVER(). What can happen? SQL gonna use the entire data in order to do the calculations. So the entire data can be counted as one window. So we are telling SQl don't divide anything, leave it as it is.
 
 OPTION - 2
 The second option that we have is to divide the data by PARTITION BY. So we define the window like this SUM(sales) OVER (PARTITION BY product). So the SQL going to go and divide the entire data into different windows. So this time the calculation the SUM of sales not apply one the etire data set. This time it's going to be applied on the different windows individually.
 */
--================================
-- TASK
-- Find the total sales across all orders. Additionally provide details such order id & order date.
--================================
SELECT SUM(sales)
from sales.orders;
--
SELECT orderid, orderdate,
SUM(sales) OVER() total_sales
FROM sales.orders;
--================================
-- Find the total sales across each product. Additionally provide details such order id & order date.
--================================
SELECT orderid,
    orderdate,
    productid,
    sales,
    SUM(sales) OVER(PARTITION BY productid) total_sales_by_product
from sales.orders;
--================================
-- Find the total sales across all order and Find the total sales across each product. Additionally provide details such order id & order date.
--================================
SELECT orderid,
    orderdate,
    productid,
    sales,
    SUM(sales) OVER(PARTITION BY productid) total_sales_by_product,
    SUM(sales) OVER() total_sales
from sales.orders;
-- Flexibility of WINDOE: Allows aggregation of data at different granularities within the same query.
--
--================================
-- Find the total sales across all order 
-- Find the total sales across each product. 
-- Find the total sales for each combination of product and order status.
-- Additionally provide details such order id & order date.
--================================
SELECT orderid,
    orderdate,
    productid,
    sales,
    orderstatus,
    SUM(sales) OVER() total_sales,
    SUM(sales) OVER(PARTITION BY productid) total_sales_by_product,
    SUM(sales) OVER(PARTITION BY productid, orderstatus) totals_sales_by_product_and_status
from sales.orders;