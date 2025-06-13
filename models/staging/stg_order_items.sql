{{ config(materialized='view') }}

select
  order_item_id,
  order_id,
  product_id,
  quantity,
  total_price
from {{ source('raw', 'order_items') }}
