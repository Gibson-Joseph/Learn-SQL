-- Table: customers
drop TABLE IF EXISTS customers;
CREATE TABLE customers(
    id INT not NULL,
    first_name VARCHAR(50) not NULL,
    country VARCHAR(50),
    score INT,
    constraint pk_customers primary key (id)
);
--======================
-- Insert customers data
--======================
INSERT INTO customers(id, first_name, country, score)
values (1, 'Maria', 'Germany', 350),
    (2, ' John', 'USA', 900),
    (3, 'Georg', 'UK', 750),
    (4, 'Martin', 'Germany', 500),
    (5, 'Peter', 'USA', 0);