with source as (
    select * from {{ source('raw_data', 'raw_lap_times') }}
)

select * from source
