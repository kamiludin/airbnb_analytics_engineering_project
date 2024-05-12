WITH host AS (
    SELECT 
        *
    FROM {{ ref('stg_host') }}
),

listings AS (
    SELECT 
        *,
        COALESCE(price, AVG(price) OVER ()) AS price_new
    FROM {{ ref('stg_listings') }}
),

reviews AS (
    SELECT
        *,
        COALESCE(review_scores_rating, AVG(review_scores_rating) OVER ()) AS review_scores_rating_new,
        COALESCE(review_scores_accuracy, AVG(review_scores_accuracy) OVER ()) AS review_scores_accuracy_new,
        COALESCE(review_scores_cleanliness, AVG(review_scores_cleanliness) OVER ()) AS review_scores_cleanliness_new,
        COALESCE(review_scores_checkin, AVG(review_scores_checkin) OVER ()) AS review_scores_checkin_new,
        COALESCE(review_scores_communication, AVG(review_scores_communication) OVER ()) AS review_scores_communication_new,
        COALESCE(review_scores_location, AVG(review_scores_location) OVER ()) AS review_scores_location_new,
        COALESCE(review_scores_value, AVG(review_scores_value) OVER ()) AS review_scores_value_new,
        COALESCE(reviews_per_month, AVG(reviews_per_month) OVER ()) AS reviews_per_month_new
    FROM {{ ref('stg_reviews') }}
)

SELECT
    h.listing_id,
    h.host_id,
    h.host_name,
    h.host_since,
    h.host_location,
    h.host_about,
    h.host_response_time,
    h.host_response_rate,
    h.host_acceptance_rate,
    h.host_is_superhost,
    h.host_listings_count,
    h.host_total_listings_count,
    h.host_verifications,
    h.host_identity_verified,
    l.listing_name,
    l.description,
    l.neighbourhood_cleansed,
    l.latitude,
    l.longitude,
    l.property_type,
    l.room_type,
    l.bathrooms_text,
    l.amenities,
    l.has_availability,
    l.instant_bookable,
    l.accommodates,
    l.bathrooms,
    l.bedrooms,
    l.beds,
    l.price_new,
    l.minimum_nights,
    l.maximum_nights,
    l.minimum_minimum_nights,
    l.maximum_minimum_nights,
    l.minimum_maximum_nights,
    l.maximum_maximum_nights,
    l.minimum_nights_avg_ntm,
    l.maximum_nights_avg_ntm,
    l.availability_30,
    l.availability_60,
    l.availability_90,
    l.availability_365,
    l.calculated_host_listings_count,
    l.calculated_host_listings_count_entire_homes,
    l.calculated_host_listings_count_private_rooms,
    l.calculated_host_listings_count_shared_rooms,
    r.number_of_reviews,
    r.number_of_reviews_ltm,
    r.number_of_reviews_l30d,
    r.first_review,
    r.last_review,
    r.review_scores_rating_new,
    r.review_scores_accuracy_new,
    r.review_scores_cleanliness_new,
    r.review_scores_checkin_new,
    r.review_scores_communication_new,
    r.review_scores_location_new,
    r.review_scores_value_new,
    r.reviews_per_month_new
FROM host h
JOIN listings l ON h.listing_id = l.listing_id
JOIN reviews r ON l.listing_id = r.listing_id