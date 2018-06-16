# Data-Warehousing-and-Business-Intelligence

## Project Overview
*	Developed a data warehouse, pipelining data from diverse sources such as CSV, XML, MySQL, Postgres SQL and SQL Server using Talend Data Integration and SSIS. 
*	Designed star schema dimensional model on the data set, loading facts and dimensions. 
*	Implemented Error Handling, Load Statistics, Slowly Changing Dimensions, Currency Conversion and Performance Tuning. 
*	Built custom dashboards to analyze sales and customer segmentation using Tableau, Qlik Sense and PowerBI.


### This project involves a retail company that sells a variety of products to people and to business across variety of sales channels. 
### The retail company: 
* Creates a data warehouse (DW) from its various systems of records (SORs)
* Creates BI applications that enable analysis of business performance 

### The DW will store (Facts) in the following subject areas: 

* Sales 
* Inventory 
* Sales Quota
* Strategy Plans 

### The Retail Company had the following products which were sold: 

> Audio
> TV and Video
> Computers
> Cameras and camcorders
> Cell phones
> Music, Movies and Audio Books 
> Games and Toys 
> Home Appliances 

* The company has 4 sales channels: 
  * Retail
  * Stores
  * Catalog
  * Online
  
* Three top-level geographic regions: 
  * North America 
  * Europe
  * Asia 
  
* Customers who purchased products are tracked in : 
  * Catalog
  * Online 
  
## Retail Company SOR  
  
 |Database   |Business Area  | dbms    |
 |-----------|---------------|---------|
 |Retail_SOR_NA   |North America |Microsoft SQL Server   |
 |Retail_SOR_EU   |Europe  |MySQL    |
 |Retail_SOR_AS   |Asia |PostgreSQL   |
 |Retail_SOR_CAT  |Catalog |Oracle  |
 |Flat Files |Cross-unit reference data |csv,text delimited  |
 
* DW has dimensional model to support: 
  * Sales Analysis 
  * Inventory Analysis 
  * Sales quota & planning analysis 

* DI: Loading data sources into DW 
  * SOR: flat files, SQL Server, PostgreSQL, MySQL and Oracle 
  * DW: MySQL
  * ETL: Talend 
  
* BI: Dashboards, Reports & Visualizations 
  * Inventory Analysis 
  * Sales quota & planning analysis 
 


