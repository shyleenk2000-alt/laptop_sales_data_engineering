CREATE OR ALTER PROCEDURE sp_drop_tables
AS
BEGIN
    SET NOCOUNT ON;

    IF OBJECT_ID('[computer_std].[dbo].[dim_date]', 'U') IS NOT NULL
        DROP TABLE [computer_std].[dbo].[dim_date];

    IF OBJECT_ID('[computer_std].[dbo].[dim_channel]', 'U') IS NOT NULL
        DROP TABLE [computer_std].[dbo].[dim_channel];

    IF OBJECT_ID('[computer_std].[dbo].[dim_customer]', 'U') IS NOT NULL
        DROP TABLE [computer_std].[dbo].[dim_customer];

    IF OBJECT_ID('[computer_std].[dbo].[dim_employee]', 'U') IS NOT NULL
        DROP TABLE [computer_std].[dbo].[dim_employee];

    IF OBJECT_ID('[computer_std].[dbo].[dim_location]', 'U') IS NOT NULL
        DROP TABLE [computer_std].[dbo].[dim_location];

    IF OBJECT_ID('[computer_std].[dbo].[dim_payment_method]', 'U') IS NOT NULL
        DROP TABLE [computer_std].[dbo].[dim_payment_method];

    IF OBJECT_ID('[computer_std].[dbo].[dim_priority]', 'U') IS NOT NULL
        DROP TABLE [computer_std].[dbo].[dim_priority];

    IF OBJECT_ID('[computer_std].[dbo].[dim_product]', 'U') IS NOT NULL
        DROP TABLE [computer_std].[dbo].[dim_product];

    IF OBJECT_ID('[computer_std].[dbo].[dim_store]', 'U') IS NOT NULL
        DROP TABLE [computer_std].[dbo].[dim_store];

    IF OBJECT_ID('[computer_std].[dbo].[fact_pc_sales]', 'U') IS NOT NULL
        DROP TABLE [computer_std].[dbo].[fact_pc_sales];

END;