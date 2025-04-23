with source as (
        select * from {{ source('raw_data', 'raw_drivers') }}
  )
  select * from source