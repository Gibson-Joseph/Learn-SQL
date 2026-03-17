-- Monitor Duplicate Indexes:
-- Ref: http://udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46726989#overview
/*
 If you are working in a team with multiple deverlopers and you are working parallelly in order to optimize the performance of the queries, what might happen is that different developers creating different indexes for the same column in the same table.
 But of course this must not happen if you have a clean and solid review process in the projects. But we are human and those things could happen. So that's why you have to monitor whether there are like duplicates.
 
 So the mission is to find whether there is a column that is involved in multiple indexes.
 */