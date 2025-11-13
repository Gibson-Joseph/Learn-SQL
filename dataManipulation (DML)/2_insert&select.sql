-- INSERT using SELECT
-- ===========================
-- Copy data from 'customers' table into persons
-- ===========================
/* In SQL, you can use an INSERT INTO ... SELECT statement to insert data from one table (or query) into another table — instead of manually specifying values.
 */
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT id,
    first_name,
    NULL,
    'Unknown'
FROM customers;
/*
 First you have to write a query from the source table in order to collect the data that you need, and then you can go and insert it into the target table.
 */