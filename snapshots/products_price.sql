{% snapshot products_snapshot %}

{{
    config(
      target_schema='dbt_snapshots', 
      unique_key='products_id', 
      strategy='check', 
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('product') }}

{% endsnapshot %}