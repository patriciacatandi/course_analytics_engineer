SELECT 
    "date",
    SUM(CASE WHEN "available" = 't' THEN 1 ELSE 0 END) AS total_available,
    SUM(CASE WHEN "available" = 't' THEN 1 ELSE 0 END)/COUNT("available") AS percent_available
FROM silver_calendar
GROUP BY "date"
ORDER BY "date"