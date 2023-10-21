SELECT
    "Municipio" as cidade,
    "Estado - Sigla" as estado,
    CAST(REPLACE("Valor de Venda", ',', '.') AS float) AS preco_venda,
    -- CAST(REPLACE("Valor de Venda", ',', '.') AS numeric) AS preco_venda,
    "Produto" AS produto

FROM public.preco_combustiveis
