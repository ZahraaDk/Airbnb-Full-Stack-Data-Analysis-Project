CREATE TABLE IF NOT EXISTS dw_reporting.fct_booking 
(
    review_id BIGINT,
    listing_id TEXT,
    last_updated TIMESTAMP, 
    host_id BIGINT, 
    neighbourhood_view TEXT, 
    price NUMERIC, 
    number_of_reviews TEXT, 
    review_scores_rating NUMERIC,
    PRIMARY KEY (listing_id, review_id)
);

CREATE INDEX IF NOT EXISTS "idx_fct_listing" ON dw_reporting.fct_booking(listing_id);

INSERT INTO dw_reporting.fct_booking
SELECT DISTINCT
    src_reviews.review_id, 
    src_listing.listing_id, 
    src_listing.last_updated,
    src_listing.host_id, 
    src_listing.neighbourhood_view, 
    src_listing.price, 
    src_listing.number_of_reviews, 
    src_listing.review_scores_rating 
FROM dw_reporting.stg_cleaned_df1 as src_listing
INNER JOIN dw_reporting.stg_cleaned_df2 as src_reviews
    ON src_listing.listing_id = src_reviews.listing_id

ON CONFLICT (listing_id, review_id) DO UPDATE
SET 
    last_updated = EXCLUDED.last_updated, 
    host_id = EXCLUDED.host_id, 
    neighbourhood_view = EXCLUDED.neighbourhood_view, 
    price = EXCLUDED.price, 
    number_of_reviews = EXCLUDED.number_of_reviews, 
    review_scores_rating = EXCLUDED.review_scores_rating;
