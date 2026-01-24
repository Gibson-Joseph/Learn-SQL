--==========================
-- Use Case: Mapping values.
--==========================
/*
 Transform the values from one form to another.
 
 One scenario of mapping values is that sometimes the database developers stores the data and vlues inside the database as codes and as flags.
 
 So for example, the status of the order could be stored as 1 and 0 instead of having inactive and active. And this is one technique in order to optimize the performance of the database for the application. Because 1 and 0 is way faster than storing the whole string.
 
 But in theat anylysis, we usually generate a report to be read by human, by persons. And now instead of showing the data as 0 and 1, it's going to be more nicer and readable. So for this scenarios we're going to go and use the case statement in order to translate those critical and technical values into readable terms.
 */
--==========================
-- Task
-- Retrieve employee details with gender displayed as "full text"
--==========================
SELECT employeeid,
    firstname,
    lastname,
    gender,
    CASE
        WHEN gender = 'M' THEN 'Male'
        WHEN gender = 'F' THEN 'Female'
        ELSE 'Not Available'
    END gender_full_text
FROM sales.employees;
--==========================
-- Task
-- Retrieve customer details with abbreviated country code.
--==========================
SELECT customerid,
    firstname,
    lastname,
    country,
    CASE
        WHEN country = 'Germany' THEN 'DE'
        WHEN country = 'USA' THEN 'US'
        ELSE 'N/A'
    END country_abbr
FROM sales.customers;
--==========================
-- CASE STATEMENT
-- Quick Form syntax
-- Now there is a special case for the syntax of the case statements, if you are using it for mapping values. So now let's say that we have a lot of different distinct values inside their country. And if you are mapping the values using the case, when you're going to end up always writing the same thing, country = germany, country = india, country = united states and so on. So we are always using the column country. So the condition is always using one column and its always the operator is equal. So now for this scenario we have another syntax for the case statements. And its looks like the below.
--==========================
SELECT customerid,
    firstname,
    lastname,
    country,
    CASE
        country
        WHEN 'Germany' THEN 'DE'
        WHEN 'USA' THEN 'US'
        ELSE 'N/A'
    END contry_abbr
FROM sales.customers;
-- And of course the restriction and limitation using the "quick format" is that you can use only one column and it's only fo r the equal operator. So that means only for these scenarios you can go and use the "quick format".