-- Create Partitioned Table
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/47105383#overview
/*
 */
-- Parent table
CREATE TABLE sales.orders_partitioned (
    order_id INT,
    order_date DATE,
    amount INT
) PARTITION BY RANGE (order_date);
--

-- Partitions
CREATE TABLE orders_2025_jan PARTITION OF sales.orders_partitioned FOR
VALUES
FROM ('2025-01-01') TO ('2025-02-01');
--
CREATE TABLE orders_2025_feb PARTITION OF sales.orders_partitioned FOR
VALUES
FROM ('2025-02-01') TO ('2025-03-01');
--

-- Default partition
CREATE TABLE orders_default PARTITION OF sales.orders_partitioned DEFAULT;
--

-- Insert
INSERT INTO sales.orders_partitioned
VALUES (1, '2025-02-10', 500);
--
SELECT * FROM sales.orders_partitioned;
-- 
-- Check partition
SELECT tableoid::regclass,
    *
FROM sales.orders_partitioned;
--     tableoid     | order_id | order_date | amount
-- -----------------+----------+------------+--------
--  orders_2025_jan |        1 | 2025-01-10 |    500
-- (1 row)