with

ship as (

select * from {{ ref('stg_raw__ship') }}

),

margin as (

select * from {{ ref('int_orders_margin') }}

),

operational_margin as (

SELECT
margin.orders_id
, margin.date_date
, margin.revenue
, margin.quantity
, margin.purchase_cost
, margin.margin
, ship.shipping_fee
, ship.logCost
, ship.ship_cost
, (margin.margin + ship.shipping_fee - ship.logCost - ship.ship_cost) AS operational_margin

FROM margin
LEFT JOIN ship 
ON margin.orders_id = ship.orders_id
)

SELECT * FROM operational_margin