
DROP TABLE [computer_std].[dbo].[dim_date]
CREATE TABLE [computer_std].[dbo].[dim_date](
    [DateID] INT IDENTITY (1,1) PRIMARY KEY,
	[Purchase_Date] [datetime2](7) NOT NULL,
	[Ship_Date] [nvarchar](50) NOT NULL,
	[load_date] DATETIME DEFAULT GETDATE()
) 

---Inserting values into table
INSERT INTO [computer_std].[dbo].[dim_date] (Purchase_Date, Ship_Date)
SELECT DISTINCT Purchase_Date, Ship_Date
FROM[computer_std].[dbo].[raw_pc_data]

SELECT * FROM [computer_std].[dbo].[dim_date] 