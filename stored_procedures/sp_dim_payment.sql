CREATE OR ALTER PROCEDURE sp_create_dim_payment_method
AS
BEGIN
    SET NOCOUNT ON;

    -- Create table only if it does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM sys.tables
        WHERE name = 'dim_payment_method'
          AND schema_id = SCHEMA_ID('dbo')
    )
    BEGIN
        CREATE TABLE [computer_std].[dbo].[dim_payment_method](
            [PaymentMethodID] INT IDENTITY (1,1) PRIMARY KEY,
            [Payment_Method] NVARCHAR(50) NOT NULL,
            [load_date] DATETIME DEFAULT GETDATE()
        );
    END;

    -- Inserting values into table
    INSERT INTO [computer_std].[dbo].[dim_payment_method](Payment_Method)
    SELECT DISTINCT Payment_Method
    FROM [computer_std].[dbo].[raw_pc_data];

END;