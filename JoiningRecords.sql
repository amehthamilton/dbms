/***  
  Joining Records
  To be able to join tables. I need to have more than one table.
  for that reason, I'm creating a new table with the name of decal

  Joining records in the student table with records in the decal table.
***/

SELECT * from student

-- Each student can have multiple decals

CREATE TABLE decal
(
    /*** This table contains information that related back to a student ***/
    decalId CHAR(6) PRIMARY KEY,
    vehicleType VARCHAR(25) NOT NULL,
    make VARCHAR(25) NOT NULL,
    model VARCHAR(25) NOT NULL,
    plate VARCHAR(6) NOT NULL,
    effectiveOn date,
    expiresOn date,
    studentId CHAR(9) /*** This value will map back to the student table. ***/
)
GO

-- The table has been created. Now, I'm inserting records to it.
INSERT into decal
VALUES
('A00021', 'Auto', 'Nissan', 'Maxima', 'XYJFEB', '08/01/17', '01/01/18', '031289')

INSERT into decal
VALUES
('A00022', 'Auto', 'Nissan', 'Sentra', 'X0RAAB', '08/01/17', '01/01/18', '033456820')

INSERT into decal
VALUES
('A00023', 'Auto', 'Ford', 'Explorer', 'X-AREG', '08/01/17', '01/01/18', 'null')

SELECT * FROM decal

-- Show all the student names and their car type.
--+ for this, we need to join the student and decal tables.

-- Left Outer Join
SELECT lastname, firstname, make, model, plate, expiresOn
FROM student LEFT JOIN decal -- 1) Tables
ON student.studentId = decal.studentId -- 2) columns to join by

-- Right Outer Join
SELECT lastname, firstname, make, model, plate, expiresOn
FROM student RIGHT JOIN decal -- 1) Tables
ON student.studentId = decal.studentId -- 2) columns to join by

-- Inner Join
SELECT lastname, firstname, make, model, plate, expiresOn
FROM student INNER JOIN decal -- 1) Tables
ON student.studentId = decal.studentId -- 2) columns to join by

-- Full outer join
SELECT lastname, firstname, make, model, plate, expiresOn
FROM student FULL OUTER JOIN decal -- 1) Tables
ON student.studentId = decal.studentId -- 2) columns to join by

/***
NOTE: 
1) Always know the table you want to join and what type of 
   you want to use
2) What are the columns you want to join
***/
