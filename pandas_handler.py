from database_handler import read_data_as_dataframe
import pandas as pd
from lookups import Sources, InputTypes

def dataframes_cleansed():
    cleaned_dataframes = {}
    # df = read_data_as_dataframe(InputTypes.CSV, Sources.listings_source.value)
    df = read_data_as_dataframe(InputTypes.CSV, 'csv_files\listings.csv')
    df = df.drop(columns= ['scrape_id', 'source', 'host_acceptance_rate','host_is_superhost', 'host_thumbnail_url', 'host_picture_url' ,
                    'host_listings_count', 'host_has_profile_pic', 'neighbourhood_group_cleansed', 'bathrooms', 'calendar_updated',
                    'number_of_reviews_ltm', 'number_of_reviews_l30d', 'calendar_last_scraped', 'review_scores_accuracy', 
                    'review_scores_cleanliness', 'review_scores_checkin', 'review_scores_communication', 'review_scores_location', 
                    'review_scores_value', 'host_about', 'neighborhood_overview',
                    'minimum_minimum_nights', 'maximum_minimum_nights', 'minimum_maximum_nights', 'maximum_maximum_nights', 
                    'minimum_nights_avg_ntm', 'maximum_nights_avg_ntm', 'license', 'host_verifications', 'property_type', 
                    'availability_60', 'availability_90' ,'calculated_host_listings_count', 
                    'calculated_host_listings_count_entire_homes', 'calculated_host_listings_count_private_rooms', 
                    'calculated_host_listings_count_shared_rooms'])
    df.rename(columns={'last_scraped':'last_updated', 'id':'listing_id', 'neighbourhood_cleansed': 'neighbourhood_view', 'room_type': 'property_type', 'bathrooms_text':'bathrooms'}, inplace=True)
    df['name'] = df['name'].str.split('·').str.get(0).str.strip()
    df['description'] = df['description'].str.replace('<br />', '').str.replace('<b>', '').replace('</b>', '')
    df[['description','host_name', 'host_since', 'host_total_listings_count', 'host_identity_verified', 'host_location',
        'host_response_time', 'host_response_rate', 'host_neighbourhood']] =  df[['description', 'host_name', 
        'host_since', 'host_total_listings_count', 'host_identity_verified', 'host_location', 'host_response_time', 
        'host_response_rate', 'host_neighbourhood']].fillna("unspecified")
    neighbourhood_mapping = {
     'San Diego , California, United States' : 'San Diego, California, United States', 
     'San diego, California, United States' : 'San Diego, California, United States', 
     'San Diego, Ca, United States' : 'San Diego, California, United States', 
     'San Diego County, California, United States' : 'San Diego, California, United States', 
     'San Diego, United States' : 'San Diego, California, United States', 
     'San Diego , Ca, United States' : 'San Diego, California, United States', 
     ' San Diego, California, United States' : 'San Diego, California, United States', 
     'SAN DIEGO, California, United States' : 'San Diego, California, United States',
     'La Jolla, California, United States' : 'La Jolla, San diego, United States', 
     'LA JOLLA, California, United States' : 'La Jolla, San diego, United States', 
     'La Jolla , California, United States' :  'La Jolla, San diego, United States', 
     'Mission Bay, California, United States' :  'Mission Beach, California, United States',
     'La Jolla Cove, California, United States' : 'La Jolla, San diego, United States', 
     'LA JOLLA, CALIFORNIA, United States' : 'La Jolla, San diego, United States',
     ' La Jolla, California, United States': 'La Jolla, San diego, United States', 
     'CA, United States' : 'California, United States', 
     'California, South Dakota, United States' : 'California, United States'
    }
    df['neighbourhood'] = df['neighbourhood'].map(neighbourhood_mapping).fillna(df['neighbourhood'])
    df['neighbourhood'] = df['neighbourhood'].fillna('San Diego, California, United States')
    mean_rating = df['review_scores_rating'].mean()
    df['review_scores_rating'].fillna(mean_rating, inplace=True)
    df['reviews_per_month'] = df['reviews_per_month'].fillna(0)
    df['first_review'] = df['first_review'].fillna(0).apply(pd.to_datetime)
    df['last_review'] = df['last_review'].fillna(0).apply(pd.to_datetime)
    df[['bathrooms', 'bedrooms', 'beds']] = df[['bathrooms', 'bedrooms', 'beds']].fillna(0)
    # only for testing
    # df = df.drop(columns=['listing_id'])
    df['listing_id'] = df['listing_id'].astype('object')
    # df_2 = read_data_as_dataframe(InputTypes.CSV, Sources.reviews_source.value)
    df_2 = read_data_as_dataframe(InputTypes.CSV,'csv_files\\reviews.csv')
    df_2.rename(columns={'date':'last_updated'}, inplace=True)
    df_2['comments'] = df_2['comments'].fillna('unspecified')
    df_2['listing_id'] = df_2['listing_id'].astype('object')
    df_2['last_updated'] = df_2['last_updated'].apply(pd.to_datetime)
    # df_3 = read_data_as_dataframe(InputTypes.CSV, Sources.calender_source.value)

    cleaned_dataframes = {
        'cleaned_df1' : df,
        'cleaned_df2' : df_2
        # 'cleaned_df3' : df_3
    }    

    return cleaned_dataframes