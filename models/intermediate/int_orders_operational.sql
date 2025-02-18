SELECT 
    orders_id
    ,date_date
    ,SUM(quantity) AS nb_transactions
    ,ROUND(SUM(revenue),2) AS revenue
    ,ROUND(AVG(margin),2) AS average_basket
    ,ROUND(SUM(margin),2) AS margin
    ,ROUND(SUM(margin + shipping_fee - log_cost - ship_cost),2) AS operational_margin
FROM {{ ref('int_orders_margin') }}
JOIN {{ ref('ship') }}
USING(orders_id)
GROUP BY orders_id, date_date
ORDER BY orders_id DESC, date_date 