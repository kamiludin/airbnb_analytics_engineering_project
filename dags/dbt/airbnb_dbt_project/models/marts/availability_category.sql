WITH availability_ranges AS (
    SELECT
        listing_id,
        availability_365,
        CASE
            WHEN availability_365 > 300 THEN 'Peak'
            WHEN availability_365 < 100 THEN 'Off-Peak'
            ELSE 'Moderate'
        END AS availability_category
    FROM
        {{ ref('fact_listings') }}
)
SELECT
    availability_category,
    COUNT(*) AS total_listings,
    AVG(availability_365) AS avg_days_available
FROM
    availability_ranges
GROUP BY
    availability_category
