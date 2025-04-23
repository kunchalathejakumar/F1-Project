with source as (
    select * from {{ source('raw_data', 'raw_driver_standings') }}
)

select * from source
