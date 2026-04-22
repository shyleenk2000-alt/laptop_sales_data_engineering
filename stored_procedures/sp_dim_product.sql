CREATE PROCEDURE sp_create_dim_product
  
AS
BEGIN
  ---CREATING A TABLE

DROP TABLE [computer_std].[dbo].[dim_product]
CREATE TABLE [computer_std].[dbo].[dim_product](
    [ProductID] INT IDENTITY (1,1) PRIMARY KEY,
	[PC_Make] [nvarchar](50) NOT NULL,
	[PC_Model] [nvarchar](50) NOT NULL,
	[Storage_Type] [nvarchar](50) NOT NULL,
	[Storage_Capacity] [nvarchar](50) NOT NULL,
	[RAM] [nvarchar](50) NOT NULL,
	[load_date] DATETIME DEFAULT GETDATE()
) 

---Inserting values into table
INSERT INTO [computer_std].[dbo].[dim_product](PC_Make, PC_Model, Storage_Type, Storage_Capacity, RAM)
SELECT  DISTINCT PC_Make, PC_Model, Storage_Type, Storage_Capacity, RAM
FROM [computer_std].[dbo].[raw_pc_data]
END;