SELECT COUNT (*) FROM raw_pc_data as std
inner join [computer_std].[dbo].[dim_channel] ch 
on std.Channel = ch.channel

inner join [computer_std].[dbo].[dim_customer] c 
on std.Customer_Name = c.customer_name
and std.Customer_Surname = c.customer_surname
and std.Customer_Contact_Number = c.customer_contact_number
and std.Customer_Email_Address = c.customer_email_address

inner join [computer_std].[dbo].[dim_date] d 
on std.Purchase_Date = d.purchase_date
and std.Ship_Date = d.ship_date

inner join [computer_std].[dbo].[dim_store] s 
on std.Shop_Name =s.shop_name
and std.Shop_Age = s.shop_age


inner join[computer_std].[dbo].[dim_priority] pr 
on std.Priority = pr.priority

inner join[computer_std].[dbo].[dim_employee] e 
on std.Sales_Person_Name = e.sales_person_name
and std.Sales_Person_Department = e.sales_person_department

inner join [computer_std].[dbo].[dim_location] l 
on std.Continent = l.continent
and std.Province_or_City = l.province_or_city
and std.Country_or_State = l.country_or_state

inner join [computer_std].[dbo].[dim_payment_method] pm 
on std.Payment_Method = pm.payment_method


inner join [computer_std].[dbo].[dim_product] p 
on std.PC_Model = p.pc_model
and std.PC_Make =p.pc_make
and std.Storage_Capacity = p.storage_capacity
and std.Storage_Type = p.storage_type
and std.Ram = p.ram

