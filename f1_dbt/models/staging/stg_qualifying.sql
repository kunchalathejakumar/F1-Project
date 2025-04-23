with source as (
    select * from {{ source('raw_data', 'raw_qualifying') }}
)

select * from source
