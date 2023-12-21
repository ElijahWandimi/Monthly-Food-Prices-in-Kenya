with final_table as (
    select  product,
            period_date,
            COALESCE(price_type,'Retail') as price_type,
            COALESCE(product_source,'LOCAL') as product_source,
            unit,
            unit_type,
            value
    from {{ source("snow_source", "food_prices") }}
    where period_date is not null and  product is not null
)

select *
from final_table