{{
    config(
        unique_key="neighbourhood",
        on_schema_changes="sync_all_columns"
    )
}}
SELECT
    neighbourhood,
    ROUND(AVG(price)::numeric, 2) as mean_price,
    ROUND(AVG(accommodates)::numeric, 2) as mean_accommodates,
    ROUND(AVG(bedrooms)::numeric, 2) as mean_bedrooms,
    ROUND(AVG(beds)::numeric, 2) as mean_beds
FROM silver_listings
GROUP BY neighbourhood
ORDER BY neighbourhood