with source as (
    select * from {{ source('raw_data', 'raw_sprint_results') }}
)

select * from source
