with source as (
    select
        year
        ,url
    from {{ source('raw_data', 'raw_seasons') }}
)

select
    *
from source
