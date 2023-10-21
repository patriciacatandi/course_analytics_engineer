SELECT 
    cidade,
    estado,
    produto,
    ROUND(AVG(preco_venda)::numeric, 2) as media_preco
-- FROM public.tb_precos_combustiveis
FROM {{ ref('tb_precos_combustiveis') }} ref
WHERE cidade IN ('CURITIBA', 'RIO BRANCO', 'RIO DE JANEIRO')
GROUP BY cidade, estado,
    produto
ORDER BY estado, cidade, 
    produto