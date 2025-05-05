{{ config(materialized='table', unique_key='location_id') }}

select distinct
    {{ dbt_utils.generate_surrogate_key(['stg.region', 'stg.state', 'stg.city']) }} as location_id,
    stg.region,
    stg.state,
    stg.city
from {{ ref('stg_adidas_sales') }} stg
