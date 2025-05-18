with lap_times as (
    select
        lap.race_id
        ,lap.driver_id
        ,lap.lap as lap_number
        ,lap.position as position_in_lap
        ,lap.time as lap_time
        ,lap.milliseconds as lap_time_ms
    from {{ ref('stg_lap_times') }} as lap
)

select
    *
from lap_times
