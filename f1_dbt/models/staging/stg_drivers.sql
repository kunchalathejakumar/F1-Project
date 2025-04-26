with source as (
    select 
        "driverId"
        ,"driverRef"
        ,number
        ,code
        ,forename
        ,surname
        ,dob
        ,nationality
        ,url
    from {{ source('raw_data', 'raw_drivers') }}
)

select
    *
from source
