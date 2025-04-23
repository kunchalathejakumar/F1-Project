with source as (
        select * from {{ source('raw_data', 'raw_constructor_results') }}
  )
  select * from source
    