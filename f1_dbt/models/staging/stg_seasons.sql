with source as (
    select * from {{ source('raw_data', 'raw_seasons') }}
)

select * from source
