-- UPDATE
/*
 We can use the command UPDATE in order to change the content of already existing rows. INSERT going to go and insert completely new rows, but UPDATE going to go and change the data of already existing row.
 */
--=======================
-- SYNTAX
--=======================
/*
 UPDATE <table_name> SET column1 = value1, column2 = value2 WHERE <condition>
 */
-- NOTE: Always use where to avoid UPDATING all rows unintentionally.
--=======================
-- Change the score of customer with ID 6 to 0
--=======================
UPDATE customers
SET score = 0
WHERE id = 6;
-- CAUTION: Without a WHERE, all rows will be updated!!
-- BEST PRACTICE: Check with SELECT before running UPDATE to avoid updating the wrong data
--=======================
-- Change the score of customer with ID 10 to 0 and update the country to 'UK'
--=======================
UPDATE customers
SET score = 0,
    country = 'UK'
WHERE id = 10;
-- We can update multiple columns too.
--=======================
-- UPDATE all customers with a NULL score by setting their score to 0
--=======================
UPDATE customers
SET score = 0
WHERE score is NULL;
-- We can't write score = NULL, We have to write it like score IS NULL
-- This condition score = NULL is never true, because NULL means “unknown”.