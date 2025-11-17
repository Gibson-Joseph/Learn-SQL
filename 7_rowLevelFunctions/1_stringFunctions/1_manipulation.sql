-- STRING MANIPULATIONS
/*
 1. CONCAT
 2. UPPER
 3. LOWER
 4. TRIM
 5. REPLACE
 */
-- CONCAT
/*
 Used to combine multiple strings into one.
 
 Syntax
 CONCAT(string1, string2, ...)
 
 SELECT CONCAT(firstname, ' ', lastname) AS full_name FROM customers;
 */
/* 
 Purpose
 
 1. Helps us combine two or more columns
 2. Used for full names, addresses, formatted text
 */
--=======================================
-- Show a list of customers' first names together with their country in one column.
--=======================================
SELECT first_name,
    country,
    CONCAT(first_name, ' ', country) AS name_country
FROM customers;
-------------------------------------------------
-- UPPER & LOWER
-- String functions like UPPER and LOWER help us convert text into a consistent format.
-- UPPER ==>> Converts all characters to UPPERCASE
-- LOWER ==>> Converts all characters to lowercase
--========================================
-- Transform the customer's first name to lowercase
--========================================
SELECT first_name,
    country,
    CONCAT(first_name, '-', country) AS name_country,
    LOWER(first_name) AS low_name
from customers;
--========================================
-- Transform the customer's first name to lowercase
--========================================
SELECT first_name,
    country,
    CONCAT(first_name, '-', country) AS name_country,
    LOWER(first_name) AS low_name,
    UPPER(first_name) AS up_name
from customers;
-------------------------------------------------
-- TRIM
-- The TRIM function is used to remove unwanted spaces or characters from the beginning and end of a string.
-- Removes Leading and Trailing spaces
-- ============================
-- Find customers whose first name contains leading or trailing spaces
-- ============================
SELECT first_name
FROM customers
WHERE first_name != TRIM(first_name);
------------------------------------------------
SELECT first_name,
    LENGTH(first_name) AS len_name,
    LENGTH(TRIM(first_name)) AS len_trim_name,
    LENGTH(first_name) - LENGTH(TRIM(first_name)) AS flag
FROM customers
WHERE LENGTH(first_name) <> LENGTH(TRIM(first_name));
-------------------------------------------------
-- REPLACE
-- The REPLACE function is used to substitute part of a string with another string.
-- It searches for a specific text and replaces it wherever it appears.
-- Replaces specific character with a new character.
-- Not only Replace but also Remove
--=================================
-- Remove dashas (-) from a phone number
--=================================
SELECT '123-456-7890' AS phone,
    REPLACE('123-456-7890', '-', '') AS clean_phone;
SELECT '123-456-7890' AS phone,
    REPLACE('123-456-7890', '-', '/') AS clean_phone;
--=================================
-- Replace File Extence from txt to csv 
--=================================
SELECT 'report.txt' AS old_file_name,
    REPLACE('report.txt', '.txt', '.csv') AS new_file_name;