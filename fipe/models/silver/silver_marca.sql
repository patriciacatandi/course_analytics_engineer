
WITH unique_brand AS (
SELECT
    DISTINCT
    brand AS nome_marca,
    CURRENT_TIMESTAMP AS data_criacao
FROM public.bronze_fipe
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['nome_marca']) }} as id,
    nome_marca,
    data_criacao
FROM unique_brand