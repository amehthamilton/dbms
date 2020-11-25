-- Working with Views

SELECT * FROM student
GO
SELECT * FROM decal
GO

/*** Query to find all student autos which will expire in the next 30 days ***/
SELECT student.studentId, lastname, firstname, make, model, plate, expiresOn
FROM student INNER JOIN decal
ON student.studentId = decal.studentId
WHERE vehicleType = 'auto' and expiresOn <= DATEADD(DAY, 30, GETDATE())

/***
    Create a view 
    - A view can only have one query.
    - Suppose we want to have someone to get a weekly report of the student decal that are expiring.
    +  we can create a view, and have then execute the view, instead of giving them the query which
    + could be error prompt.
***/
create view StudentDecalExpiring
AS
(
    SELECT student.studentId, lastname, firstname, make, model, plate, expiresOn
    FROM student INNER JOIN decal
    ON student.studentId = decal.studentId
    WHERE vehicleType = 'auto' and expiresOn <= DATEADD(DAY, 30, GETDATE())
)
GO

/*** A view can be create it as a table. Meaning that you can run a query operation with SELECT. ***/
SELECT * FROM StudentDecalExpiring

/*** Views are primaly use for retreival purposes but we can perform DELETION and UPDATE with limitions ***/

INSERT INTO student
VALUES
('001900', 'Rodgers', 'Steve', '123 West', 'Miami', 'FL', '33333', '01/23/54', 500)
GO

INSERT INTO decal
VALUES
('045343','auto','Ford','Mustang','M-AMER','01/01/2017','01-01-2018','001900')
GO

/*** You can update/insert/delete the view, only if all columns are in the same table ***/
UPDATE StudentDecalExpiring
SET lastname = 'America',
    firstname = 'Captain'
WHERE studentId = '001900'

/*** The below does not work. That is because 'make' does not exists in the student table. Only the decal table ***/
UPDATE StudentDecalExpiring
SET lastname = 'America',
    firstname = 'Captain',
    make = 'Chevy'
WHERE studentId = '001900'
