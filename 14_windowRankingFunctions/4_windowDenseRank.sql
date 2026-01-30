-- Window DENSE_RANK()
/*
 It is very similar to the raninking function, its going to go and assign for each row a number a rank. As well it is handle the ties, same values, they're going to share the same ranking. But this it doesn't leave any gaps like the rank function. So it won't skip any ranking.
 
 Shared ranking, leaving no gaps (no skipping)
 */
--====================================
--  Rank the orders based on their sales from highest to lowest
--====================================
SELECT orderid,
    productid,
    sales,
    DENSE_RANK() OVER(
        ORDER BY sales DESC
    ) sales_rank
FROM sales.orders;
--  orderid | productid | sales | sales_rank
-- ---------+-----------+-------+------------
--        8 |       101 |    90 |          1
--        4 |       105 |    60 |          2
--       10 |       102 |    60 |          2
--        6 |       104 |    50 |          3
--        7 |       102 |    30 |          4
--        5 |       104 |    25 |          5
--        3 |       101 |    20 |          6
--        9 |       101 |    20 |          6
--        2 |       102 |    15 |          7
--        1 |       101 |    10 |          8
-- (10 rows)