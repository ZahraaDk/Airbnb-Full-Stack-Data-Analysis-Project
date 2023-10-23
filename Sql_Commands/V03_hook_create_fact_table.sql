CREATE TABLE IF NOT EXISTS target_schema.fct_booking 
(
    review_id BIGINT PRIMARY KEY,
    listing_id TEXT,
    last_updated TIMESTAMP, 
    reviewer_id INTEGER,
    host_id BIGINT, 
    neighbourhood_view TEXT, 
    price NUMERIC, 
    number_of_reviews TEXT, 
    review_scores_rating NUMERIC,
    sentiment_score NUMERIC
);

CREATE INDEX IF NOT EXISTS "idx_fct_listing" ON target_schema.fct_booking(listing_id);

INSERT INTO target_schema.fct_booking
SELECT DISTINCT
    src_reviews.review_id, 
    src_listing.listing_id, 
    src_reviews.last_updated,
    src_reviews.reviewer_id,
    src_listing.host_id, 
    src_listing.neighbourhood_view, 
    src_listing.price, 
    src_listing.number_of_reviews, 
    src_listing.review_scores_rating,
    src_reviews.sentiment_score
FROM target_schema.stg_cleaned_df1 as src_listing
INNER JOIN target_schema.stg_cleaned_df2 as src_reviews
    ON src_listing.listing_id = src_reviews.listing_id

ON CONFLICT (review_id) DO UPDATE
SET 
    listing_id = EXCLUDED.listing_id,
    last_updated = EXCLUDED.last_updated, 
    reviewer_id = EXCLUDED.reviewer_id,
    host_id = EXCLUDED.host_id, 
    neighbourhood_view = EXCLUDED.neighbourhood_view, 
    price = EXCLUDED.price, 
    number_of_reviews = EXCLUDED.number_of_reviews, 
    review_scores_rating = EXCLUDED.review_scores_rating, 
    sentiment_score = EXCLUDED.sentiment_score;
