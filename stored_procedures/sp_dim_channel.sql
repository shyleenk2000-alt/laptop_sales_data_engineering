CREATE OR ALTER PROCEDURE sp_create_dim_channel
AS
BEGIN

    -- Create table only if it does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM sys.tables
        WHERE name = 'dim_channel'
          AND schema_id = SCHEMA_ID('dbo')
    )
    BEGIN
        CREATE TABLE [computer_std].[dbo].[dim_channel](
            [ChannelID] INT IDENTITY (1,1) PRIMARY KEY,
            [Channel] NVARCHAR(50) NOT NULL,
            [load_date] DATETIME DEFAULT GETDATE()
        );
    END;

    -- Insert data
    INSERT INTO [computer_std].[dbo].[dim_channel](Channel)
    SELECT DISTINCT Channel
    FROM [computer_std].[dbo].[raw_pc_data];

END;