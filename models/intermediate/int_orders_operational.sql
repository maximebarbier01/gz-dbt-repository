SELECT 
    orders_id
    ,date_date
    ,ROUND(SUM(revenue),2) AS revenue
    ,ROUND(SUM(margin),2) AS margin
    ,ROUND(SUM(margin + shipping_fee - log_cost - ship_cost),2) AS operational_margin
    ,SUM(purchase_cost) AS purchase_cost
    ,SUM(shipping_fee) AS shipping_fee
    ,sum(log_cost) AS log_cost
    ,SUM(quantity) AS quantity
FROM {{ ref('int_orders_margin') }}
JOIN {{ ref('ship') }}
USING(orders_id)
GROUP BY orders_id, date_date
ORDER BY orders_id DESC, date_date 