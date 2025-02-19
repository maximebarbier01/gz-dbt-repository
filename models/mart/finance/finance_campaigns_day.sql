SELECT 
    date_date
    ,ROUND(f.operational_margin - c.ads_cost,2) AS ads_margin
    ,f.average_basket
    ,f.operational_margin
    ,c.ads_cost
    ,c.ads_impression
    ,c.ads_clicks
    ,f.total_pdt_sold 
    ,f.total_purchase_cost AS purchase_cost
    ,f.margin
    ,f.total_shipping_fee AS shipping_fee
    ,f.total_log_cost AS log_cost 
    ,f.ship_cost
FROM {{ ref('int_campaigns_day') }} c
LEFT JOIN {{ ref('finance_days') }} f
USING(date_date)
ORDER BY date_date DESC
