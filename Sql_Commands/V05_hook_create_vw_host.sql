CREATE OR REPLACE VIEW dw_reporting.view_host AS 
SELECT DISTINCT
	fct_booking.listing_id,
	dim_host.host_name, 
	dim_host.host_id, 
	dim_host.host_since,
	dim_host.host_location, 
	dim_host.host_is_superhost,
	dim_host.host_total_listings_count,
	dim_host.host_response_time, 
	dim_host.host_response_rate,
	fct_booking.number_of_reviews,
	fct_booking.price,
	fct_booking.review_scores_rating
FROM dw_reporting.dim_host 
INNER JOIN dw_reporting.fct_booking
	ON fct_booking.host_id = dim_host.host_id
ORDER BY fct_booking.listing_id;