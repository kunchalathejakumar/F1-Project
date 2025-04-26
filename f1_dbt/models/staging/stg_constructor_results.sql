with source as (
    select
        "constructorResultsId" as constructor_results_id
        ,"raceId" as race_id
        ,"constructorId" as constructor_id
        ,points
        ,status as constructor_status
    from {{ source('raw_data', 'raw_constructor_results') }}
)

select
    *
from source
