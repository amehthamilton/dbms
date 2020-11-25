-- Complex Query 2

--Example 1
SELECT * FROM student
WHERE balance >= 500 and balance < 700

--Example 2
-- Filtering using compound operators AND OR
SELECT * FROM student
WHERE (balance >= 500 AND balance < 700)
OR dateofbirth > '06-01-1993'

--Example 3
-- Same example as above but with sorting
SELECT * from student
WHERE (balance >= 500 and balance < 700)
OR dateofbirth > '06-01-1993'
ORDER BY firstname ASC

--Example 4
-- Same as above but with specific columns
SELECT lastname, firstname, state, dateofbirth, balance from student
WHERE (balance >= 500 and balance < 700)
OR dateofbirth > '06-01-1993'
ORDER BY firstname ASC
