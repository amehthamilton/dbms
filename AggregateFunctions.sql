-- System aggregate functions

SELECT * FROM student

-- count
SELECT COUNT(*) FROM student

-- max/min
SELECT MAX(balance) FROM student
SELECT MIN(balance) FROM student

--avg
SELECT AVG(balance) FROM student

--sum
SELECT SUM(balance) FROM student

--top N
SELECT TOP 3 * FROM student ORDER BY balance DESC -- This statement returns the top 3 records ordered by balance.
SELECT top 3 * FROM student -- This statement returns the top 3 records of the table.
