-- Window Value Functions 
-- REF: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/43754888#overview
/*
 We can use the value functions in order to access a value from another row. 
 The value functions is like the ranking functions. We have to use the order by in order to sort the data in order to understand what is the first row and the last row.
 
 We have four functions:
 1. LEAD(expr,offset,default)
 2. LEG(expr,offset,default)
 3. FIRST_VALUE(expr)
 4. LAST_VALUE(expr)
 
 You can not leave this function as empty. For the expresion we can use any field with any data type. Partition by is optional. Order by here is a must, so you must define an order by it's like the ranking.
 
 For LEAD and LAG, you are not allowed to define any Frame Cluase.
 For the FIRST_VALUE and LAST_VALUE the Frame Cluase is optional.
 For the LAST_VALUE it is recommended to define a frame caluse.
 */