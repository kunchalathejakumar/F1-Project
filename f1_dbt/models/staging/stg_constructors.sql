with source as (
select * 
from {{ source('raw_data', 'raw_constructors') }}
)

select * from source