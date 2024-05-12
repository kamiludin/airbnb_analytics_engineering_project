WITH dim_listings AS (
    SELECT 
        listing_id,
        listing_name,
        description,
        neighbourhood_cleansed,
        latitude,
        longitude,
        property_type,
        room_type,
        bathrooms_text,
        amenities,
        has_availability,
        instant_bookable
    FROM {{ ref('int_listings_joined') }}
)

SELECT 
    listing_id,
    listing_name,
    description,
    neighbourhood_cleansed,
    latitude,
    longitude,
    property_type,
    room_type,
    bathrooms_text,
    amenities,
    has_availability,
    instant_bookable
FROM dim_listings