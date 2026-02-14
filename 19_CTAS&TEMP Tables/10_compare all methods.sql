--Compare All Methods:
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46138035#overview
/*
 SUBQUERY:
 -- STORAGE: Database can put the result of this techniues in the memory in the cach, so that later main query as fast access to those intermeidate results.
 -- LIFE TIME: Live a short time in the database. So this is temporary.
 -- WHEN DELETED: It has a short time, they can live only durin the execution of the query. So once the query ends, the database is going to go to the cach and delete everything.
 -- SCOPE: The scope is here very small. It is accessed only from one single query, the query itself where you write SUBQUERY. So you cann't access it from external queries.
 -- REUSABLITY: Very limited. The SUBQUERYE is going to be used only in one query and only in one place. So if you need ti in multiple places, you have to go and repeat the same logic. So SUBQUERIES are the worst with their reusablity
 -- UP2DATE: They are always up to date, because SQL is executing the logic on the fly and storing the data in the memory. And immediately after that going to come the main query and get the data. So always the intermediate results in the memory are up to date.
 
 
 CTE:
 -- STORAGE: Database can put the result of this techniues in the memory in the cach, so that later main query as fast access to those intermeidate results.
 -- LIFE TIME: Live a short time in the database. So this is temporary.
 -- WHEN DELETED: It has a short time, they can live only durin the execution of the query. So once the query ends, the database is going to go to the cach and delete everything.
 -- SCOPE: The scope is here very small. It is accessed only from one single query, the query itself where you write CTE. So you cann't access it from external queries
 -- REUSABLITY: It is little bit better. You still can access it only from one singel query, but you can access it in the same query from multiple places, so you can access it multiple times from different joins, And you don't have to repeat the same logic over and over. But still it is limited, because you have only one query that is using the logic.
 -- UP2DATE: They are always up to date, because SQL is executing the logic on the fly and storing the data in the memory. And immediately after that going to come the main query and get the data. So always the intermediate results in the memory are up to date.
 
 
 TEMP
 -- STORAGE: New created tables can be stored inside the disk storage
 -- LIFE TIME: Live a short time in the database. So this is temporary.
 -- WHEN DELETED: It live little bit longer as long as you are in the session. But once you end the session, the database is going to go and drop and delete your table.
 -- SCOPE: You can access this from multiple queries. So that means you can access this object from multiple external queries.
 -- REUSABLITY: The reusability here is medium, and that's because you can access the data by multiple queries, but during the session. So once the session is ended, you cann't access it anymore, which means you have to recreate it in order to reuse it again. So it is more reusable than the CTE and SUBQUERY, but not good like the CTAS and VIEWs.
 -- UP2DATE: The query is only executed once, And if there is like an update an changes on the original table, we will not find those changes in this object, and that's because SQL executed once and that's all. So if you query this table, there is no guarantee that the data are up to date. So if you want a fresh data, you have always to drop the table and create it again from the query.
 
 
 CTAS:
 -- STORAGE: New created tables can be stored inside the disk storage
 -- LIFE TIME: This can be permanent, so that means they're going to live in the database as long as you don't drop them.
 -- WHEN DELETED: It is presisted and premanent and the database can only delete them if we ask the database to do that by using the DDL command DROP.
 -- SCOPE: You can access this from multiple queries. So that means you can access this object from multiple external queries.
 -- REUSABLITY: It offer the highest level of reusablity for us, so they are always there for multiple users from multiple queires, So it can eliminate a lot of redundancies. And you have to do the job only once.
 -- UP2DATE: The query is only executed once, And if there is like an update an changes on the original table, we will not find those changes in this object, and that's because SQL executed once and that's all. So if you query this table, there is no guarantee that the data are up to date. So if you want a fresh data, you have always to drop the table and create it again from the query.
 
 
 VIEW:
 -- STORAGE: There will be no data stored and that means we are not using any storage from the database.
 -- LIFE TIME: This can be permanent, so that means they're going to live in the database as long as you don't drop them.
 -- WHEN DELETED: It is presisted and premanent and the database can only delete them if we ask the database to do that by using the DDL command DROP.
 -- SCOPE: You can access this from multiple queries. So that means you can access this object from multiple external queries.
 -- REUSABLITY: It offer the highest level of reusablity for us, so they are always there for multiple users from multiple queires, So it can eliminate a lot of redundancies. And you have to do the job only once.
 -- UP2DATE: This is always up to date, becuase VIEW does not store any data. So each time you ask the VIEWs for data what can happen? the database is going to go to the original table and fetch the data to the VIEW. So your data are always fresh and up to date.
 
 */