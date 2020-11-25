-- ComplexQuery
-- In this example, I'm adding two columns to the student table and inserting data to them with the below statement.

SELECT * FROM student

ALTER TABLE student
ADD dateofbirth date

ALTER TABLE student
ADD balance DECIMAL(16,2)

SELECT * from student

UPDATE student
set dateofbirth = '08/01/1990',
balance = 500
WHERE studentId = '031289'

UPDATE student
set dateofbirth = '10/01/1991',
balance = 750
WHERE studentId = '033456820'

UPDATE student
set dateofbirth = '07/18/1993',
balance = 570
WHERE studentId = '034328729'

UPDATE student
set dateofbirth = '07/01/1995',
balance = 100
WHERE studentId = '034629830'
