--  Nested order by to sort our data
--=============================
/* Retrive the all the customer and sort the result by the country name and then by the heighest score. 
 */
--=============================
SELECT *
FROM customers
ORDER BY country ASC,
    score DESC;
--=============================
-- Flow 
--=============================
/*
 1. from table
 2. order by country desc 
 3. order by score desc 
 3. select * 
 */
/*
 IMPORTENT: Column order in order by is crucial, as sorting is sequential.
 */