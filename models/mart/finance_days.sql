SELECT
    date_date
    ,COUNT(orders_id) AS nb_transactions
    ,SUM(revenue) AS revenue
    ,AVG(revenue) AS average_basket
    ,SUM(operational_margin) AS operational_margin
    ,SUM(purchase_cost) AS purchase_cost
    ,SUM(shipping_fee) AS total_shipping_fee
    ,sum(log_cost) AS log_cost
    ,SUM(quantity) AS total_pdt_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
ORDER BY date_date