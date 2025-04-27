with constructor_standings as (
    select
        cs.constructor_standings_id
        ,cs.race_id
        ,cs.constructor_id
        ,cs.points as cumulative_points
        ,cs.position as constructor_rank
        ,cs.wins
    from {{ ref('stg_constructor_standings') }} as cs
)

select
    *
from constructor_standings
