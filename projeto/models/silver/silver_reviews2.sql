{{ config(
  enabled=false
) }}
SELECT
    CAST(listing_id AS bigint) listing_id,
    CAST(id AS bigint) id,
    "date",
    CAST(reviewer_id AS bigint) reviewer_id,
    unaccent(reviewer_name) AS reviewer_name,
    unaccent("comments") AS "comments"
FROM public.bronze_reviews