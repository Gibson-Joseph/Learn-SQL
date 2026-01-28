-- Use Case: Rolling & Running Total.
-- REF: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/43405242#overview
/*
 Tracking - This is help us to tracking the current sales with target sales. 
 Trend Analysis - Providing insights into historical patterns.
 
 
 Rolling & Running Total
 They aggregate sequence of mumbers, and the aggregations is updated each is updated each time a new member is added.
 
 Running Total - Aggregate all values from the beginning up to the current point without dropping off older data.
 Rolling Total - Aggregate all values within a fixed time window (e.g. 30 days). As new data is added, the olderst data point will be dropped.
 
 
 The running total is always considered everything from the starting position until the current row without dropping any member.
 The rolling total is always drop the oldest member in order to add someting new, and the window is keep shifting.
 
 So the running total is very great in order to do tracking, like example, budget tracking or we track, for example, the current total sales with a target or something like that. So always we are considering the whole data set. But with rolling total we always do here focused analysis, we are always interested with a window of three months.
 */