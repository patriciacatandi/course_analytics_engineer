{{
    config(
        unique_key="date",
        on_schema_changes="sync_all_columns",
        sort="date",
    )
}}

SELECT
    "date",
    ROUND(AVG(price)::numeric, 2) as mean_price,
    ROUND(AVG(adjusted_price)::numeric, 2) as mean_adjusted_price
FROM silver_calendar
GROUP BY "date"
ORDER BY "date"