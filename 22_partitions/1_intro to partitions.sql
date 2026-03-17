-- Introduction to Patrtitions.
/*
 It's a technique in order to divide a laarge table into small pieces. And each piece we call it a partition. Well, this sounds like we are dividing one big table into two smaller tables. But it's not like that, we are just dividing one table into smaller partitions. So we're going to see it in the database still as one solid table. But behind the scense it is split into multiple partitions.
 
 Partitioning = dividing one big table into smaller tables based on some rule
 
 
 Why Partitioning is Used
 
 When your table becomes huge (millions/billions of rows), problems occur:
 -- Slow queries 🐢
 -- Difficult maintenance
 -- Heavy index size
 
 Partitioning helps by:
 -- Improving query performance
 -- Making data management easier
 -- Allowing faster backups & deletes
 
 
 Partitioning is about performance + scalability, not just storage.
 */