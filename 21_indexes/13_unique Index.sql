-- Unique Index
/*
 What is unique index?
 Unique index is a special type of indexes that can make sure no duplicates in your data. 
 
 And there are a couple of reasons why is it imporant to have a unique index.
 -- The first one and the most obvious reason is to have data integrity. So the unique index can go and enforce uniqueness in your data. For example, if you have a column like an email address or a product ID, having duplicate in such columns can mess up your data very badly. So having unique index on a column like an email can make sure there are no sneaky duplicates inside your data.
 
 -- The second important reason why unique index is imporant is to improve the performance. So for example, if you are searching for a specific email, the SQL can start searching for the email value, And once the SQL find the value, the SQL will stop searching becuause we are sure that there is no duplicates in the data. So with that, you are improving the performance of your queries. So if you are creating and index and you know htis column is unique then make sure to make the index as unique index.
 
 PERFORMANCE: 
 Writing to an unique index is slower then non-unique.
 Reading from and unique index is faster than non-uniuqe.
 */