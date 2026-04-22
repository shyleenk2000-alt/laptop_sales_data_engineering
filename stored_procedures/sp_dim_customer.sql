CREATE PROCEDURE sp_create_dim_customer
  
AS
BEGIN
---creating a table with id
DROP TABLE [computer_std].[dbo].[dim_customer]
CREATE TABLE  [computer_std].[dbo].[dim_customer]( 
[CustomerID] INT IDENTITY (1,1) PRIMARY KEY,
	[Customer_Name] [nvarchar](50) NOT NULL,
	[Customer_Surname] [nvarchar](50) NOT NULL,
	[Customer_Contact_Number] [nvarchar](50) NOT NULL,
	[Customer_Email_Address] [nvarchar](50) NOT NULL,
	[load_date] DATETIME DEFAULT GETDATE()

) 


---Inserting values into table

INSERT INTO [computer_std].[dbo].[dim_customer] (Customer_Name, Customer_Surname, Customer_Contact_Number, Customer_Email_Address)
SELECT Customer_Name, Customer_Surname, Customer_Contact_Number, Customer_Email_Address
FROM [computer_std].[dbo].[raw_pc_data]

  
END;