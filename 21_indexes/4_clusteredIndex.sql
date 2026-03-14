-- Clustered Index
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46590941#overview
/*
 What is clustered Index?
 A clustered index is a type of index that determines the physical order of data in a table. In a clustered index, the data rows are stored in the same order as the index keys. This means that the clustered index defines the way data is physically stored on disk, and there can only be one clustered index per table.
 
 Advantages of Clustered Index:
 1. Faster data retrieval: Since the data is stored in the same order as the index keys, it can significantly speed up query performance, especially for range queries and sorting operations.
 2. Efficient use of storage: Clustered indexes can reduce the amount of storage needed by eliminating the need for separate index structures, as the data itself is organized according to the index keys.
 
 Disadvantages of Clustered Index:
 1. Slower data modification: Inserting, updating, or deleting data in a clustered index can be slower compared to non-clustered indexes because the physical order of the data must be maintained.
 2. Limited to one per table: Since a clustered index determines the physical order of data, only one clustered index can be created per table, which may limit the indexing options for certain queries.
 
 =======================
 So say you created clustered index on the the ID column of the customers table.
 So the first thing that's going to happen is SQL going to physically sort all the data based on the column ID. 
 So the rows can rearranged in each data page from the lowest to highest. 
 So in the first page we're going to have the first customer ID number 1, then 2, 3, 4, 5 until we reach in the last page the customer number 20.
 So as you can see the first page has the lowest value and the last page has the highest value.
 
 So the next step is that SQL is going to go and start structuring and building "B-tree".
 
 So what is B-tree?
 A B-tree short for balanced tree. It is hierarchical structure that store the data as a tree upside down.
 It starts with the root, the root node, and then it keeps branching out until we reach eventually the leaves. Between the leaf nodes and the root node we call this section the intemediate nodes. So it could be like one level or multiple levels between the root and the leaves.
 
 And once the SQL construct the B-tree, it's going to be very easy for SQL for navigate through the B-tree in order to find the specific inofrmation.
 
 Now, very important to understand that the leaves, the leaf nodes at the B-tree for the clustered index contain the actual data, the data pages. So all your nice sorted pages and your data is stored at the leaf level.
 Then after that, SQL can start building the intermediate nodes. And here the database can use different types of pages. We have the index page.
 
 INDEX PAGE:
 So in the index page we can not find the actual data the entire rows, but instead the index page stores a key value that containes a pointer to another index page or to data page.
 
 And now once SQL is done building the intermediate nodes is going to go and build the last node, the root node, where it says if you are searching for customers between 1 and 10, then go to the index page with the intermediate ID. So that means the root nodes is pointing to another index page(Intermediate node) not directly to the data page.
 */