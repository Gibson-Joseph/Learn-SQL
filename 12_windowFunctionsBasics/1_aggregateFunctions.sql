-- Aggregate Functions.
/*
 The aggregate functions, they accept multiple rows as an input and the output of the aggregate function usually is one single value.
 
 1. COUNT 
 It can go and COUNT the number of rows inside our table. So if you apply the COUNT funciton on this data it's going to go and start counting like how many rows do we have. So as you can see we don't really care about the content of the tables, SQL is just counting how many rows.
 
 2. SUM 
 If you go and apply the SUM function, it's going to go and summarize all the 'sales' and return at the end the total sales. So as you can see the aggregate function accepts multiple rows multiple values and the output going to be one single value the aggregated value.
 
 3. AVG - Find Average Salse?
 If you apply it one the sales it's going to go and summarize all those and divide it by the number of values.
 
 4. MAX - Find the highest sales?
 Once you apply it, it's going to go and start searching for the highest value inside our table. So this time we are not really aggregating the data into someting new, it's like searching for the highest value between multiple values.
 
 5. MIN - Find the Lowset Sales?
 If you apply it as well, the same thing is going to go and start searching for the lowest value in the sales.
 */
--
-- \c learn_db
--=============================
-- Find the total number or orders
--=============================
SELECT COUNT(*) AS total_num_orders
FROM orders;
--
--=============================
-- Find the total sales of all orders
--=============================
SELECT SUM(sales) as total_sales_amout
FROM orders;
--
--=============================
-- Find the average sales of all orders
--=============================
SELECT AVG(sales) as avg_sales
FROM orders;
--
--=============================
-- Find the highest sales of all orders
--=============================
SELECT MAX(sales) as highest_sale
FROM orders;
--
--=============================
-- Find the lowest sales of all orders
--=============================
SELECT MIN(sales) as lowest_sale
FROM orders;
--
--=============================
-- All in one query statement
--=============================
SELECT COUNT(*) AS total_num_orders,
    SUM(sales) as total_sales_amout,
    AVG(sales) as avg_sales,
    MAX(sales) as highest_sale,
    MIN(sales) as lowest_sale
FROM orders;
----
-- But now don't forget about the aggregate functions. If you combine it with a GROUP BY then you will breaking those big numbers into something like you are aggregating by the customer ID, maybe by a date, by a country. So anything you specifiy with a GROUP BY is going to break those big numbers into smaller number based on the column that you are using.
SELECT customer_id,
    COUNT(*) AS total_num_orders,
    SUM(sales) as total_sales_amout,
    AVG(sales) as avg_sales,
    MAX(sales) as highest_sale,
    MIN(sales) as lowest_sale
FROM orders
GROUP BY customer_id;
--
--=============================
-- Analyze the scores in customers table.
--=============================
SELECT country,
    COUNT(*) AS num_score,
    SUM(score) AS total_score,
    MIN(score) AS min_score,
    MAX(score) AS max_score,
    AVG(score) AS avg_score
from customers
GROUP BY country;