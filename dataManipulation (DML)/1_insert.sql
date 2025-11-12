-- INSERT 
-- INSERT command going to go and add new rows to your table and of course not always the table must be empty to add your data. You can add new rows to already existing data and SQL going to go and append it end fo the table.
/*
 Approach 1
 This first and the classical way in order to INSERT new data we can use the INSERT command and manually sepecifying the values that should inserted to the table.
 So this process you are manually inserting new values to the table using like an SQL scripts.
 */
/*
 Syntax:
 INSERT INTO table_name (column1, column2, column3, ...)
 VALUES (value1, value2, value3, ...), -- Mulitple row insert seperated by comma 
 VALUES (value1, value2, value3, ...)
 */
-- OPTIONAL: If no columns are specified, SQL expects values for all columns
-- So if you don't specify the columns of the table SQL goint to expect you to insert vlaues into each column because sometimes of course we don't want to insert values for each column, you can skip few columns.
-- RULE: Match the number of COLUMNS and VALUES
-- RULE: Matching Data Types, Columns count & Constraints
INSERT INTO customers (id, first_name, country, score)
VALUES (6, 'Anna', 'USA', null),
    (7, 'Sam', Null, 100);
-- NULL means nothing
-- CAUTION: Columns and values must be in the same order
SELECT *
FROM customers;
-- NOTE: You can skip the columns if you insert values for every column.
INSERT INTO customers
VALUES (9, 'Andreas', 'Germany', Null);
-- TIP: Always list columns explicitly for clarity and maintainability
-- We can add the specific columns too.
-- NOTE: Columns not included in INSERT  become NULL (unless a default or constraint exists), So you can skip the only nullable columns.
INSERT INTO customers (id, first_name)
values (10, 'Sahra');