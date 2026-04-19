--creating date dimensional table

Select distinct
Purchase_Date
 ,Ship_Date
  INTO [computer_std].[dbo].[dim_date]
 FROM [computer_std].[dbo].[raw_pc_data]

 ---creating customer dimensional table
 SELECT DISTINCT
[Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
     INTO [computer_std].[dbo].[dim_customer]
FROM[computer_std].[dbo].[raw_pc_data]

---creating employee dimensional table
SELECT DISTINCT
[Sales_Person_Name]
      ,[Sales_Person_Department]
     INTO [computer_std].[dbo].[dim_employee]
     FROM[computer_std].[dbo].[raw_pc_data]

     ---creating location dimensional table
     SELECT DISTINCT
[Continent]
      ,[Country_or_State]
      ,[Province_or_City]
INTO [computer_std].[dbo].[dim_location]
 FROM[computer_std].[dbo].[raw_pc_data]


 ---creating channel dimensional table
 SELECT DISTINCT
[Channel]
INTO [computer_std].[dbo].[dim_channel]
 FROM[computer_std].[dbo].[raw_pc_data]


 ---creating priority dimensional table
 SELECT DISTINCT
[Priority]
INTO [computer_std].[dbo].[dim_priority]
 FROM[computer_std].[dbo].[raw_pc_data]


 ---creating payment method dimensional table
 SELECT DISTINCT
[Payment_Method]
INTO [computer_std].[dbo].[dim_payment_method]
 FROM[computer_std].[dbo].[raw_pc_data]

 
 ---creating store dimensional table
 SELECT DISTINCT
[Shop_Name]
      ,[Shop_Age]
INTO [computer_std].[dbo].[dim_store]
 FROM[computer_std].[dbo].[raw_pc_data]

 ---creating product dimensional table
 SELECT DISTINCT
[PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[Storage_Capacity]
      ,[RAM]
INTO [computer_std].[dbo].[dim_product]
 FROM[computer_std].[dbo].[raw_pc_data]

 ---creating pc sales fact  dimensional table
 SELECT DISTINCT
[Cost_Price]
      ,[Sale_Price]
      ,[Discount_Amount]
      ,[Finance_Amount]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
      ,[Credit_Score]
INTO [computer_std].[dbo].[dim_fact_pc_sales]
 FROM[computer_std].[dbo].[raw_pc_data]