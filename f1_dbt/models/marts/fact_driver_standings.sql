with driver_standings as (
    select
        ds.driver_standings_id
        ,ds.race_id
        ,ds.driver_id
        ,ds.points as cumulative_points
        ,ds.position as driver_rank
        ,ds.wins
    from {{ ref('stg_driver_standings') }} as ds
)

select
    *
from driver_standings
