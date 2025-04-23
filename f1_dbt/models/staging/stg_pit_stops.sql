with source as (
    select * from {{ source('raw_data', 'raw_pit_stops') }}
)

select * from source
