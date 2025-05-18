with status as (
    select
        status_id
        ,status
    from {{ ref('stg_status') }}
)

select
    *
from status
