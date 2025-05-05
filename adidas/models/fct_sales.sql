{{ config(materialized='table') }}

select
    -- Foreign Keys
    loc.location_id,
    prod.product_id,
    ret.retailer_id,
    dd.date_day,

    -- Measures / Facts
    stg.sales_method,
    stg.price_per_unit,
    stg.units_sold,
    stg.operating_profit,
    stg.operating_margin


from {{ ref('stg_adidas_sales') }} stg

left join {{ ref('dim_locations') }} loc
    on stg.region = loc.region
    and stg.state = loc.state
    and stg.city = loc.city

left join {{ ref('dim_products') }} prod
    on stg.product_name = prod.product_name

left join {{ ref('dim_retailers') }} ret
    on stg.retailer = ret.retailer

left join {{ ref('dim_dates') }} dd
    on stg.invoice_date = dd.date_day
