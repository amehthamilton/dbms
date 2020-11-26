-- Working with Store Procedures

-- Create procedure
CREATE PROCEDURE AddUpdateStudent
(
    -- Parameters
    @studentId CHAR(9),
    @lastname VARCHAR(25),
    @firstname VARCHAR(25)
)
AS
BEGIN
    DECLARE @address VARCHAR(30) -- This is a variable
    SELECT TOP 1 @address FROM student WHERE addressline LIKE '%Miranda%'

    IF exists (SELECT * FROM student WHERE studentId = @studentId)
    BEGIN
        /* Do and update */
        UPDATE student
        SET lastname = @lastname
        WHERE studentID = @studentId
    END
    ELSE
    BEGIN
        INSERT INTO student
        (studentId,lastname,firstname,addressline)
        VALUES
        (@studentId,@lastname,@firstname,@address)
    END
END

/* Execute Store Procedure */

/***
     Executing the following procedure will add
     a new record for Mattew Hudson because he does not exist in the table.
 ***/
EXEC AddUpdateStudent @studentId = '007788', @lastname = 'Hudson', @firstname = 'Matthew'

SELECT * FROM student

/***
    Executing the below procedure will update the
    existing record of Matthew Hudson.
***/
EXEC AddUpdateStudent @studentId = '007788', @lastname = 'Lakeland',@firstname = 'Matthew'

SELECT * FROM student
