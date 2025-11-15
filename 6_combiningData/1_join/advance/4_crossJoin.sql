-- CROSS JOIN
/*
 Combines every rows from left with every rows from right
 So that means I want to see all the possible combinations from both tables. 
 So we are doing someting called like CARTERSIAN JOIN.
 */
/*
 -- CROSS JOIN = Combine every row from A with every row from B
 
 If A has 3 rows and B has 4 rows,
 the result = 3 × 4 = 12 rows
 */
/*
 SYNTAX:
 
 SELECT * 
 FROM A
 CROSS JOIN B
 */
-- No matching condition, no ON clause, no filtering.
-- The order of table doesn't matter.
-- No condition needed.
--=========================================================
-- Generate all possible combination of customers and orders
--=========================================================
SELECT *
FROM customers
    CROSS JOIN orders;
/*
 When to Use CROSS JOIN?
 
 1. All possible combinations
 Perfect for:
 a. Generating test data
 b. Creating combinations like color × size
 
 2.When tables have no relationship:
 a. If two tables don’t share a key but you still want to combine every row → use CROSS JOIN.
 
 
 Warning:
 CROSS JOIN can produce very large result sets.
 1000 rows × 1500 rows = 1,500,000 rows 
 So, use carefully.
 */