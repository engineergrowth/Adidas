{{ config(materialized='view') }}

select
    "Retailer" as retailer,
    "Retailer ID" as retailer_id,
    "Invoice Date" as invoice_date,
    "Region" as region,
    "State" as state,
    "City" as city,
    "Product" as product_name,
    "Price per Unit" as price_per_unit,
    "Units Sold" as units_sold,
    "Total Sales" as total_sales,
    "Operating Profit" as operating_profit,
    "Operating Margin" as operating_margin,
    "Sales Method" as sales_method
from {{ source('adidas', 'RAW_ADIDAS_SALES') }}