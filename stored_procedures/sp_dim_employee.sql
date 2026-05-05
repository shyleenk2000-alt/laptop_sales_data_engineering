CREATE OR ALTER PROCEDURE sp_create_dim_employee
AS
BEGIN
    SET NOCOUNT ON;

    -- Create table only if it does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM sys.tables
        WHERE name = 'dim_employee'
          AND schema_id = SCHEMA_ID('dbo')
    )
    BEGIN
        CREATE TABLE [computer_std].[dbo].[dim_employee](
            [EmployeeID] INT IDENTITY (1,1) PRIMARY KEY,
            [Sales_Person_Name] NVARCHAR(50) NOT NULL,
            [Sales_Person_Department] NVARCHAR(50) NOT NULL,
            [load_date] DATETIME DEFAULT GETDATE()
        );
    END;

    -- Inserting values into table
    INSERT INTO [computer_std].[dbo].[dim_employee](Sales_Person_Name, Sales_Person_Department)
    SELECT DISTINCT Sales_Person_Name, Sales_Person_Department
    FROM [computer_std].[dbo].[raw_pc_data];

END;