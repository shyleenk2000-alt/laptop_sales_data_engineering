--Create database computer_std
--Create database computer_dwh

IF DB_ID('computer_std') IS NULL
BEGIN
     CREATE DATABASE computer_std;
END
GO

--

IF DB_ID('computer_dwh') IS NULL
BEGIN
     CREATE DATABASE computer_dwh
END
GO