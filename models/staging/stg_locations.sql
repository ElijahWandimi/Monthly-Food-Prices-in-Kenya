with locations_data as (
    select  distinct(country),
            longitude,
            latitude,
            row_number() over(order by country, latitude, longitude) as location_id
    from {{ source('snow_source', 'food_prices') }} 
    group by country, longitude, latitude
)

select *
from locations_data