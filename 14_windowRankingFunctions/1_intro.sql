-- Window Ranking Functions 
-- REF: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/43750736#overview
/*
 If you want now to go and rank your products, First you have to sort the data based on someting like for example ranking the products based on their sales. 
 
 So the sorting the data is always the first thing SQL has to do before ranking anything.
 
 Now, in order to rank our data, we have two methods.
 1. Integer-based Ranking.
 2. Percentage-based Ranking. (In this method SQL going to go first and calculate the relative position of the row compared to all others, and then assign a percetage for each row.)
 
 Integer Based Ranking:
 1. ROW_NUBMBER()
 2. RANK()
 3. DENSE_RANK()
 4. NTILE()
 
 Percentage Based Ranking:
 1. CUME_DIST()
 2. PERCETN_RANK()
 
 
 SYNTAX:
 RANK() OVER(PARTITION BY product_id ORDER BY sales)
 
 1. Expression must be empty inside the RANK(), this is the first rule when using the RANK().
 2. PARTITION BY is optional.
 3. ORDER BY is required. So you must order the data or sort your data in order to do ranking, so you cannot leave it empty.
 4. FRAME Clause is not allowed to use in the RANK function.
 */