with qualifying_results as (
    select
        qual.race_id
        ,qual.driver_id
        ,qual.constructor_id
        ,qual.position as qualifying_position
        ,qual.q1
        ,qual.q2
        ,qual.q3
    from {{ ref('stg_qualifying') }} as qual
)

select
    *
from qualifying_results
