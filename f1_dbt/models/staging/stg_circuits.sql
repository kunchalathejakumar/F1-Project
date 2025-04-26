with source as (
    select
        "circuitId" as circuit_id
        ,"circuitRef" as circuit_ref
        ,name
        ,location
        ,country
        ,lat
        ,lng
        ,alt
        ,url
    from {{ source("raw_data", "raw_circuits") }}
)

select
    *
from source
