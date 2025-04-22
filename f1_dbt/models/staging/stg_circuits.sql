with source as (
    select *
    from {{ source('raw_data', 'raw_circuits') }}
)
select *
from source
