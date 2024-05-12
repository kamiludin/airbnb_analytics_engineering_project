SELECT
    dl.room_type,
    AVG(fl.price_new) AS avg_price
FROM
    {{ ref('dim_listings') }} dl
JOIN
    {{ ref('fact_listings') }} fl
ON
    dl.listing_id = fl.listing_id
GROUP BY
    dl.room_type
ORDER BY
    avg_price DESC