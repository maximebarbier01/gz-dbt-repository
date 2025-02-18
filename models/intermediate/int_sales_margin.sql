SELECT
    *
    ,quantity * CAST(purchase_price AS FLOAT64) AS purchase_cost
    ,ROUND(revenue - quantity * CAST(purchase_price AS FLOAT64),2) AS margin
FROM {{ ref('sales') }}
JOIN {{ ref('product') }}
USING(products_id)