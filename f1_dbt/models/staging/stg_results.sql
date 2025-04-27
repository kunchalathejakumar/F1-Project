with source as (
    select 
        "statusId" as status_id
        ,"raceId" as race_id
        ,"driverId" as driver_id
        ,"constructorId" as constructor_id
        ,grid
        ,"positionOrder" as position_order
        ,points
        ,laps
        ,"resultId" as result_id
        ,"fastestLapTime" as fastest_lap_time
        ,"fastestLapSpeed" as fastest_lap_speed
        ,time
        ,milliseconds
        ,number
        ,"fastestLap" as fastest_lap
        ,position
        ,"positionText" as position_text
        ,rank
    from {{ source('raw_data', 'raw_results') }}
)

select
    *
from source
