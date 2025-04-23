with source as (
    select * from {{ source('raw_data', 'raw_races') }}
)

select * from source
