SELECT * FROM {{ ref('adwords') }}
UNION ALL
SELECT * FROM {{ ref('bing') }}
UNION ALL 
SELECT * FROM {{ ref('criteo') }}
UNION ALL
SELECT * FROM {{ ref('facebook') }}
