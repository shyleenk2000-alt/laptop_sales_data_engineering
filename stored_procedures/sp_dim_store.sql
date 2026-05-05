CREATE OR ALTER PROCEDURE sp_create_dim_store
AS
BEGIN
    SET NOCOUNT ON;

    -- Create table only if it does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM sys.tables
        WHERE name = 'dim_store'
          AND schema_id = SCHEMA_ID('dbo')
    )
    BEGIN
        CREATE TABLE [computer_std].[dbo].[dim_store](
            [StoreID] INT IDENTITY (1,1) PRIMARY KEY,
            [Shop_Name] NVARCHAR(50) NOT NULL,
            [Shop_Age] NVARCHAR(50) NOT NULL,
            [load_date] DATETIME DEFAULT GETDATE()
        );
    END;

    -- Inserting values into table
    INSERT INTO [computer_std].[dbo].[dim_store](Shop_Name, Shop_Age)
    SELECT DISTINCT 
        Shop_Name,
        Shop_Age
    FROM [computer_std].[dbo].[raw_pc_data];

END;