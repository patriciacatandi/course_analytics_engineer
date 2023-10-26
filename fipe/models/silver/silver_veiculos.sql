
SELECT
    DISTINCT
    {{ dbt_utils.generate_surrogate_key(['fipe_code', 'year_model', 'engine_size', 'gear', 'fuel', 'model', 'brand', 
    'fipe_code', 'month_of_reference', 'year_of_reference']) }} as id,
    fipe_code AS codigo_fipe, -- não vai ser unico, certo?
    model AS nome_veiculo,
    gear AS cambio,
    fuel AS combustivel,
    CAST(year_model AS INT) AS ano, 
    CAST(engine_size AS numeric) AS motor
FROM public.bronze_fipe