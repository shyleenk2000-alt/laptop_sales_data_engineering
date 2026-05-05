CREATE OR ALTER PROCEDURE sp_create_dim_priority
AS
BEGIN
    SET NOCOUNT ON;

    -- Create table only if it does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM sys.tables
        WHERE name = 'dim_priority'
          AND schema_id = SCHEMA_ID('dbo')
    )
    BEGIN
        CREATE TABLE [computer_std].[dbo].[dim_priority](
            [PriorityID] INT IDENTITY (1,1) PRIMARY KEY,
            [Priority] NVARCHAR(50) NOT NULL,
            [load_date] DATETIME DEFAULT GETDATE()
        );
    END;

    -- Insert values into table
    INSERT INTO [computer_std].[dbo].[dim_priority](Priority)
    SELECT DISTINCT [Priority]
    FROM [computer_std].[dbo].[raw_pc_data];

END;