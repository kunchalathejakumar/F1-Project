with pit_stops as (
    select
        pit.race_id
        ,pit.driver_id
        ,pit.stop as pit_stop
        ,pit.lap as pit_lap
        ,pit.time as pit_time
        ,pit.duration as pit_duration
    from {{ ref('stg_pit_stops') }} as pit
)

select
    *
from pit_stops
