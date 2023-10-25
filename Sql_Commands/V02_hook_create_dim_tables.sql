-- listing dimension table
CREATE TABLE IF NOT EXISTS target_schema.dim_listing
(
    listing_id TEXT PRIMARY KEY, 
    listing_name TEXT,
    listing_date TIMESTAMP,
    listing_description TEXT,
    listing_url VARCHAR,
    picture_url VARCHAR
);
CREATE INDEX IF NOT EXISTS "idx_listing_id" ON target_schema.dim_listing(listing_id);
INSERT INTO target_schema.dim_listing
SELECT DISTINCT
    src_listing.listing_id, 
    src_listing.listing_name,
    src_listing.listing_date, 
    src_listing.listing_description, 
    src_listing.listing_url, 
    src_listing.picture_url
FROM target_schema.stg_cleaned_df1 as src_listing
ON CONFLICT(listing_id)
DO UPDATE SET 
    listing_name = EXCLUDED.listing_name, 
    listing_date = EXCLUDED.listing_date,
    listing_description = EXCLUDED.listing_description, 
    listing_url = EXCLUDED.listing_url, 
    picture_url = EXCLUDED.picture_url;

-- host dimension table
CREATE TABLE IF NOT EXISTS target_schema.dim_host
(
    host_id INTEGER PRIMARY KEY, 
    host_name TEXT, 
    host_url VARCHAR, 
    host_since TIMESTAMP, 
    host_location TEXT, 
    host_response_time TEXT, 
    host_response_rate TEXT, 
    host_neighbourhood TEXT, 
    host_identity_verified TEXT
);
CREATE INDEX IF NOT EXISTS "idx_host_id" ON target_schema.dim_host(host_id);
INSERT INTO target_schema.dim_host
SELECT DISTINCT
    src_listing.host_id, 
    src_listing.host_name, 
    src_listing.host_url, 
    src_listing.host_since, 
    src_listing.host_location, 
    src_listing.host_response_time, 
    src_listing.host_response_rate, 
    src_listing.host_neighbourhood, 
    src_listing.host_identity_verified
FROM target_schema.stg_cleaned_df1 as src_listing
ON CONFLICT(host_id)
DO UPDATE SET 
    host_name = EXCLUDED.host_name, 
    host_url = EXCLUDED.host_url,
    host_since = EXCLUDED.host_since, 
    host_location = EXCLUDED.host_location, 
    host_response_time = EXCLUDED.host_response_time, 
    host_response_rate = EXCLUDED.host_response_rate, 
    host_neighbourhood = EXCLUDED.host_neighbourhood, 
    host_identity_verified = EXCLUDED.host_identity_verified;

-- property dimension table
CREATE TABLE IF NOT EXISTS target_schema.dim_property
(
    listing_id TEXT PRIMARY KEY, 
    property_type TEXT, 
    accommodates INTEGER, 
    bathrooms VARCHAR, 
    bedrooms INTEGER, 
    beds INTEGER, 
    amenities TEXT, 
    minimum_nights INTEGER, 
    maximum_nights INTEGER, 
    has_availability TEXT
);
CREATE INDEX IF NOT EXISTS "idx_listing_id2" ON target_schema.dim_property(listing_id);
INSERT INTO target_schema.dim_property
SELECT DISTINCT
    src_listing.listing_id, 
    src_listing.property_type, 
    src_listing.accommodates, 
    src_listing.bathrooms,
    src_listing.bedrooms, 
    src_listing.beds, 
    src_listing.amenities, 
    src_listing.minimum_nights, 
    src_listing.maximum_nights, 
    src_listing.has_availability
FROM target_schema.stg_cleaned_df1 AS src_listing
ON CONFLICT(listing_id)
DO UPDATE SET  
    property_type = EXCLUDED.property_type, 
    accommodates = EXCLUDED.accommodates, 
    bathrooms = EXCLUDED.bathrooms, 
    bedrooms = EXCLUDED.bedrooms, 
    beds = EXCLUDED.beds, 
    amenities = EXCLUDED.amenities, 
    minimum_nights = EXCLUDED.minimum_nights, 
    maximum_nights = EXCLUDED.maximum_nights, 
    has_availability = EXCLUDED.has_availability;

-- reviews dimension table
CREATE TABLE IF NOT EXISTS target_schema.dim_reviews
(
    review_id bigint PRIMARY KEY, 
    booking_date TIMESTAMP, 
    reviewer_id INTEGER, 
    reviewer_name TEXT, 
    comments TEXT, 
    sentiment_score NUMERIC
);
CREATE INDEX IF NOT EXISTS "idx_review_id" ON target_schema.dim_reviews(review_id);
INSERT INTO target_schema.dim_reviews
SELECT DISTINCT
    src_reviews.review_id, 
    src_reviews.booking_date, 
    src_reviews.reviewer_id, 
    src_reviews.reviewer_name, 
    src_reviews.comments, 
    src_reviews.sentiment_score
FROM target_schema.stg_cleaned_df2 AS src_reviews
ON CONFLICT(review_id)
DO UPDATE SET
    booking_date = EXCLUDED.booking_date, 
    reviewer_id = EXCLUDED.reviewer_id, 
    reviewer_name = EXCLUDED.reviewer_name, 
    comments = EXCLUDED.comments,
    sentiment_score = EXCLUDED.sentiment_score;