with source as (
    select 
        "driverId" as driver_id
        ,"driverRef" as driver_ref
        ,number
        ,code
        ,forename as first_name
        ,surname as last_name
        ,dob
        ,nationality
        ,url
    from {{ source('raw_data', 'raw_drivers') }}
)

select
    *
from source
