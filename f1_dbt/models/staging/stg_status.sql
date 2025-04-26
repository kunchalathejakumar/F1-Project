with source as (
    select
        "statusId" as status_id
        ,status
    from {{ source('raw_data', 'raw_status') }}
)

select
    *
from source
