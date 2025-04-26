with source as (
    select
        "raceId" as race_id
        ,"driverId" as driver_id
        ,stop
        ,lap
        ,milliseconds
        ,duration
        ,time
    from {{ source('raw_data', 'raw_pit_stops') }}
)

select
    *
from source
