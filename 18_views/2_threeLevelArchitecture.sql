-- 3 Level Architecture
/*
 This architecture can describe the different levels of data abstractions in a database.
 So the architecture is divided into three levels.
 
 1. Physical Level (Internal layer)
 -- It is lowest level of the database where the actuaal data is stored in a physical storage. And usually who has access to this layer are the database administrators, because they are the experts, and they have to manage the access and the security of this layer, because they are the expers that have to manage a lot of stuff like optimizing the performance, making sure that everything is secure, and managing the backup and recovery, and to do all the configurations and many other tasks. 
 -- This layer is very complicated and you need to really expert of databases in order to able to mange all those stuff.
 
 2. Logical Level (Conceptual layer)
 -- So the logical layer it is less complicated than the physical layer. Here at this level you have to deal on how to organize your data. And normally we have here like an application developer or we have like data engineers that access the logical level in order to define the structure of your data.
 -- So those developers can focus on how to structure your data, rather than how the data is exactly storing the data physically at the storage.
 -- So in this level developer can creating tables and defining their relationships between those tables, Or they can go and define views, they can create indexes on the tables in order to optimze the performance of the tables and so on.
 
 3. View Level (External layer)
 -- So the view level is the highest level of abstraction in the database. And it is what the end users and applications can access and can see.
 -- For example, you could have like one view for business analysts and could have view for data visualizations and reporting. So you can keep doing that by creating multiple set of views that are suitable for specific purpose and use case.
 -- So as you can see at this level, we are exposing our data for multiple users and multiple applications.
 */