-- NonClustered Index
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46595495?start=15#overview
/*
 What is NonClustered Index?
 A non-clustered index is a type of index that does not determine the physical order of data in a table. Instead, it creates a separate structure that contains the index keys and pointers to the actual data rows. This means that the data can be stored in any order on disk, and there can be multiple non-clustered indexes per table.
 
 =================================
 
 And we're going to understand how exactly a SQL build and crete the non-clustered index. So now we are back to the heap structure where our table don't have any index. And our data are stored randomly insdie the data pages. 
 
 And now if you go and creae a non-clustered index on the customer ID what can happen, and the big difference is that SQL will not touch or change anything on the physical, actual data on the data pages. So the data pages can stay as it is and nothing's going to be changed.
 
 And the SQL start immediatley building the B structure. So it's going to start immediately building an index page. So since it is index page it's goint to stre pointers, but this time it's really going to store in the key the customer ID. So 1 is the customer ID and now the value the pointer, it will not be the data page ID, we will be more specific, so we're going to have like an address where exactly the row is stored.
 
 So it's going to start with the file ID the pate number because the customer ID 1 is stored in the page 102 (1(customerID):102(PageNumber)), but SQL can go add as well the offset number of the row where exactly in the page we can find this ID and the whole thing (1:102:96(row Offset)) we can call it RID the row indentifier
 
 ========================
 A Non-Clustered Index is an index that does not change the physical order of the table data. Instead, it creates a separate structure that stores the indexed column values and pointers to the actual table rows.
 
 Key Idea:
 Non-clustered index = separate lookup structure
 The table data remains unsorted
 You can create multiple non-clustered indexes on a table
 */