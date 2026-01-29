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