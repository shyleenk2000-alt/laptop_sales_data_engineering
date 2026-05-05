CREATE OR ALTER PROCEDURE sp_create_dim_customer
AS
BEGIN
    SET NOCOUNT ON;

    -- Create table only if it does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM sys.tables
        WHERE name = 'dim_customer'
          AND schema_id = SCHEMA_ID('dbo')
    )
    BEGIN
        CREATE TABLE [computer_std].[dbo].[dim_customer]( 
            [CustomerID] INT IDENTITY (1,1) PRIMARY KEY,
            [Customer_Name] NVARCHAR(50) NOT NULL,
            [Customer_Surname] NVARCHAR(50) NOT NULL,
            [Customer_Contact_Number] NVARCHAR(50) NOT NULL,
            [Customer_Email_Address] NVARCHAR(50) NOT NULL,
            [load_date] DATETIME DEFAULT GETDATE()
        );
    END;

    ---Inserting values into table
    INSERT INTO [computer_std].[dbo].[dim_customer] 
        (Customer_Name, Customer_Surname, Customer_Contact_Number, Customer_Email_Address)
    SELECT 
        Customer_Name, 
        Customer_Surname, 
        Customer_Contact_Number, 
        Customer_Email_Address
    FROM [computer_std].[dbo].[raw_pc_data];

END;