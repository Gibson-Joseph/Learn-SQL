-- Window Funcitons Vs GROUP BY
/*
 Window functions or sometime we call them analytical functions. They are very important functions in SQL.
 
 What are SQL window functions?
 👉 Window functions perform calculations across a set of rows related to the current row, without collapsing rows like GROUP BY does.
 
 👉 You get aggregates + row-level detail at the same time.
 
 👉 They are functions that allows you to do calculations like aggregations, but on top of subset of data without losing the level of details or rows. So it is something very similar to the GROUP BY, but here we have special case, you don't lose the level of details.
 */
--===================================
-- Find the total sales across all orders
--===================================
SELECT SUM(sales)
FROM sales.orders;
--===================================
-- Find the total sales for each prodcuts
--===================================
SELECT productid,
    SUM(sales) total_sales
FROM sales.orders
GROUP BY productid;
-- here we have spliting the data at the level of productId.
--===================================
-- Find the total sales for each prodcut, additionally provide details such order id & order date.
--===================================
-- Wrong query - 1
SELECT productid,
    orderid,
    orderdate,
    SUM(sales) total_sales
FROM sales.orders
GROUP BY productid;
-- ERROR:  column "orders.orderid" must appear in the GROUP BY clause or be used in an aggregate function
-- LINE 2:     orderid,
--             ^
-- Wrong query - 2 (Here we have got the wrong info, becuase here we have aggregate that in orderId, orderDate level)
SELECT productid,
    orderid,
    orderdate,
    SUM(sales) total_sales
FROM sales.orders
GROUP BY productid,
    orderdate,
    orderid;
-- GROUP BY limits: Can't do aggregations and provide details at same time.
--
SELECT SUM(sales) OVER() from sales.orders; -- Now we're going to tell SQL this is a window functions using OVER after the aggregations or functions tells, we are talking about window functions.
-- Window functions returns a result for each row. So we have total sales or all orders for each row.
-- So as you can see SQL understands this is a window function and SQL should not like group all the data in one row, It should keep exactly the same rows or same number of rows like the input.
--
SELECT orderid, orderdate, productid, SUM(sales) OVER(PARTITION BY productid) total_sales_by_products FROM sales.orders; -- Now we're going to use the keyword PARTITION BY, it's like the group by, but another wording.
-- So now as you can see in the output we still have the same number of rows. We have ten orders, we have ten rows. But the result did change because now we are aggregating the data at the level of product ID.
--
-- GROUP BY - Simple Data Analysis(Aggregations)
-- WINDOW - Advanced Data Analysis (Aggregations + Details)