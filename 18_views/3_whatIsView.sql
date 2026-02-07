-- What is Views
/*
 --  A views is a virtual tables in SQL that is bases on the result of query without actually storing the data in the database. 
 --  So in shor, this means views are stored or persisted.
 --  So views can be used to simplify complex queries, to provide a specific perspective of the data, and to enhance security by restricting access to certain columns or rows of a table.
 
 Real Data <<--->> Abstraction Layer (View) <<--->> You 
 
 And of course the data will not be stored inside the view. Each time I'm querying the view, what's going to happen? The SQL query behind the view is going to be executed again, so it's going to go and retrive the data and get it back to view and we will see it in the output.
 */