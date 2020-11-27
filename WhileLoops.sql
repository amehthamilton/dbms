-- Working with while loops

-- Example 1
DECLARE @Counter INT
SET @Counter = 1
WHILE @Counter <= 10
    BEGIN
        PRINT @Counter
        SET @Counter = @Counter + 1
    END


-- Example 2 using PRINT and SELECT
DECLARE @Counter INT
SET @Counter = 1
WHILE @Counter <= 10
    BEGIN
        PRINT @Counter
        SET @Counter = @Counter + 1
    END
SELECT @Counter
