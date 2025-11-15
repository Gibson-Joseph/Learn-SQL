-- Search Operator
-- Search operators are used when you want to search text inside a column.
-- % ==> use a percentage you are saying anyting. So we are going to anything. So It could be no character at all or only one character or many charatcters. So we are saying anything.
-----------------------------------------------------
-- _ ==> If you use underscore you are expecting to have exactly one thing like one character or one number, So it is exactly one.
-- the % is way more famous than _
-----------------------------------------------------
--  `%`     Matches any number of characters 
--  `_`     Matches exactly one character
-----------------------------------------------------
-- Starts with:
-- Ends with:
-- Contains:
----------------------------------------------------
-- Find all customers whose first name START WITH 'M'
SELECT *
FROM customers
WHERE first_name like 'M%';
-- Find all customers whose first name END WITH 'n'
SELECT *
FROM customers
WHERE first_name like '%n';
-- Find all customers whose first name CONTAINS 'N'
SELECT *
FROM customers
WHERE first_name like '%r%';
-- Find all customers whose first name has 'r' in the third possition.
SELECT *
FROM customers
WHERE first_name like '__r%';