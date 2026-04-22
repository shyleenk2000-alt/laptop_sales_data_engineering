CREATE PROCEDURE sp_create_pc_sales
 
AS
BEGIN
---CREATING A TABLE

DROP TABLE [computer_std]. [dbo].[dim_fact_pc_sales]
CREATE TABLE[computer_std]. [dbo].[dim_fact_pc_sales](
    [SalesID] INT IDENTITY (1,1) PRIMARY KEY,
	[ChannelID] INT,
	[CustomerID] INT,
	[DateID] INT, 
	[StoreID] INT,
	[PriorityID] INT,
	[EmployeeID] INT,
	[LocationID] INT,
	[PaymentMethodID] INT,
	[ProductID] INT,
	[Cost_Price] [int] NOT NULL,
	[Sale_Price] [int] NOT NULL,
	[Discount_Amount] [int] NOT NULL,
	[Finance_Amount] [nvarchar](50) NOT NULL,
	[Cost_of_Repairs] [nvarchar](50) NOT NULL,
	[Total_Sales_per_Employee] [int] NOT NULL,
	[PC_Market_Price] [int] NOT NULL,
	[Credit_Score] [int] NOT NULL,
	--CONSTRAINT fk_CustomerID
	           --foreign key (CustomerID)
			  -- references [computer_std]. [dbo].[dim_customer] (CustomerID),
	--CONSTRAINT fk_ChannelID
	            --foreign key (ChannelID)
				--references [computer_std]. [dbo].[dim_channel] (ChannelID),
	--CONSTRAINT fk_DateID
	         -- foreign key (DateID)
			  -- references [computer_std]. [dbo].[dim_date] (DateID),
	--CONSTRAINT fk_EmployeeID
	           --foreign key (EmployeeID)
			  -- references [computer_std]. [dbo].[dim_employee] (EmployeeID),
	--CONSTRAINT fk_LocationID
	          -- foreign key (LocationID)
			   --references [computer_std]. [dbo].[dim_location] (LocationID),
	--CONSTRAINT fk_PriorityID
	          --foreign key (PriorityID)
			 -- references [computer_std]. [dbo].[dim_priority] (PriorityID),
	--CONSTRAINT fk_PaymentMethodID
	          -- foreign key (PaymentMethodID)
			   --references [computer_std]. [dbo].[dim_payment_method] (PaymentMethodID),
	--CONSTRAINT fk_StoreID
	           --foreign key (StoreID)
			   --references [computer_std]. [dbo].[dim_store] (StoreID),
	--CONSTRAINT fk_ProductID
	           --foreign key (ProductID)
			  -- references [computer_std]. [dbo].[dim_product] (ProductID),
  

	[load_date] DATETIME DEFAULT GETDATE()
) 

---INSERTING VALUES INTO A TABLE
INSERT INTO[computer_std]. [dbo].[dim_fact_pc_sales](Cost_Price, Sale_Price, Discount_Amount, Finance_Amount, Cost_of_Repairs, Total_Sales_per_Employee, PC_Market_Price, Credit_Score)
SELECT DISTINCT Cost_Price,
                Sale_Price,
				Discount_Amount,
				Finance_Amount,
				Cost_of_Repairs,
				Total_Sales_per_Employee,
				PC_Market_Price,
				Credit_Score
FROM [computer_std].[dbo].[raw_pc_data]
END;