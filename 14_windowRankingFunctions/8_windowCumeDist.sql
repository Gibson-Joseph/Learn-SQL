-- PERCENTAGE-BASED RANKING
-- REF: https://www.udemy.com/course/the-complete-sql-bootcamp-30-hours-go-from-zero-to-hero/learn/lecture/43755280#overview
-- Window CUME_DIST()
/*
 Cume stands for Cmulative Distribution, it's going to go and focus or calculate the distribution of your data point with a window.
 
 FORMULA:
 CUME_DIST = position Nr / Number or Rows
 
 So if SQL finds a tie it will completely ignore the current position number, it's going to go and take the last positions number for the same value. So if we have tie they're going to sahre the same percentage. So that means with the CUME_DIST if you have same values they're going to share the same rank.
 */