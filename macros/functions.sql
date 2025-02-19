{% macro margin_percent (margin, revenue)%}
    ROUND({{ margin }} / NULLIF({{ revenue }}, 0)*100, 2)
{% endmacro %}