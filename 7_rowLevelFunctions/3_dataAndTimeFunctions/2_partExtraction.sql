--=============================
-- 1. Part Extraction
--=============================
/*
 1. EXTRACT
 2. DATE_PART
 3. TO_CHAR
 4. DATETRUNC
 */
/*
 SYNTAX
 
 EXTRACT(YEAR FROM timestamp) ==>> returns the day from a date
 EXTRACT(MONTH FROM timestamp) ==>> returns the month from a date
 EXTRACT(DAT FROM timestamp) ==>> returns the year from a date
 
 return a specific part of timestamp
 */
SELECT creationtime,
    EXTRACT(
        YEAR
        FROM creationtime
    ) AS year,
    EXTRACT(
        MONTH
        FROM creationtime
    ) AS month,
    EXTRACT(
        DAY
        FROM creationtime
    ) AS day,
    EXTRACT(
        HOUR
        FROM creationtime
    ) AS hour,
    EXTRACT(
        MINUTE
        FROM creationtime
    ) AS minute,
    EXTRACT(
        SECOND
        FROM creationtime
    ) AS second
FROM sales.orders;
--==========================
-- DATE_PART
-- Retruns a specific part of a date as a number
-- We could extract such as week, quarter and so on.
--==========================
/*
 SYNTAX
 DATE_PART(part, date)
 
 EXAMPLE
 DATE_PART(month, order_date)
 
 NOTE: We can use the abbrevation of part.
 DATE_PART(mm, '2025-08-12')
 */
SELECT creationtime,
    DATE_PART('year', creationtime) AS year,
    DATE_PART('month', creationtime) AS month,
    DATE_PART('day', creationtime) AS day,
    DATE_PART('hours', creationtime) AS hour,
    DATE_PART('minutes', creationtime) AS minute,
    DATE_PART('seconds', creationtime) AS second
from sales.orders;
-------------------------------------------------
SELECT creationtime,
    DATE_PART('quarter', creationtime) as quarter,
    DATE_PART('week', creationtime) as week
FROM sales.orders;
--==========================
-- DATENAME 
-- Retruns the name of a specific part of a date
-- And the datatype of the output is string
-- SYNTAX
-- TO_CHAR(date, part)
-- TO_CHAR('2025-08-12', 'mounth')
--==========================
SELECT creationtime,
    TO_CHAR(creationtime, 'day'),
    TO_CHAR(creationtime, 'month')
from sales.orders;
----------------------------------------
/*
 DATE_TRUNC
 
 Truncates the date to the specific part
 The output will always timestamp
 
 SYNTAX:
 DATE_TRUNC(part, date)
 
 hierarchy: year - month - day - hours - minutes - seconds
 We have hierarcy where we start with the highest from the year to seconds.
 So the DATE_TRUNC is going to allow us to change this level of details of this date information by specifying the level of detail.
 
 Let's take for example if we say the DATE_TRUNK minutes. So we are saying we are intereseted only at the minutes level we are not interested with the seconds. So everything between the year and the minutes going to be kept. That means all those information will not be changed but only the seconds going to be reseted.
 
 SELECT DATE_TRUNC('month', NOW());
 OUTPUT: 2025-11-01 00:00:00
 */
select creationtime,
    DATE_TRUNC('month', creationtime) AS month,
    DATE_TRUNC('day', creationtime) AS day,
    DATE_TRUNC('hour', creationtime) AS hour,
    DATE_TRUNC('minute', creationtime) AS minute
from sales.orders;
----------------------------------------
-- Aggregate the data by month level
SELECT DATE_TRUNC('month', creationtime) AS creation,
    COUNT(*)
FROM sales.orders
GROUP BY DATE_TRUNC('month', creationtime);
-- Aggregate the data by year level
SELECT DATE_TRUNC('year', creationtime) AS creation,
    COUNT(*)
FROM sales.orders
GROUP BY DATE_TRUNC('year', creationtime);
--------------------------------------------
-- ========================================
-- TASK
-- How many orders were placed each year?
-- ========================================
SELECT DATE_TRUNC('year', orderdate) AS year,
    COUNT(*) number_of_order
from sales.orders
GROUP BY DATE_TRUNC('year', orderdate);
SELECT COUNT(*) count
FROM sales.orders
GROUP BY EXTRACT(
        MONTH
        FROM orderdate
    )
HAVING EXTRACT(
        MONTH
        FROM orderdate
    ) = 2;
-- (Or)
SELECT EXTRACT(
        MONTH
        FROM orderdate
    ) AS month,
    COUNT(*) AS number_of_order
from sales.orders
GROUP BY EXTRACT(
        MONTH
        FROM orderdate
    );
-- (Or)
SELECT TO_CHAR(DATE_TRUNC('month', orderdate), 'month') AS month,
    COUNT(*) AS number_of_order
FROM sales.orders
GROUP BY TO_CHAR(DATE_TRUNC('month', orderdate), 'month');
--==================================
-- TASK
-- Show all orders that were placed during the month of february
--==================================
SELECT *
FROM sales.orders
WHERE EXTRACT(
        MONTH
        FROM orderdate
    ) = 2;