{{ config(
  enabled=true
) }}

SELECT 
  CAST(listing_id AS int) AS listing_id,
	"date",
  CASE
   WHEN available = 't' THEN 1 
   WHEN available = 'f' THEN 0
   ELSE null
  END AS available,
  CAST(replace(replace(price, '$', '') , ',', '') AS numeric) AS price,
  CAST(replace(replace(adjusted_price, '$', ''), ',', '') AS numeric) AS adjusted_price,
  CAST(minimum_nights AS int) minimum_nights,
  CAST(maximum_nights AS int) maximum_nights
FROM public.bronze_calendar