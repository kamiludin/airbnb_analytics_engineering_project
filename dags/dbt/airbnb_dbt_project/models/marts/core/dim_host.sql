WITH dim_host AS (
    SELECT 
        *
    FROM {{ ref('int_listings_joined') }}
)

SELECT
    listing_id,
    host_id,
    host_name,
    host_since,
    host_location,
    host_about,
    host_response_time,
    host_response_rate,
    host_acceptance_rate,
    host_is_superhost,
    host_listings_count,
	host_total_listings_count,
	host_verifications,
	host_identity_verified
FROM dim_host