with source as (
    select
        "constructorStandingsId" as constructor_standings_id
        ,"raceId" as race_id
        ,"constructorId" as constructor_id
        ,points
        ,position
        ,wins
        ,"positionText" as position_text
    from {{ source('raw_data', 'raw_constructor_standings') }}
)

select
    *
from source
