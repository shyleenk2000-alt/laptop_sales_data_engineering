---CREATING A TABLE
DROP TABLE [computer_std].[dbo].[dim_priority]
CREATE TABLE[computer_std].[dbo].[dim_priority](
    [PriorityID] INT IDENTITY (1,1) PRIMARY KEY,
	[Priority] [nvarchar](50) NOT NULL,
	[load_date] DATETIME DEFAULT GETDATE()
) 

---INSERTING VALUES INTO TABLE
INSERT INTO [computer_std].[dbo].[dim_priority](Priority)
SELECT DISTINCT (Priority)
FROM[computer_std].[dbo].[raw_pc_data]

SELECT * FROM[computer_std].[dbo].[dim_priority]

