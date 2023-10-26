-- Média de Preço Mensal por Marca
SELECT
nome_marca,
AVG(valor) as media_preco
FROM public.silver_precos_fipe precos

