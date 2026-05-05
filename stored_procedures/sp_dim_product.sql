CREATE OR ALTER PROCEDURE sp_create_dim_product
AS
BEGIN
    SET NOCOUNT ON;

    -- Create table only if it does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM sys.tables
        WHERE name = 'dim_product'
          AND schema_id = SCHEMA_ID('dbo')
    )
    BEGIN
        CREATE TABLE [computer_std].[dbo].[dim_product](
            [ProductID] INT IDENTITY (1,1) PRIMARY KEY,
            [PC_Make] NVARCHAR(50) NOT NULL,
            [PC_Model] NVARCHAR(50) NOT NULL,
            [Storage_Type] NVARCHAR(50) NOT NULL,
            [Storage_Capacity] NVARCHAR(50) NOT NULL,
            [RAM] NVARCHAR(50) NOT NULL,
            [load_date] DATETIME DEFAULT GETDATE()
        );
    END;

    -- Inserting values into table
    INSERT INTO [computer_std].[dbo].[dim_product]
        (PC_Make, PC_Model, Storage_Type, Storage_Capacity, RAM)
    SELECT DISTINCT 
        PC_Make, 
        PC_Model, 
        Storage_Type, 
        Storage_Capacity, 
        RAM
    FROM [computer_std].[dbo].[raw_pc_data];

END;