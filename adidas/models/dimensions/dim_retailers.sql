{{ config(materialized='table', unique_key='retailer_id') }}

select distinct
    stg.retailer_id,
    stg.retailer
from {{ ref('stg_adidas_sales') }} stg