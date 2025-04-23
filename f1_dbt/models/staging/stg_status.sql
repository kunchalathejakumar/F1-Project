with source as (
    select * from {{ source('raw_data', 'raw_status') }}
)

select * from source
