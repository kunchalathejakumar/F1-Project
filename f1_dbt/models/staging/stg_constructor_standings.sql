with source as (
    select * from {{ source('raw_data', 'raw_constructor_standings') }}
)

select * from source
