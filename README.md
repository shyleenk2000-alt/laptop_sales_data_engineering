# laptop_sales_data_engineering
Overview
This project focuses on transforming raw PC sales data from a CSV file into a structured data warehouse using a star schema design. The goal is to enable efficient querying, reporting, and analytics for business insights.


🧱 Star Schema Design
The schema was designed using draw.io to clearly define relationships between the fact and dimension tables.


The schema consists of:

Fact Table: Fact_PC_Sales

Dimension Tables:
Dim_Date
Dim_Customer
Dim_Employee
Dim_Product
Dim_Store
Dim_Location
Dim_Payment
Dim_Channel
Dim_Priority


Each dimension table contains descriptive attributes, while the fact table stores measurable metrics such as sales, cost, discount, and finance amounts.



⚙️ Implementation
Imported raw data from a CSV file
Designed the schema visually using draw.io
Implemented the star schema in SQL
Created dimension and fact tables with appropriate data types
Generated and assigned primary and foreign keys (IDs)
Established relationships between tables
Prepared queries to join tables for analysis


🔄 ETL Pipeline (In Progress)
We are currently developing ETL pipelines to:
Extract data from source files
Transform and clean the data
Load it into the data warehouse


🛠️ Tools & Technologies
SQL
Data Warehousing Concepts
Star Schema Modeling
draw.io


🎯 Project Goals
Build a scalable and optimized data warehouse
Enable efficient business intelligence and reporting
Gain insights into PC sales performance


🚀 Future Improvements
Complete ETL automation
Build dashboards for data visualization
Optimize queries for performance
