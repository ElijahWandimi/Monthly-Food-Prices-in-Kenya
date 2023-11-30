with market_date as (
    select  period_date,
            market,
            row_number() over(order by period_date, market) as market_date_id
    from {{ source("snow_source", "food_prices") }}
    group by period_date, market
)

select *
from market_date