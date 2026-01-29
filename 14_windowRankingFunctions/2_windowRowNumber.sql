-- Window ROW_NUMBER
/*
 In SQL, the ROW_NUMBER function going to go and assign for each row a unique number as a rank and it doesn't care at all the the ties. That means if you have two row sharing the same vlaue, they will not share the same rank. So the ROW_NUMBER have a distinct rank.
 */
--==============================
-- Rank the orders based on their sales from highest to lowest.
--==============================
SELECT orderid,
    productid,
    sales,
    ROW_NUMBER() OVER(
        ORDER BY sales DESC
    ) AS rank
FROM sales.orders;
--  orderid | productid | sales | rank
-- ---------+-----------+-------+------
--        8 |       101 |    90 |    1
--        4 |       105 |    60 |    2
--       10 |       102 |    60 |    3
--        6 |       104 |    50 |    4
--        7 |       102 |    30 |    5
--        5 |       104 |    25 |    6
--        3 |       101 |    20 |    7
--        9 |       101 |    20 |    8
--        2 |       102 |    15 |    9
--        1 |       101 |    10 |   10
-- (10 rows)