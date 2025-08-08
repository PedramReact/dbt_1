SELECT *
FROM {{ ref('caracteristique') }}
WHERE jour < 1 OR jour > 31