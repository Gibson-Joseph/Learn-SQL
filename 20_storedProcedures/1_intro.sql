-- Introduction to Stored Procedurs
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/47218759?start=15#overview
/*
 A Stored Procedure is a precompiled block of SQL (and optional procedural logic) that is stored inside the database and can be executed whenever needed.
 
 In PostgreSQL, stored procedures allow you to encapsulate business logic directly in the database.
 
 Why Use Stored Procedures?
 
 Reusability – Write once, use many times
 Performance – Precompiled and optimized
 Security – Restrict direct table access
 Maintainability – Centralized business logic 
 
 ========================================================
 So what we can do, we can put all those SQL statements together in one frame in one programe and we call it stored procedure. And once you do that, all your SQL statements will not stay at the clint side, they wlil be stored now in the server side of the database.
 
 So that means in stored procedures we are storing our SQL statements inside the database.
 And now all what you have to do in order to interact with your SQL statements is to go and execute the stored proceure. So you write very simple command called execute "EXEC SP", for example, so with that you are calling your stored procedure that is stored inside the server. 
 
 And once you execute this what can happen, that databse is going to go to the stored procedure and start executing all the SQL statements that you have inside the stored procedure.
 
 And it's going to do it exactly in the order that you have defined.
 
 So now once the databse wetn through all your SQL statements, it's going to return back to the user the data that we have from the selects.
 
 You can store inside it multiple SQL statements in specific order and you can save it inside the database.
 
 
 
 Stored Procedure VS Query:
 ==========================
 So a normal SQL query you have like SELECT FROM WHERE and so on. This is like one time transaction. You are asking the database for one thing and the database is answering. So it is like one time request.
 
 But in the other hand in the stored procedures you have multiple SQL statements. And one you execute the stored procedure there will be many interactions with the database in one go. So that means you will have multiple transactions that is happening in your stored procedure.
 
 So and SQL Query, it is like a simple request, you need one thing and you are getting it. But in the other hand in the stored procedure it is like a program. As you are writing a code in any programming languages, it is more than one request it has a lot of stuff, like for example, you can go and build lopping logic where we go and iterate through something, or you can go and build a control flow where you hae a logic like the if else statements. And as well in programming we have like prarameteres and variable in order to make our code dynamic and flexible. And as well we can build error handling on our code in order to customize what can happen if there is like an issue. 
 So the stored procedure, it is like having a code like for example in Python. So that means you can do more complicated stuff compared to a simple query where you have only like one request.
 
 So in the stored procedures you are doing, like programming and coding, and it is more advanced than only just having a query.
 So that means if you are working with stored procedures, things can get more complicated and advanced. But of course you will get a lot of flexibility and reusablility compared to a simple query.
 
 
 Stored Procedure VS Coding with Python:
 =======================================
 So now there is like another alternative to stored procedures. Well, you can go and put all your sql statements in a Python code and thing can work as well. So either you put your SQL statements inside the stored procedure or in a Python code. But now the big questin is the difference between them?
 
 Well, there is like a disadvantage if you are having Pythong in defferent server because you have to go and build a connection between your server and the database server and connection means always networking and you might get slightly worse performance, So this is one advantage for the stored procedure. Another advantage for stored procedure that all the scripts that you are goint to store inside the stored procedure in the database can be precompiled, So precompiled means the SQL database servers knows already about your SQL statements, and there was already a check whether all your syntaxes are correct and the database as well can be preparing everything to execute the stored procedure, like maybe preparing the execution plans and a lot of stuff. So if you store you SQL statements inside stored procedure in the database, it is very close to the database. And the database knows everything about your scripts and it is ready to execute it. But if you pull all your SQL statmentes outside of the database, of course the database has no chance to understand what is coming, so it cannot go and complie anything until Python sends the code to the database. So this is another advantage for the stored procedure. 
 
 But if you build your SQL statements in Python, you wil geta lot of advantages. Like for example, you can go an build very flexible Python codes where you can use Python features together with the SQL, And with that you open the door of many possibilities and flexibility.
 
 And another thing with python you can make great version control. So everything is integrated in python tools. And one more advantages is that if you have a complex requirement in your projects, it's going to be really hard to implement it in stored procedures. It can cause you a lot of lines of code and things can be not comfortable. But if you are implementing a complex logic python, things can be way easier.
 
 So with pythong you can implement complex logics very easily compared to the stored procedure.
 */