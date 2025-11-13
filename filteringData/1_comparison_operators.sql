-- Comparision Operators
-- What is exactly comparison operators?
-- We want to compare two things and there is a lot of things we can compare in SQL.
--===================================
-- FORMULA
-- <Expression> <Operator> <Expression>
--===================================
/*
 Scenario -1
 -----------------
 
 We can compare one column to another column.
 
 column1 = column2
 first_name = last_name
 
 So both of the expression are columns here.
 */
/*
 Scenario -2
 -----------------
 
 We can compare a column with a staic value,
 
 column1 = value
 first_name = 'John'
 */
/*
 Scenario -3
 -----------------
 
 We can apply the function to column and then compare the results to maybe a value. 
 
 Function = value
 UPPER(first_name) = 'JOHN'
 */
/*
 Scenario -4
 -----------------
 
 You can write an expression in one of the sides like for example like below 
 
 Expresion = value
 price * Quentity = 1000
 */
/*
 Scenario -5
 -----------------
 
 We can inculde a whohle query the complate query to one of the sides and we call this a SUBQUERY. So One of the sides you're goint to write a whole query
 
 Subquery = value
 (SELECT AVG(sales) from orders) = 1000
 */
-- = --> Checks if two values are equal
--====================================
-- Retrive all customers from Germany
--====================================
SELECT *
FROM customers
WHERE country = 'Germany';
-- != or <> --> Checks if two values are not equal
--====================================
-- Retrive all customers not from Germany
--====================================
-- SELECT *
-- FROM customers
-- WHERE country != 'Germany'
-- (OR)
SELECT *
FROM customers
WHERE country <> 'Germany';
-- > --> Checks if a value is greater than another one.
--====================================
-- Retrive all customers with a score greater than 500
--====================================
SELECT *
FROM customers
WHERE score > 500;
-- >= --> Checks if a value is greater than or equal to another one.
--====================================
-- Retrive all customers with a score of 500 or more
--====================================
SELECT *
FROM customers
WHERE score >= 500;
-- < --> Checks if a value is less than another value
--====================================
-- Retrive all customers with a score less than 500
--====================================
SELECT *
FROM customers
WHERE score < 500;
-- <= --> Checks if a value is less than or equal to another value
--====================================
-- Retrive all customers with a score less than or equal 500
--====================================
SELECT *
FROM customers
WHERE score <= 500;