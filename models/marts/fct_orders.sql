{{ config(materialized='table') }}

select
  oi.order_id,
  o.customer_id,
  o.order_date,
  o.status,
  oi.product_id,
  p.category,
  oi.quantity,
  p.price as unit_price,
  oi.total_price
from {{ ref('stg_order_items') }} as oi
left join {{ ref('stg_orders') }} as o
  on oi.order_id = o.order_id
left join {{ ref('stg_products') }} as p
  on oi.product_id = p.product_id
