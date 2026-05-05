CREATE OR ALTER PROCEDURE sp_create_fact_pc1_sales
AS
BEGIN
    SET NOCOUNT ON;

    -- Create table only if it does not exist
    IF NOT EXISTS (
        SELECT 1
        FROM sys.tables
        WHERE name = 'fact_pc_sales'
          AND schema_id = SCHEMA_ID('dbo')
    )
    BEGIN
        CREATE TABLE [computer_std].[dbo].[fact_pc_sales](
            [SalesID] INT IDENTITY (1,1) PRIMARY KEY,
            [ChannelID] INT NOT NULL,
            [CustomerID] INT NOT NULL,
            [DateID] INT NOT NULL, 
            [StoreID] INT NOT NULL,
            [PriorityID] INT NOT NULL,
            [EmployeeID] INT NOT NULL,
            [LocationID] INT NOT NULL,
            [PaymentMethodID] INT NOT NULL,
            [ProductID] INT NOT NULL,
            [Cost_Price] DECIMAL(10, 2) NOT NULL,
            [Sale_Price] DECIMAL(10, 2) NOT NULL,
            [Discount_Amount] DECIMAL(10, 2) NOT NULL,
            [Finance_Amount] DECIMAL(10, 2) NOT NULL,
            [Cost_of_Repairs] DECIMAL(10, 2) NOT NULL,
            [Total_Sales_per_Employee] DECIMAL(10, 2) NOT NULL,
            [PC_Market_Price] DECIMAL(10, 2) NOT NULL,
            [Credit_Score] INT NOT NULL,
            [load_date] DATETIME DEFAULT GETDATE()
        );
    END;

    -- Insert data into fact table
    INSERT INTO [computer_std].[dbo].[fact_pc_sales](
        ChannelID, 
        CustomerID, 
        DateID, 
        StoreID,
        PriorityID,
        EmployeeID,
        LocationID,
        PaymentMethodID,
        ProductID, 
        Cost_Price, 
        Sale_Price,
        Discount_Amount,
        Finance_Amount,  
        Cost_of_Repairs, 
        Total_Sales_per_Employee, 
        PC_Market_Price,
        Credit_Score
    )
    SELECT 
        ch.ChannelID, 
        c.CustomerID, 
        d.DateID, 
        s.StoreID,
        pr.PriorityID,
        e.EmployeeID,
        l.LocationID,
        pm.PaymentMethodID,
        p.ProductID, 
        std.Cost_Price, 
        std.Sale_Price,
        std.Discount_Amount,
        std.Finance_Amount,  
        std.Cost_of_Repairs, 
        std.Total_Sales_per_Employee, 
        std.PC_Market_Price,
        std.Credit_Score
    FROM [computer_std].[dbo].[raw_pc_data] AS std

    INNER JOIN [computer_std].[dbo].[dim_channel] ch 
        ON std.Channel = ch.channel

    INNER JOIN [computer_std].[dbo].[dim_customer] c 
        ON std.Customer_Name = c.customer_name
        AND std.Customer_Surname = c.customer_surname
        AND std.Customer_Contact_Number = c.customer_contact_number
        AND std.Customer_Email_Address = c.customer_email_address

    INNER JOIN [computer_std].[dbo].[dim_date] d 
        ON std.Purchase_Date = d.purchase_date
        AND std.Ship_Date = d.ship_date

    INNER JOIN [computer_std].[dbo].[dim_store] s 
        ON std.Shop_Name = s.shop_name
        AND std.Shop_Age = s.shop_age

    INNER JOIN [computer_std].[dbo].[dim_priority] pr 
        ON std.Priority = pr.priority

    INNER JOIN [computer_std].[dbo].[dim_employee] e 
        ON std.Sales_Person_Name = e.sales_person_name
        AND std.Sales_Person_Department = e.sales_person_department

    INNER JOIN [computer_std].[dbo].[dim_location] l 
        ON std.Continent = l.continent
        AND std.Province_or_City = l.province_or_city
        AND std.Country_or_State = l.country_or_state

    INNER JOIN [computer_std].[dbo].[dim_payment_method] pm 
        ON std.Payment_Method = pm.payment_method

    INNER JOIN [computer_std].[dbo].[dim_product] p 
        ON std.PC_Model = p.pc_model
        AND std.PC_Make = p.pc_make
        AND std.Storage_Capacity = p.storage_capacity
        AND std.Storage_Type = p.storage_type
        AND std.Ram = p.ram;

    -- View results
    SELECT * FROM [computer_std].[dbo].[fact_pc_sales];

END;