with races as (
    select
        race_id
        ,year
        ,round
        ,circuit_id
        ,name as race_name
        ,date
        ,time
    from {{ ref('stg_races') }}
)

select
    *
from races
