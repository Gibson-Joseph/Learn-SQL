--=============================
-- ORDER BY
--=============================
/*
 We can us this type of clouse in order to sort our data.
 And of course, in order to sort, you have to decide on two mechanism. Eiter you want to sort your data ascending (ASC) from the lowes value to the highest value or exactly the oppsite way using the descending(DESC) from the highest to lowest.
 In sql the defalut order by mechanism going to be ascending(ASC)
 */
--=============================
-- Syntax 
--=============================
/*
 select *
 from table
 order by score desc 
 */
--=============================
-- Flow 
--=============================
/*
 1. from table
 2. order by score desc 
 3. select * 
 */
--=============================
-- Retrieve all customers and sort the results by the highest score first 
--=============================
SELECT *
from customers
ORDER BY score DESC;
--=============================
-- Retrieve all customers and sort the results by the lowest score first 
--=============================
SELECT *
FROM customers
ORDER BY score ASC