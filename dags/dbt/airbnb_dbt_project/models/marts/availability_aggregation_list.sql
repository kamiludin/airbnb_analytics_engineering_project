SELECT
    dl.neighbourhood_cleansed,
    AVG(fl.availability_365) AS avg_availability,
    MAX(fl.availability_365) AS max_availability,
    MIN(fl.availability_365) AS min_availability,
    COUNT(*) AS total_listings
FROM
    {{ ref('dim_listings') }} dl
JOIN
    {{ ref('fact_listings') }} fl
ON
    dl.listing_id = fl.listing_id
GROUP BY
    dl.neighbourhood_cleansed
ORDER BY avg_availability DESC