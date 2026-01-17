-- FORMAT EXTRACTING
/*
 1. TO_CHAR
 2. CAST
 */
/*
 1. What is DATE FORMAT? 
 Date formatting means changing how a date looks without changing the actual date value stored in the database.
 
 Example:
 Actual stored value: 2025-11-19 17:00:00
 Formatted output: November 19, 2025
 
 Or: 19-11-2025
 Or: Wednesday
 
 ------------------------------------------------------------- 
 2. What are FORMATING & CASTING?
 Changing the format of a value from one to another. So we are changing how the data looks like.
 ------------------------------------------------------------- 
 
 3. What is CASTING?
 Change the data type from one to another.
 */
/*
 TO_CHAR 
 
 Date formatting means changing how a date looks without changing the actual date value stored in the database.
 
 SYNTAX:
 TO_CHAR(date_value, 'format_pattern')
 SELECT TO_CHAR(NOW(), 'Month DD, YYYY');
 */
SELECT orderid,
    creationtime,
    TO_CHAR(creationtime, 'dd') dd,
    -- 01
    TO_CHAR(creationtime, 'Dy') day3_char,
    --Wed or Sun
    TO_CHAR(creationtime, 'day') AS day,
    -- Wednesday or Sunday
    TO_CHAR(creationtime, 'mm') mm,
    -- 02
    TO_CHAR(creationtime, 'Mon') mon,
    -- Jan or Feb
    TO_CHAR(creationtime, 'month') AS month -- January or Febraury
FROM sales.orders;
------------------------------------- 
SELECT orderid,
    creationtime,
    TO_CHAR(creationtime, 'mm-dd-yyyy') usa_format,
    TO_CHAR(creationtime, 'dd-mm-yyyy') euro_format,
    TO_CHAR(creationtime, 'dd/mm/yyyy') slash_format,
    TO_CHAR(creationtime, 'mon dy yyyy') usa_format,
    TO_CHAR(creationtime, 'month day yyyy') usa_format
FROM sales.orders;
-------------------------------------
--Task
-- Show CreationTime using the following format:
-- Day Wed Jan Q1 2025 12:34:56 PM
-------------------------------------
SELECT orderid,
    CONCAT(
        'Day ',
        TO_CHAR(creationtime, 'Dy Mon'),
        ' Q',
        DATE_PART('quarter', creationtime),
        ' ',
        TO_CHAR(creationtime, 'YYYY HH12:MI:SS AM')
    ) AS formatted_creationtime
from sales.orders;
--------------------------------------
SELECT TO_CHAR(orderdate, 'Mon yy') order_date,
    COUNT(*)
FROM sales.orders
GROUP BY TO_CHAR(orderdate, 'Mon yy');
-----------------------------------------------------------------
--CAST 
/*
 CAST a date or time value to a different data type & Formats the value.
 PostgreSQL Equivalent for CONVERT (CAST)
 
 Use CAST() or the shorthand :: operator:
 
 SELECT CAST('2025-11-19' AS DATE);
 SELECT '2025-11-19'::DATE;
 
 
 CAST is a SQL operation used to convert a value from one data type to another.
 1. It does NOT change the original data in the table;
 2. It only changes how the value behaves in that query.
 */
SELECT creationtime,
    CAST('123' AS INT) AS str_to_int_convert,
    CAST(123 AS VARCHAR) AS int_to_str_convert,
    CAST('2025-08-20' AS TIMESTAMP) str_to_timestamp,
    CAST(creationtime AS DATE) formated_creation_time
from sales.orders;