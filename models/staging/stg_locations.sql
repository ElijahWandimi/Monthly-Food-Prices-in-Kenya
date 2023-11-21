
select * 
from {{ source('snow_source', 'food_prices') }} 
limit 1