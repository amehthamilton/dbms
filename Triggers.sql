-- Working with triggers
-- Example

SELECT * FROM student
GO
drop TRIGGER trgStudent
GO

-- Sample trigger
CREATE TRIGGER trgStudent
ON student
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Inserted
    SELECT *, 'inserted' FROM inserted

    -- Deleted
    SELECT *, 'deleted' FROM deleted

    -- Update?
    IF UPDATE(lastname)
        PRINT 'Updated Lastname'

END

INSERT INTO student
VALUES
('001900', 'Rodgers', 'Steve', '123 West', 'Miami', 'FL', '33333', '01/23/54', 500)
GO

DELETE FROM student
WHERE studentId = '001900'

UPDATE student
SET lastname = 'America',
    firstname = 'Captain'
WHERE studentId = '001900'


-- Create an audit table
CREATE TABLE studentaudit
(
    studentId CHAR(9) NULL,
    lastname VARCHAR(25) NULL,
    firstname VARCHAR(25) NULL,
    addressline VARCHAR(50) NULL,
    city VARCHAR(25) NULL,
    state CHAR(2) NULL,
    zip CHAR(5) NULL,
    dateofBirth date,
    balance DECIMAL(16,2) NULL,
    operation VARCHAR(50),
    updatedOn DATETIME
)
GO

DROP TRIGGER trgStudentAuditing
GO

ALTER TRIGGER trgStudentAuditing
ON student
AFTER INSERT, UPDATE, DELETE
AS
    BEGIN
        -- Inserted
        IF EXISTS(SELECT * FROM inserted)
            BEGIN
                INSERT INTO studentaudit
                SELECT *, 'INSERTED', GETDATE() FROM inserted
            END
        -- Deleted
        IF EXISTS(SELECT * FROM deleted)
            BEGIN
                INSERT INTO studentaudit
                SELECT *, 'DELETED', GETDATE() FROM deleted
            END
    END

INSERT INTO student
VALUES
('001900', 'Rodgers', 'Steve', '123 West', 'Miami', 'FL', '33333', '01/23/54', 500)
GO

DELETE FROM student
WHERE studentId = '001900'

SELECT * FROM studentaudit
GO

SELECT * FROM student
GO
