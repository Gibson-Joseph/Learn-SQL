DROP TABLE if EXISTS orders;
CREATE TABLE orders(
    order_id INT not NULL,
    customer_id INT not NULL,
    order_date DATE,
    sales INT,
    constraint pk_orders primary key(order_id)
);
-- Insert orders data
INSERT INTO orders (order_id, customer_id, order_date, sales)
VALUES (1001, 1, '2021-01-11', 35),
    (1002, 2, '2021-04-05', 15),
    (1003, 3, '2021-06-18', 20),
    (1004, 6, '2021-08-31', 10);