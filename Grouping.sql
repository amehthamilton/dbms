-- System aggregate function with grouping
/*
    Aggregate function in this examples:
    - AVG()
    - COUNT()
*/


-- EXAMPLE 1
-- Group and Find the average balance per zip code
SELECT AVG(balance), zip FROM student
GROUP BY zip

-- EXAMPLE 2
-- Group and Find the average balance per zip code and relabel the column
SELECT AVG(balance) AS avgbalance, zip FROM student
GROUP BY zip

-- EXAMPLE 3
-- Ground and find the average balance per zip code, relabel the column, and number of records (COUNT) per zip code
SELECT AVG(balance) AS avgbalance, COUNT(*) AS numOfRecords FROM student
GROUP BY zip
