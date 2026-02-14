-- TEMP Table Use Case
/*
 Why do we need TEMP tables?
 --  So the main reason why we need temporary tables is that we want to store intermediate results during our session. So let's say that we are doing some data analysis and we have a complex query, and we want to do some modifications on the result of this query, but we don't want to do it directly on the original table because maybe we want to keep the original table as it is without any changes. So what we can do is to take a copy from the original table and create a temporary table from it, and then do all the modifications on this copy, and once we're done with all the modifications, if we like the result of this copy, we can store it back to our database as a permanent table.
 */