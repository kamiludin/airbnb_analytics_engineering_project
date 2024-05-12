WITH fact_reviews AS (
    SELECT
        *
    FROM {{ ref('int_listings_joined') }}
)

SELECT
    listing_id,
	number_of_reviews,
	number_of_reviews_ltm,
	number_of_reviews_l30d,
	first_review,
	last_review,
	review_scores_rating_new,
	review_scores_accuracy_new,
	review_scores_cleanliness_new,
	review_scores_checkin_new,
	review_scores_communication_new,
	review_scores_location_new,
	review_scores_value_new,
	reviews_per_month_new
FROM fact_reviews