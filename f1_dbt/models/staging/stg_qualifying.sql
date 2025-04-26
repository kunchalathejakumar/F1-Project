with source as (
    select
        "qualifyId" as qualify_id
        ,"raceId" as race_id
        ,"driverId" as driver_id
        ,"constructorId" as constructor_id
        ,number
        ,position
        ,q1
        ,q2
        ,q3
    from {{ source('raw_data', 'raw_qualifying') }}
)

select
    *
from source
