---Creating a table with id
DROP TABLE [computer_std].[dbo].[dim_channel]
CREATE TABLE [computer_std].[dbo].[dim_channel](
    [ChannelID] INT IDENTITY (1,1) PRIMARY KEY,
	[Channel] [nvarchar](50) NOT NULL
	[load_date] DATETIME DEFAULT GETDATE()
) 

---Inserting values into table
INSERT INTO [computer_std].[dbo].[dim_channel](Channel)
SELECT DISTINCT Channel
FROM[computer_std].[dbo].[raw_pc_data]

SELECT *FROM [computer_std].[dbo].[dim_channel]