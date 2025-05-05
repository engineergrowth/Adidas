{{ config(materialized='table', unique_key='retailer_id') }}

select
    stg.retailer_id,
    min(stg.retailer) as retailer
from {{ ref('stg_adidas_sales') }} stg
group by stg.retailer_id
