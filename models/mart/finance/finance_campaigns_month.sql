select
    DATE_TRUNC(date_date, MONTH) AS datemonth
    ,ROUND(SUM(c.ads_margin),2) AS ads_margin
    ,ROUND(SUM(c.average_basket),2) AS average_basket
    ,ROUND(SUM(c.operational_margin),2) AS operational_margin
    ,ROUND(SUM(c.ads_cost),2) AS ads_cost
    ,ROUND(SUM(c.ads_impression),2) AS ads_impression
    ,ROUND(SUM(c.total_pdt_sold),2) AS quantity
    ,ROUND(SUM(f.revenue),2) AS revenue
    ,ROUND(SUM(c.purchase_cost)) AS purchase_cost
    ,ROUND(SUM(c.margin)) AS margin
    ,ROUND(SUM(c.shipping_fee)) AS shipping_fee
    ,ROUND(SUM(c.log_cost)) AS log_cost
    ,ROUND(SUM(c.ship_cost)) AS ship_cost
FROM {{ ref('finance_campaigns_day') }} c
LEFT JOIN {{ ref('finance_days') }} f
USING(date_date)
GROUP BY datemonth
ORDER BY datemonth DESC