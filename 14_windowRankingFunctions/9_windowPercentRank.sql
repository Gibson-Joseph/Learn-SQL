-- Window PERCENT_RANK()
/*
 The percent rank going to go and focus on generating the relative position of each row within a window.
 
 FORMULA:
 PERCENT_RANK = Position NR -1 / Number of Rows -1
 
 SYNTAX
 PRECENT_RANK() OVER (ORDER BY Sales DESC)
 
 If we have same value, so now for the PERCENT_RANK SQL can have different behavior than the CUME_DIST. CUME_DIST SQL did search for the last position of the shared value. But now with the PRECENT_RANK, it's going to stick with the first occurrence of the shared value. 
 
 Tie Ruel: The position of the first occurrence of the same value.
 
 So the PERCENT_RANK it's like that the shared value is goint ot share as well the same percentage rank.
 
 It always has the scale from 0 to 1.
 */
--

--====================================
-- Find the products that fall within the highest 40% of prices.
--====================================
-- Using the CUME_DIST
SELECT *,
    CONCAT(percent_rank * 100, '%') AS dist_rank_percentage
FROM (
        SELECT product,
            price,
            PERCENT_RANK() OVER (
                ORDER BY price
            ) percent_rank
        FROM sales.products
    ) t
WHERE percent_rank <= 0.4;
--  product | price | percent_rank | dist_rank_percentage
-- ---------+-------+--------------+----------------------
--  Bottle  |    10 |            0 | 0%
--  Tire    |    15 |         0.25 | 25%
-- (2 rows)