{{ config(
  enabled=true
) }}

SELECT
listing_url,
CAST(scrape_id AS bigint) scrape_id,
last_scraped,
"source",
"name",
unaccent("description") AS "description",
unaccent(neighborhood_overview) AS neighborhood_overview,
picture_url,
CAST(host_id AS bigint) host_id,
host_url,
unaccent(host_name) host_name,
CAST(host_since AS date) host_since,
unaccent(host_location) host_location,
unaccent(host_about)host_about,
host_response_time,
CAST(replace(replace(host_response_rate, '%', ''), 'N/A', null) AS int) host_response_rate,
CAST(replace(replace(host_acceptance_rate, '%', ''), 'N/A', null) AS int) host_acceptance_rate,
CASE
   WHEN host_is_superhost = 't' THEN 1 
   WHEN host_is_superhost = 'f' THEN 0
   ELSE null
  END AS host_is_superhost,
host_thumbnail_url,
host_picture_url,
unaccent(host_neighbourhood) host_neighbourhood,
CAST(host_listings_count AS int) host_listings_count,
CAST(host_total_listings_count AS int) host_total_listings_count,
host_verifications,
CASE
   WHEN host_has_profile_pic = 't' THEN 1 
   WHEN host_has_profile_pic = 'f' THEN 0
   ELSE null
  END AS host_has_profile_pic,
CASE
   WHEN host_identity_verified = 't' THEN 1 
   WHEN host_identity_verified = 'f' THEN 0
   ELSE null
  END AS host_identity_verified,
unaccent(neighbourhood_cleansed) neighbourhood,
CAST(latitude AS numeric) latitude,
CAST(longitude AS numeric) longitude,
property_type,
room_type,
CAST(accommodates AS int) accommodates,
--CAST(replace(replace(bathrooms_text, ' baths', '') ' bath', '') AS numeric) bathrooms,
CAST(bedrooms AS int) bedrooms,
CAST(beds AS int) beds,
amenities,
CAST(replace(replace(price, '$', '') , ',', '') AS numeric) AS price,
CAST(minimum_nights AS int) minimum_nights,
CAST(maximum_nights AS int) maximum_nights,
CAST(minimum_minimum_nights AS int) minimum_minimum_nights,
CAST(maximum_minimum_nights AS int) maximum_minimum_nights,
CAST(minimum_maximum_nights AS int) minimum_maximum_nights,
CAST(maximum_maximum_nights AS int) maximum_maximum_nights,
CAST(minimum_nights_avg_ntm as numeric) minimum_nights_avg_ntm,
CAST(maximum_nights_avg_ntm as numeric) maximum_nights_avg_ntm,
CASE
   WHEN has_availability = 't' THEN 1 
   WHEN has_availability = 'f' THEN 0
   ELSE null
  END AS has_availability,
CAST(availability_30 AS int) availability_30,
CAST(availability_60 AS int) availability_60,
CAST(availability_90 AS int) availability_90,
CAST(availability_365 AS int) availability_365,
CAST(calendar_last_scraped as date) calendar_last_scraped,
CAST(number_of_reviews AS int) number_of_reviews,
CAST(number_of_reviews_ltm AS int) number_of_reviews_ltm,
CAST(number_of_reviews_l30d AS int) number_of_reviews_l30d,
CAST(first_review AS date) first_review,
CAST(last_review AS date) last_review,
CAST(review_scores_rating AS numeric) review_scores_rating,
CAST(review_scores_accuracy AS numeric) review_scores_accuracy,
CAST(review_scores_cleanliness AS numeric) review_scores_cleanliness,
CAST(review_scores_checkin AS numeric) review_scores_checkin,
CAST(review_scores_communication AS numeric) review_scores_communication,
CAST(review_scores_location AS numeric) review_scores_location,
CAST(review_scores_value AS numeric) review_scores_value,
CASE
   WHEN instant_bookable = 't' THEN 1 
   WHEN instant_bookable = 'f' THEN 0
   ELSE null
  END AS instant_bookable,
CAST(calculated_host_listings_count AS numeric) calculated_host_listings_count,
CAST(calculated_host_listings_count_entire_homes AS numeric) calculated_host_listings_count_entire_homes,
CAST(calculated_host_listings_count_private_rooms AS numeric) calculated_host_listings_count_private_rooms,
CAST(calculated_host_listings_count_shared_rooms AS numeric) calculated_host_listings_count_shared_rooms,
CAST(reviews_per_month AS numeric) reviews_per_month
FROM public.bronze_listings
