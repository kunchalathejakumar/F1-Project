with source as (
    select * from {{ source('raw_data', 'raw_results') }}
)

select * from source
