{{ dbt_utils.union_relations(
    relations=[
        ref('adwords')
        ,ref('bing')
        ,ref('criteo')
        ,ref('facebook') 
    ]
) }}
