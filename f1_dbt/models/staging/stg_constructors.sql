with source as (
    select
        "constructorId" as constructor_id
        ,"constructorRef" as constructor_ref
        ,name
        ,nationality
        ,url
    from {{ source('raw_data', 'raw_constructors') }}

)

select
    *
from source
