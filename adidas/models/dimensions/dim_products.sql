{{ config(materialized='table', unique_key='product_id') }}

select distinct
    {{ dbt_utils.generate_surrogate_key(['product_name']) }} as product_id,
    stg.product_name
from {{ ref('stg_adidas_sales') }} stg
