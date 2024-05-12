SELECT
    dl.room_type,
    AVG(fr.review_scores_rating_new) AS avg_rating,
    COUNT(*) AS total_reviews
FROM
    {{ ref('dim_listings') }} dl
JOIN
    {{ ref('fact_reviews') }} fr
ON
    dl.listing_id = fr.listing_id
WHERE
    fr.number_of_reviews > 0
GROUP BY
    dl.room_type
ORDER BY
    avg_rating DESC