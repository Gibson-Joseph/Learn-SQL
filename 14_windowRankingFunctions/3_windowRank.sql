-- Window RANK()
/*
 This RANK function is going to go and assing for each row a rank. And this time it's going to go and handle the ties. So that means if in your data, you have two rows having the same value, they are going to share the same ranking.
 
 One thing about hte ranking function is that it's going to go and leave gaps(skipping) in the ranking. So there is possibllity of skipping ranks.
 
 So the RANK function you can see that we don't have a unique ranking here, we have shared ranking in case of the tie, so it handles the ties.
 */
--==============================
-- Rank the orders based on their sales from highest to lowest.
--==============================
SELECT orderid,
    productid,
    sales,
    RANK() OVER(
        ORDER BY sales
    ) sales_rank
FROM sales.orders;
--  orderid | productid | sales | sales_rank
-- ---------+-----------+-------+------------
--        1 |       101 |    10 |          1
--        2 |       102 |    15 |          2
--        3 |       101 |    20 |          3
--        9 |       101 |    20 |          3
--        5 |       104 |    25 |          5
--        7 |       102 |    30 |          6
--        6 |       104 |    50 |          7
--        4 |       105 |    60 |          8
--       10 |       102 |    60 |          8
--        8 |       101 |    90 |         10
-- (10 rows)