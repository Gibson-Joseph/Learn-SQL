-- STRING EXTRACTIONS
/*
 1. LEFT
 2. RIGHT
 3. SUBSTRING
 */
/*
 LEFT & RIGHT
 
 String extraction functions allow us to take a portion of text from the beginning or end of a string.
 */
-- LEFT ==> Extract specific number of characters from the START.
-- RIGHT ==> Extract specific number of characters from the END.
--===============================
-- Retrieve the first two characters of each first name
--===============================
SELECT first_name,
    LEFT(TRIM(first_name), 2) first_2_char
FROM customers;
--===============================
-- Retrieve the last two characters of each first name
--===============================
SELECT first_name,
    LEFT(TRIM(first_name), 2) first_2_char,
    RIGHT(first_name, 2) last_2_char
FROM customers;
--------------------------------------------------------
-- SUBSTRING
/*
 The SUBSTRING function is used to extract part of a string starting from a specific position and for a specific length.
 Extract middle portions of text
 Extracts a part of string at a specified position
 
 SYNTAX:
 SUBSTRING(text, start_position, length)
 */
--=================================================
-- Retrieve a list of customers' first names after removing the first character.
--=================================================
SELECT first_name,
    SUBSTRING(TRIM(first_name), 2, LENGTH(first_name)) AS sub_name
from customers;