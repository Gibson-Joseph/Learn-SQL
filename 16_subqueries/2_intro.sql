-- Introduction to Subquery
/*
 A subquery is a query inside another query.
 
 So we could have another query that is inside our query where we do the same thing like SELECT FROM WHERE. So we have now a query inside our query and we call embedded query we call it a SUBQUERY. And the original query the first one where we have SELECT FROM cwe call it MAIN QUERY.
 
 So now if you exectute the whole query what's going to hapen is SQL first is going to go and select SUBQUERY, and then its execute it. So it's goint to go and select and retrive data from our database tables. And the result of the subquery will not be sent to the user to us, so we can't see it, what can happen, the result can stay inside the query as an intermediate results. And then now our MAIN QUERY can go and start interacting with this intermediate result from the SUBQUERY.
 
 So the MAIN QUERY going to do some kind of operations on top of this intermediate results and use it for filtring or joining or any purpose. And still the main query can go and query the original database tables. So the MAIN QUERY has two sources for data the original database tables and as well the result from another query.
 
 The SUBQUERY play a role of supporter. So it supports the main query with data.
 */