WITH m_sub AS (
SELECT
    *
    ,quantity * CAST(purchase_price AS FLOAT64) AS purchase_cost
    ,ROUND(revenue - quantity * CAST(purchase_price AS FLOAT64),2) AS margin
FROM {{ ref('sales') }}
LEFT JOIN {{ ref('product') }}
USING (products_id)
)
SELECT 
    *
    ,{{margin_percent('purchase_cost','revenue')}} AS margin_percent
FROM m_sub