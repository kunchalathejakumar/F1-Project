with source as (
    select
        "raceId" as race_id
        ,"driverId" as driver_id
        ,lap
        ,position
        ,milliseconds
        ,time
    from {{ source('raw_data', 'raw_lap_times') }}
)

select
    *
from source
