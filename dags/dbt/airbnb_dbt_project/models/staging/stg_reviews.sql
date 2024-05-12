with reviews AS (
    SELECT * FROM {{ source('airbnb', 'reviews') }}
)
SELECT
    id AS listing_id,
	number_of_reviews,
	number_of_reviews_ltm,
	number_of_reviews_l30d,
	first_review,
	last_review,
	review_scores_rating,
	review_scores_accuracy,
	review_scores_cleanliness,
	review_scores_checkin,
	review_scores_communication,
	review_scores_location,
	review_scores_value,
	reviews_per_month
FROM
    reviews