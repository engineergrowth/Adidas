{{ config(materialized='table', unique_key='retailer') }}

SELECT DISTINCT
    retailer
FROM {{ ref('stg_adidas_sales') }}
