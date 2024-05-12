with listings AS (
    SELECT * FROM {{ source('airbnb', 'listings') }}
)
SELECT
    id AS listing_id,
    listing_url,
    scrape_id,
    last_scraped,
    source,
    name AS listing_name,
    description,
    neighborhood_overview,
    picture_url,
    neighbourhood,
    neighbourhood_cleansed,
    neighbourhood_group_cleansed,
    latitude,
    longitude,
    property_type,
    room_type,
    accommodates,
    bathrooms,
    bathrooms_text,
    bedrooms,
    beds,
    amenities,
    CAST(
        REPLACE(
            REPLACE(price, '$', ''), 
            ',', ''
        ) AS FLOAT
    ) AS price,
    minimum_nights,
	maximum_nights,
	minimum_minimum_nights,
	maximum_minimum_nights,
	minimum_maximum_nights,
	maximum_maximum_nights,
	minimum_nights_avg_ntm,
	maximum_nights_avg_ntm,
	calendar_updated,
	has_availability,
	availability_30,
	availability_60,
	availability_90,
	availability_365,
	calendar_last_scraped,
	license,
	instant_bookable,
	calculated_host_listings_count,
	calculated_host_listings_count_entire_homes,
	calculated_host_listings_count_private_rooms,
	calculated_host_listings_count_shared_rooms
FROM
    listings