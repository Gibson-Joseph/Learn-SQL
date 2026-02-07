-- Recursive CTE
/*
 
 This is exactly the opposite of Non-Recursive CTE. It is a self-referencing query that repeatedly processing the the data until a certain condition is met.
 
 And we usually use the recursive CTE if we have like hierachical structure and we want to navigate and travel through the hierachcy.
 
 For Example:
 Now we have our talbes in the database and we have CTE. Now the query of the CTE is going to be executed for the first time. And in the results we are going to have the initial data from the CTE, but it is not everything yet. 
 Now this intermediate result is not ready yet for the main query, but instead of that, it's going to back to the CTE. And the CTE is going to check waether the current results is meeting a specific condition. So now if the ckecks says now, it's not meeting the condition, what can happen? The CTE query can be executed for the second time. So as you can see we are looping through the CTE.
 Now the result of the second iteration the second execution will be added to the intermediate results. So now the intermediate result has more data. And again before we can use it from the main query it's going to be checked from the CTE, Does the result fulfill the condition? if it's still no then go and execute the CTE again. So we're going to have a third iteration, and new data are going to be added to the intermediate resultls. 
 Now it's going to be checked again from teh CTE, Did we fulfill the conditon? If the answer is yes, then the loop going to break and everything ends. So there will be no fourth iteration of the CTE. 
 So with that, the CTE says, Okay, I'm done, this is the final result of the intermediate result. And now my intermediate result is ready to be used from teh main query.
 
 The looping is going to be happen only in the CTE, and that's why we call it recursive CTE.
 
 
 SYNTAX:
 
 WITH CTE-Name AS --> CTE query
 (
 SELECT ... -->> Anchor Query: The anchor query is going to be first query that interacts with the database and provide us the initial intermediate results. So it is the starting point of the interation.
 FROM ...
 WHERE ...
 
 UNION ALL --> We cann't have like two SELECT Statements in one query, You have to connect it somehow, that's why we can go and use the UNION ALL or UNION depend if you want to have duplicate or not. 
 
 SELECT ... --> Recursive Query: This query can be executed multiple times and it will keep repeating and add data to the intermediate results until the condtion is met Or let's say there will be no more data that is available to processed.
 FROM CTE-Name --> We have to reference this CTE to itself. Here we're going to say recursive query going to select the data from the same CTE. So that means we have now a query that is querying itself.
 WHERE [break condition]
 )
 SELECT ... --> Main query
 FROM CTE-Name
 WHERE ...
 
 
 SQL is going to go and execute the anchor query only once and after that SQL going to go through the recursive query. And keep looping and loopoing and interating until a certain condtion is met. And the SQL is going to go out from the CTE.
 */