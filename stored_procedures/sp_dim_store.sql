CREATE PROCEDURE sp_create_dim_store
  
AS
BEGIN
 ---CREATING A TABLE

DROP TABLE [computer_std]. [dbo].[dim_store]
CREATE TABLE[computer_std]. [dbo].[dim_store](
    [StoreID] INT IDENTITY (1,1) PRIMARY KEY,
	[Shop_Name] [nvarchar](50) NOT NULL,
	[Shop_Age] [nvarchar](50) NOT NULL,
	[load_date] DATETIME DEFAULT GETDATE()
) 

---INSERTING VALUES INTO TABLE
INSERT INTO [computer_std]. [dbo].[dim_store](Shop_Name, Shop_Age)
SELECT DISTINCT Shop_Name,Shop_Age
FROM [computer_std].[dbo].[raw_pc_data]
END;
