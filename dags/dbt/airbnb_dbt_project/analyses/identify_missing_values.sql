WITH host AS (
    SELECT 
        *
    FROM {{ ref('stg_host') }}
),

listings AS (
    SELECT 
        *
    FROM {{ ref('stg_listings') }}
),

reviews AS (
    SELECT
        *
    FROM {{ ref('stg_reviews') }}
)

SELECT
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS missing_count_price,
    SUM(CASE WHEN review_scores_rating IS NULL THEN 1 ELSE 0 END) AS missing_count_review_scores_rating,
    SUM(CASE WHEN review_scores_accuracy IS NULL THEN 1 ELSE 0 END) AS missing_count_review_scores_accuracy,
    SUM(CASE WHEN review_scores_cleanliness IS NULL THEN 1 ELSE 0 END) AS missing_count_review_scores_cleanliness,
    SUM(CASE WHEN review_scores_checkin IS NULL THEN 1 ELSE 0 END) AS missing_count_review_scores_checkin,
    SUM(CASE WHEN review_scores_communication IS NULL THEN 1 ELSE 0 END) AS missing_count_review_scores_communication,
    SUM(CASE WHEN review_scores_location IS NULL THEN 1 ELSE 0 END) AS missing_count_review_scores_location,
    SUM(CASE WHEN review_scores_value IS NULL THEN 1 ELSE 0 END) AS missing_count_review_scores_value,
    SUM(CASE WHEN reviews_per_month IS NULL THEN 1 ELSE 0 END) AS missing_count_reviews_per_month
FROM host h
JOIN listings l ON h.listing_id = l.listing_id
JOIN reviews r ON l.listing_id = r.listing_id