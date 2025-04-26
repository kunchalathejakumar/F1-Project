with source as (
    select
        "raceId" as race_id
        ,year
        ,round
        ,"circuitId" as circuit_id
        ,name
        ,date
        ,time
        ,url
        ,fp1_date
        ,fp1_time
        ,fp2_date
        ,fp2_time
        ,fp3_date
        ,fp3_time
        ,quali_date
        ,quali_time
        ,sprint_date
        ,sprint_time
    from {{ source('raw_data', 'raw_races') }}
)

select
    *
from source
