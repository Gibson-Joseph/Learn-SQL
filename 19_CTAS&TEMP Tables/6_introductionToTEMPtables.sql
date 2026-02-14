-- Introduction to TEMP tables
--Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46101093#overview
/*
 So with that we have covered the first type of the tables that we have in databases that permanent tables where you create a table and it's going to live forever until you go and drop it.
 
 Now we're going to talk about another type of tables in databases, we have the tmporary tables.
 
 What are temporary tables?
 --  So temporary tables or sometimes you call them as a shortcut TEMP tables. They store intemediate results in a temporary storage in the database during a session. And the database automatically dropped these tables after the session ends.
 
 What session means? 
 --  Like once you open the client and you connect to the database and you are start doing queries, we call the time between connecting ourselves to the database and disconnecting from the database we call this a session.
 
 --  So that means once you close the client and you disconnect from the database and maybe shut down your PC and do something else, what can happen? the database is going to go and destory and delete all the temporary tables that you have created during the session.
 -- So that means the table can live as long as you have a session and you can access during this time the table as you are accessing any other permanent table.
 */