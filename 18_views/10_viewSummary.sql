-- VIEW Summary
/*
 -- Views are a virtual table that is based on the result of a query without actually storing any data in the database.
 -- So we use views in order to presist a complex SQL logic and query in the database.
 -- Some scenarious, VIEWs are better than CTE because it improves their reusability and reduce the complexity in multiple querires, which reduce hte complexity of the whole project, where the CTE only imporves the reusablity in one query.
 -- In some scerarios VIEWs are better than tables, because VIEWS are flexible and easier to maintain since they don't store any data, and it's really fast and easy to change stuff in the view compared to the tables, But the tables are faster than VIEWS.
 
 
 USE CASES:
 -- If we find like acoommon repeated logic in SQL queries, we can go and store this logic in a VIEW in the database, so the users don't have to keep repeating the logic over and over. So we use VIEWs in order to have a central business logic.
 -- Hide the complexity of your physical data model and to offer for the users a high abstracted layer. So you can provide for the user something very friendly and hide all the complex technical data model that you have in the database, becuase not everyone is expert with your data model.
 -- We can use VIEWs in order to implement security and to protect our senstive data in the database, So we can offer multiple VIEWs in order to protect columns or rows in a table.
 -- We can use VIEWs in order to have more dynamic and flexiblity for your database, where we offer the users a stable VIEW, and then you have the freedom to change stuff at your physical data model without affecting all users.
 -- We can offer multple languages from our data model.
 */