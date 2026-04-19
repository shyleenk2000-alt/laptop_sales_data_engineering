---CREATING A TABLE
DROP TABLE [computer_std]. [dbo].[dim_payment_method]
CREATE TABLE[computer_std]. [dbo].[dim_payment_method](
    [PaymentMethodID] INT IDENTITY (1,1) PRIMARY KEY,
	[Payment_Method] [nvarchar](50) NOT NULL,
	[load_date] DATETIME DEFAULT GETDATE()
) 

---INSERTING VALUES INTO TABLE
INSERT INTO [computer_std]. [dbo].[dim_payment_method](Payment_Method)
SELECT DISTINCT Payment_Method
FROM[computer_std].[dbo].[raw_pc_data]

SELECT * FROM [computer_std]. [dbo].[dim_payment_method]
