
DROP TABLE [computer_std].[dbo].[dim_location]
CREATE TABLE [computer_std].[dbo].[dim_location](
    [LocationID] INT IDENTITY (1,1) PRIMARY KEY,
	[Continent] [nvarchar](50) NOT NULL,
	[Country_or_State] [nvarchar](50) NOT NULL,
	[Province_or_City] [nvarchar](100) NOT NULL,
	[load_date] DATETIME DEFAULT GETDATE()
) 

---INSERTING VALUES INTO TABLE
INSERT INTO [computer_std].[dbo].[dim_location](Continent, Country_or_State, Province_or_City)
SELECT DISTINCT Continent, Country_or_State, Province_or_City
FROM [computer_std].[dbo].[raw_pc_data]

SELECT * FROM [computer_std].[dbo].[dim_location]