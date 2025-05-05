{{ config(materialized='table', unique_key='date_day') }}

{% set start_date = '2020-01-01' %}
{% set end_date = '2021-12-31' %}

with recursive date_series as (
    select to_date('{{ start_date }}') as date_day
    union all
    select dateadd(day, 1, date_day)
    from date_series
    where date_day < to_date('{{ end_date }}')
)

select
    date_day,
    year(date_day) as year,
    month(date_day) as month,
    day(date_day) as day,
    dayofweek(date_day) as day_of_week,
    dayofyear(date_day) as day_of_year,
    weekofyear(date_day) as week_of_year,
    monthname(date_day) as month_name,
    dayname(date_day) as day_name,
    quarter(date_day) as quarter
from date_series
order by date_day