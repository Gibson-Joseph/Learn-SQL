-- STRING CALCULATION
/*
 LENGTH
 
 The LENGTH() function is used to calculate the number of characters in a string.
 It returns a numeric value.
 Counts how many characters.
 */
-- ======================================
-- Calculate the length of each customer's first name
-- ======================================
SELECT first_name,
    LENGTH(first_name) AS len_name
FROM customers;