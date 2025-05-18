with circuit as (
    select
        circuit_id
        ,circuit_ref
        ,name as circuit_name
        ,location
        ,country
        ,lat as latitude
        ,lng as longitude
        ,alt as altitude
    from {{ ref('stg_circuits') }}
)

select
    *
from circuit
