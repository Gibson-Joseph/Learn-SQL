-- Introduction Indexes
/*
 So now in order to understand what are indexes.
 Image you have a huge book and you want to find aspecific topic or chapter, Instead of flipping a single page in order to find the topic that you are searching for, you would use the Index at the front or back of the book in order to jump straight to the right page. And that's exactly what indes does, but for your data.
 
 Think about the inesxes as a big hotel, Now let's say that in the hotel we don't have any guides, and you would like to find the room number, let's say 501. Now what you're going to do, you're going to go and search for your room, floor by floor and checking each room until you find your room. But instead of that, thankfully hotels have a numbering system and you can ask for a map from the reception in order to understand in which building in which floor you can find your room. So by just folloiwng the map and maybe some sings, it's going to be very quickly to locate and find your room in such a big hotel.
 
 
 Indexes are used to speed up the retrieval of data from a database table. They work by creating a data structure that allows the database to quickly locate and access the desired rows based on the indexed columns.
 
 When a query is executed that includes a condition on an indexed column, the database can use the index to quickly find the relevant rows without having to scan the entire table. This can significantly improve query performance, especially for large tables.
 
 Indexes can be created on one or more columns of a table, and they can be either unique or non-unique. A unique index ensures that the values in the indexed column(s) are unique, while a non-unique index allows for duplicate values.
 
 In addition to improving query performance, indexes can also be used to enforce constraints on the data, such as ensuring that a column contains unique values or that a foreign key relationship is maintained.
 
 However, it is important to note that while indexes can improve query performance, they can also have some drawbacks.
 Creating and maintaining indexes can consume additional storage space and can also slow down data modification operations (such as INSERT, UPDATE, and DELETE) because the index needs to be updated whenever the underlying data changes.
 Therefore, it is important to carefully consider which columns to index and to regularly monitor and optimize the use of indexes in a database to ensure optimal performance.
 */