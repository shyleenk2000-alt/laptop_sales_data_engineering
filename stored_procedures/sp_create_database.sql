CREATE OR ALTER PROCEDURE sp_create_databases
AS
BEGIN
    SET NOCOUNT ON;

    -- Create computer_std if it does not exist
    IF DB_ID('computer_std') IS NULL
    BEGIN
        CREATE DATABASE computer_std;
    END;

    -- Create computer_dwh if it does not exist
    IF DB_ID('computer_dwh') IS NULL
    BEGIN
        CREATE DATABASE computer_dwh;
    END;
END;