with source as (
    select
        "statusId" as status_id
        ,"raceId" as race_id
        ,"driverId" as driver_id
        ,"constructorId" as constructor_id
        ,number
        ,grid
        ,"positionOrder" as position_order
        ,points
        ,laps
        ,"resultId" as result_id
        ,"fastestLapTime" as fastest_lap_time
        ,time
        ,position
        ,"positionText" as position_text
        ,milliseconds
        ,fastestlap
    from {{ source('raw_data', 'raw_sprint_results') }}
)

select
    *
from source
