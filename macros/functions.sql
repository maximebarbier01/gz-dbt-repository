{% macro margin_percent (purchase_cost, revenue)%}
    ROUND(SAFE_DIVIDE({{ revenue }} - {{ purchase_cost }},{{ revenue }})*100, 2)
{% endmacro %}