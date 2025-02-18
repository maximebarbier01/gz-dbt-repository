SELECT 
    orders_id
    ,date_date
    ,ROUND(SUM(margin + shipping_fee - log_cost - ship_cost),2) AS operational_margin
FROM {{ ref('int_orders_margin') }}
JOIN {{ ref('ship') }}
USING(orders_id)
GROUP BY orders_id, date_date
ORDER BY orders_id DESC, date_date 