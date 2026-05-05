


CREATE PROCEDURE 
sp_create_dim_date
AS
BEGIN
    SET NOCOUNT ON;

    -- Create table only if it does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM sys.tables
        WHERE name = 'dim_date'
          AND schema_id = SCHEMA_ID('dbo')
    )
    BEGIN
        CREATE TABLE [computer_std].[dbo].[dim_date] (
            [DateID] INT IDENTITY(1,1) PRIMARY KEY,
            [Purchase_Date] DATETIME2(7) NOT NULL,
            [Ship_Date] NVARCHAR(50) NOT NULL,
            [load_date] DATETIME DEFAULT GETDATE()
        );
    END;

    -- Insert data
    INSERT INTO [computer_std].[dbo].[dim_date] (Purchase_Date, Ship_Date)
    SELECT DISTINCT Purchase_Date, Ship_Date
    FROM [computer_std].[dbo].[raw_pc_data];
END;