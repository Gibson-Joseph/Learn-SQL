-- Basics of Stored Procedures.
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/47218767#overview
/*
 It has always two parts.
 1. First we have to defind stored procedure. 
 2. Then we have to execute it.
 SYNTAX: (Definition)
 =======
 CREATE PROCEDURE procedure_name AS
 BEGIN
 -- SQL statements
 END;
 
 
 SYNTAX: (Execution Call)
 =======
 EXEC procedure_name
 
 
 
 SYNTAX FOR POSTGRESQL
 =====================
 1. Create SP
 CREATE OR REPLACE PROCEDURE procedure_name(
 OUT column1 datatype,
 OUT column2 datatype
 )
 LANGUAGE plpgsql
 AS $$
 BEGIN
 SELECT column1, column2
 INTO column1, column2
 FROM table_name
 WHERE condition;
 END;
 $$;
 
 
 2. Execute SP
 CALL procedure_name();
 */
-- ==============================
-- STEP 1:
-- For US customers find the total number of customers and the average score
-- ==============================
SELECT COUNT(*) total_customer,
    AVG(score) avg_score
FROM sales.customers
WHERE country = 'USA';
--
-- ==============================
-- STEP 2:
-- Turning the query into a stored procedure
-- ==============================
CREATE OR REPLACE PROCEDURE get_customers_summary(
        OUT total_customer NUMERIC,
        OUT avg_score NUMERIC
    ) LANGUAGE plpgsql AS $$ BEGIN
SELECT COUNT(*),
    AVG(score) INTO total_customer,
    avg_score
FROM sales.customers
WHERE country = 'USA';
END;
$$;
--====>>Output:
-- CREATE PROCEDURE
--<<====
-- To List the SP
-- \df
--                                               List of functions
--  Schema |         Name          | Result data type |               Argument data types                | Type
-- --------+-----------------------+------------------+--------------------------------------------------+------
--  public | get_customers_summary |                  | OUT total_customer bigint, OUT avg_score numeric | proc
-- (1 row)
--
-- To Execute 
CALL get_customers_summary(NULL, NULL);
-- salesdb=# call get_customers_summary(NULL, NULL);
--  total_customer |      avg_score
-- ----------------+----------------------
--               3 | 825.0000000000000000
-- (1 row)
-- 
-- To Delete SP
DROP PROCEDURE get_customers_summary;
-->>>>>> 
-- OUTPUT
-- DROP PROCEDURE
--<<<<<<