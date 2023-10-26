SELECT
DISTINCT
{{ dbt_utils.generate_surrogate_key(['fipe_code', 'year_model', 'engine_size', 'gear', 'fuel', 'model', 'brand', 
    'fipe_code', 'month_of_reference', 'year_of_reference']) }} as id,
fipe_code AS id_veiculo,
brand AS nome_marca,
to_date(CONCAT(year_of_reference, '-' , month_of_reference), 'YYYY-MONTH') AS data,
CAST(avg_price_brl AS numeric) AS valor
FROM public.bronze_fipe

