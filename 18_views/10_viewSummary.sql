-- VIEW Summary
/*
 -- Views are a virtual table that is based on the result of a query without actually storing any data in the database.
 -- So we use views in order to presist a complex SQL logic and query in the database.
 -- Some scenarious, VIEWs are better than CTE because it improves their reusability and reduce the complexity in multiple querires, which reduce hte complexity of the whole project, where the CTE only imporves the reusablity in one query.
 -- In some scerarios VIEWs are better than tables, because VIEWS are flexible and easier to maintain since they don't store any data, and it's really fast and easy to change stuff in the view compared to the tables, But the tables are faster than VIEWS.
 
 
 USE CASES:
 -- If we find like acoommon repeated logic in SQL queries, we can go and store this logic in a VIEW in the database, so the users don't have to keep repeating the logic over and over. So we use VIEWs in order to have a central business logic.
 -- Hide the complexity of your physical data model and to offer for the users a high abstracted layer.
 */