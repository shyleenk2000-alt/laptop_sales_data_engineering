---CREATING A TABLE
DROP TABLE [computer_std].[dbo].[dim_employee]
CREATE TABLE [computer_std].[dbo].[dim_employee](
    [EmployeeID] INT IDENTITY (1,1) PRIMARY KEY,
	[Sales_Person_Name] [nvarchar](50) NOT NULL,
	[Sales_Person_Department] [nvarchar](50) NOT NULL,
	[load_date] DATETIME DEFAULT GETDATE()
) 

---INSERTING VALUES INTO TABLE
INSERT INTO [computer_std].[dbo].[dim_employee](Sales_Person_Name, Sales_Person_Department)
SELECT DISTINCT Sales_Person_Name, Sales_Person_Department
FROM[computer_std].[dbo].[raw_pc_data]

SELECT * FROM[computer_std].[dbo].[dim_employee]