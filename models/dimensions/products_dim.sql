with products_dim as (
    select  p.product,
            COALESCE(p.price_type,'Retail') as price_type,
            COALESCE(p.product_source,'LOCAL') as product_source,
            p.unit,
            p.unit_type,
            p.value,
            l.location_id
    from {{ source("snow_source", "food_prices") }} p
    join {{ ref('stg_locations') }} l
    on p.country = l.country
)

select *
from products_dim