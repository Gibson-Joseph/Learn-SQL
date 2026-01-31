-- PERCENTAGE-BASED RANKING
-- REF: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/43755280#overview
-- Window CUME_DIST()
/*
 Cume stands for Cumlative Distribution, it's going to go and focus or calculate the distribution of your data point with a window.
 
 FORMULA:
 CUME_DIST = position Nr / Number of Rows
 
 SYNTAX
 CUME_DIST() OVER (ORDER BY Sales DESC)
 
 So if SQL finds a tie it will completely ignore the current position number, it's going to go and take the last positions number for the same value. So if we have tie they're going to sahre the same percentage. So that means with the CUME_DIST if you have same values they're going to share the same rank.
 
 It always has the scale from 0 to 1.
 */
--====================================
-- Find the products that fall within the highest 40% of prices.
--====================================
-- Using the CUME_DIST
SELECT *,
    CONCAT(percent_rank * 100, '%') AS dist_rank_percentage
FROM (
        SELECT product,
            price,
            CUME_DIST() OVER (
                ORDER BY price
            ) percent_rank
        FROM sales.products
    ) t
WHERE percent_rank <= 0.4;
--  product | price | percent_rank | dist_rank_percentage
-- ---------+-------+--------------+----------------------
--  Bottle  |    10 |          0.2 | 20%
--  Tire    |    15 |          0.4 | 40%
-- (2 rows)