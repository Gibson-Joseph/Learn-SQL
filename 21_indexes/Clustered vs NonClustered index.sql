-- Clustered vs NonClustered Index
-- Ref: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/46598857#overview
/*
 When I think about the clustered index and the non clustered index we think about a book.
 
 You can think of the clustered index like the table of contents at the front of the table. So the table of the contents gonna tells you where to find each chapter. And the chapteres are exactly sorted, like the table of contents. And this is exactly what the clustered index does.
 
 But now, in the other hand, think about the non-clustered index as the index that you can find at end of the book. The index of the book is very detailed list of topics, terms, and keywords where it points exactly to the location, where you can find it in the book, and the content and the topic of the book is not sorted like the index of the book. And this is exactlyu what the non-clustered index does.
 
 Clustered Index:
 - The structure of the clustered index is a B-Tree where it starts with root node where we have an index page. This index page pointing to the intermediate nodes where we have as well index pages. And those index pages are pointing to the actual data to the data pages. So at the leaf level of the clustered index we have the data pages, the actual data. What's special about the clustered index is that it physically sort the data insdie those pages. So everything here is physically rearranged and sorted.
 
 Non-Clustered Index:
 - We have as well B-Tree. So the same thing as the root node, we have and index page pointing to and intermediate index page. But this time the intermedaite nodes are pointing to another index page, they are not pointing like the clustered index to a data page, they are pointing to index page. So now if you check this structure, you can see that at the leaf level for the clustered index, we have actual data, the data pages. But in the other side, at the leaf lever for non-clustered index, we don't have the actual data, we have index pages, but those index pages are pointing to the actual data to the data pages. But the big difference is that the data pages are not part of the B-Tree. The B-Tree of the non-clustered index is just a sperate structure that does not involve any data. So we have only index pages, and it just points to the data pages without changing anything physically with our data.
 ==========================
 
 But in reality, what happened is that your going to have those two types of indexes, the clustered and non-clustered indexes in one table. So what can happend, The leaf level of the non-clustered index can be pointing to the data pages of the clustered index, because those index pages don't care whethere those pages are sorted or not, it's just going to go and point to the correct page and to the correct row.
 
 So that means we have now like two different B-Tree structures that are pointing to the data.
 And here there is like one thing that you have to understand that you can create only one clustered on a table. And this rule really makes sense because you can store the data only in one way in SQL. And that's of course makes sense because you can sort the data physically only once. And that's why in SQL databases you are allowed to create only one clsutered index, because physically the data can be sorted only in one way, but in the other hand, in the non=clustered index you can create as many non-clustered index you need. Because in the B-Tree of the non-clustered index, you don't store any data pages, we store only pointers to the data. And you could have like multiple pointeres.
 
 
 Clustered Index:
 -- Definition: Physically sorts and stores rows at the B-Tree
 -- Number of indexes: One Index per table
 -- Read Performance: Faster
 -- Write Performance: Slower, due to potential data row reordering.
 -- Storage Efficiency: More storage-efficient
 -- Use Case: 1. Unique cloumns. 2. not frequently modified Column. 3. Improve range query performance.
 
 Non-Clustered Index:
 -- Definition: Separate structure with pointeres to the actuall data
 -- Number of indexes: Multiple indexes are allowed.
 -- Read Performance: Slower
 -- Write Performance: Faster, since physical data order is unaffected.
 -- Storage Efficiency: Requires additional storage space. (We have extra layer of index pages and index pages needed storage. And that's why they can waste more storage than the clustered index)
 -- Use Case: 1. Columns frequently used in search conditions and joins. 2. Exact match queries.
 */