CREATE OR ALTER PROCEDURE sp_create_dim_location
AS
BEGIN
    SET NOCOUNT ON;

    -- Create table only if it does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM sys.tables
        WHERE name = 'dim_location'
          AND schema_id = SCHEMA_ID('dbo')
    )
    BEGIN
        CREATE TABLE [computer_std].[dbo].[dim_location](
            [LocationID] INT IDENTITY (1,1) PRIMARY KEY,
            [Continent] NVARCHAR(50) NOT NULL,
            [Country_or_State] NVARCHAR(50) NOT NULL,
            [Province_or_City] NVARCHAR(100) NOT NULL,
            [load_date] DATETIME DEFAULT GETDATE()
        );
    END;

    -- Inserting values into table
    INSERT INTO [computer_std].[dbo].[dim_location]
        (Continent, Country_or_State, Province_or_City)
    SELECT DISTINCT 
        Continent, 
        Country_or_State, 
        Province_or_City
    FROM [computer_std].[dbo].[raw_pc_data];

END;