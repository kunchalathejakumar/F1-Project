with driver as (
    select
        driver_id
        ,driver_ref
        ,number
        ,code
        ,first_name
        ,last_name
        ,dob as date_of_birth
        ,nationality
    from {{ ref('stg_drivers') }}
)

select
    *
from driver
