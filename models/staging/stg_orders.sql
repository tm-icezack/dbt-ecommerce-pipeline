{{ config(materialized='view') }}

select
  order_id,
  customer_id,
  order_date,
  status
from {{ source('raw', 'orders') }}
