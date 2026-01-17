-- CALCULATIONS
------------------------------------
-- DATEADD
/*
 Adds or subtracts a specific time intereval to/from a date
 
 SELECT '2025-01-01'::date + INTERVAL '5 days';
 SELECT '2025-01-01'::date + INTERVAL '2 months';
 SELECT '2025-01-01'::date + INTERVAL '1 year';
 
 SELECT NOW() + INTERVAL '3 hours';
 SELECT NOW() + INTERVAL '45 minutes';
 */
--DATE ADD
SELECT orderid,
    orderdate,
    (orderdate - INTERVAL '10 days')::DATE as ten_days_before,
    (orderdate + INTERVAL '3 months')::DATE as three_months_later,
    (orderdate + INTERVAL '2 years')::DATE AS two_years_later
from sales.orders;
------------------------------------
/*
 -- DATEDIFF
 -- DATEDIFF allow us to find the difference between two dates.
 
 SELECT age('2025-01-10', '2020-05-05');
 SELECT DATE_PART('year', age('2025-10-01', '2018-01-01'));
 */
--================================
-- TASK
-- Calculate the age of employees
--================================
SELECT employeeid,
    birthdate,
    NOW()::DATE AS current_date,
    -- DATE_PART('year', AGE(NOW(), birthdate)) age
    DATE_PART('year', AGE(CURRENT_DATE, birthdate)) age
from sales.employees;
------------------------------------------
--====================================
-- Find the avarage shipping duration in days for each month
--====================================
SELECT TO_CHAR(orderdate, 'Mon YYYY') AS month,
    AVG(DATE_PART('days', AGE(shipdate, orderdate))) avg_shipping
from sales.orders
GROUP BY TO_CHAR(orderdate, 'Mon YYYY');
--====================================
-- Find the number of days between each order and previous order.
--====================================
/*
 SYNTAX:
 LAG(column_name) OVER (window_definition)
 */
SELECT orderid,
    orderdate AS current_order_date,
    LAG(orderdate) OVER (
        ORDER BY orderdate
    ) previous_order_date
from sales.orders;
-- LAG() returns the value from the previous row.
-- Here, it fetches the orderdate of the previous order.
-- OVER (ORDER BY orderdate), This defines how rows are ordered before applying LAG().