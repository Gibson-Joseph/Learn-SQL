-- Syntax Of Window Functions
/*
 Mainly we have two parts in window functions
 1. Window Function (SUM, AVERAGE and so on)
 2. Over Clause
 <window_fn> <over_clause>
 
 Inside the Over Clause we have three different parts.
 1. Partition Clause
 2. Order Clause 
 3. Frame Clause
 And those are all components that you can use inside that window function.
 
 So two main parts window function and Over Cluase. And inside the OVER we have Partition, Order and Frame.
 
 SYNTAX
 AVG(sales) OVER( PARTITION BY category ORDER BY order_date ROWS UNBOUNDED PRECEDING )
 
 What is window functions?
 Perform "calculations" within a window. We have three part of window functions such as Aggregate functions, Rank functions and Value(Analytics) functions.
 
 ## Aggregate Functions
 - COUNT(expr)
 - SUM(expr)
 - AVG(expr)
 - MIN(expr)
 - MAX(expr)
 
 ## Rank Functions
 - ROW_NUMBER()
 - RANK()
 - DENSE_RANK()
 - CUME_DIST()
 - PERCENT_RANK()
 - NTILE(n)
 
 ## Value(Analytics) Functions
 - LEAD(expr, offset, default)
 - LAG(expr, offset, default)
 - FIRST_VALUE(expr)
 
 -- 
 
 Now inside the functions AVG() we have here a files name or column name this called a "function expression". But the expression will change depends on the window function. For example RANK() doesn't allows any "function expression" so it's should be always empty.
 
 Now we have to tell SQL that we are dealing with the window function, it's not a normal function. In order to do that we have to specify the keyword OVER.
 
 So the second main part in the syntax is the OVER Clause. And we use it in order to defind a WINDOW.
 
 And insider OVER Clause we can define multiple stuff like ther PARTITION BY, ORDER BY and FRAME. But all those stuff are optional. We can skip it and leave it empty.
 
 So the main task OVER Cluase, it tells first SQL, we are dealing with the window function here.
 */