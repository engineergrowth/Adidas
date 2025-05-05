# Adidas Sales Analytics Dashboard

## Overview
This project showcases a complete data pipeline and dashboard solution for analyzing Adidas US sales data. It covers data extraction using Python, transformation and modeling in dbt, and visualization in Power BI. The final output is a dynamic, filterable dashboard highlighting key sales insights by product, retailer, and sales method.

## Key Features
- Extracted and parsed sales data using Python and Pandas  
- Loaded raw sales data into Snowflake using SQLAlchemy  
- Modeled a star schema using dbt (dimensions and fact tables)  
- Built a Power BI dashboard with interactive KPIs and visualizations  
- Enabled drill-through and cross-filtering for user exploration  

## Dataset
The dataset was sourced from Kaggle and includes Adidas US sales figures such as:  
- Retailer  
- Product type  
- Sales method (Online, Outlet, In-Store)  
- Units sold, Revenue, and Operating Profit  
- Geographic location and date of sale  

## Architecture

**Pipeline Flow:**  
```mermaid 
flowchart TD
    Excel[Source: Excel Sales File] --> Python[Parse & Load with Python]
    Python --> SnowflakeRaw[Snowflake - Raw Table]
    SnowflakeRaw --> dbt[Transform with dbt]
    dbt --> SnowflakeModels[Snowflake - Dimensional Models]
    SnowflakeModels --> PowerBI[Power BI Dashboard]

    style Excel fill:#2C3E50,stroke:#34495E,stroke-width:1px,color:#ECF0F1
    style Python fill:#3B4D61,stroke:#34495E,stroke-width:1px,color:#ECF0F1
    style SnowflakeRaw fill:#2F4F4F,stroke:#34495E,stroke-width:1px,color:#ECF0F1
    style dbt fill:#3B5998,stroke:#1E2A38,stroke-width:1px,color:#FFFFFF
    style SnowflakeModels fill:#1D8348,stroke:#117A65,stroke-width:1px,color:#ECF0F1
    style PowerBI fill:#1B4F72,stroke:#154360,stroke-width:1px,color:#ECF0F1
```

## Pipeline Workflow

### 1. Python Ingestion
- Parsed Excel with `pandas.read_excel`  
- Dropped unnecessary columns and printed schema  
- Loaded data into Snowflake using `SQLAlchemy`  

### 2. dbt Modeling
- Created staging models to clean and standardize raw data  
- Built dimension tables: `dim_dates`, `dim_locations`, `dim_products`, `dim_retailers`  
- Built fact table: `fct_sales`  
- All transformations defined in modular SQL with `dbt run` and materializations  

### 3. Power BI
- Connected to Snowflake models via DirectQuery  
- Created interactive visuals: KPIs, trend line, bar charts, and pie chart  
- Implemented slicers for Retailer, Product, and Sales Method  

## Dimensional Model
**Star schema design built in dbt:**  
 
![Dimensional Model](images/model.png)

## Power BI Dashboard
The final dashboard includes:  
- KPI cards for Total Revenue, Units Sold, Operating Profit, and Profit Margin  
- Time-based Revenue trend  
- Revenue breakdowns by Retailer, Product, and Sales Method  
- Interactive slicers for all key dimensions  

**Dashboard Screenshot:**  
![Power BI dashboard](images/dashboard.png)

## Installation & Usage
1. Set up a Snowflake account and create a database/schema  
2. Create a `.env` file with your Snowflake credentials  
3. Run `main.py` to load raw data into a staging table  
4. Initialize and run the dbt project to build models in Snowflake  
5. Open the Power BI file and connect it to your Snowflake schema  

## Tools Used
- Python (`pandas`, `SQLAlchemy`)  
- dbt (modular SQL modeling and transformations)  
- Snowflake (cloud data warehouse)  
- Power BI (dashboarding and visualization)

