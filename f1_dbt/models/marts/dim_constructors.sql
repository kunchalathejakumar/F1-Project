with constructor as (
    select
        constructor_id
        ,constructor_ref
        ,name as constructor_name
        ,nationality
    from {{ ref('stg_constructors') }}
)

select
    *
from constructor
