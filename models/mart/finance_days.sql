SELECT 
date_date
, COUNT (orders_id) AS total_nb_transactions
, ROUND(SUM(revenue), 2) AS total_revenue
, ROUND ((SUM (revenue) / COUNT (orders_id)), 2) AS average_basket
, ROUND(SUM (operational_margin), 2) AS operational_margin
, ROUND(SUM (purchase_cost), 2) AS total_purchase_cost
, ROUND (SUM (shipping_fee), 2) AS total_shipping_fee
, ROUND (SUM (logCost), 2) AS total_logCost
, SUM (quantity) AS total_qty_product_sold
FROM {{ref ('int_orders_operational')}}
GROUP BY date_date