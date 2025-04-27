with race_results as (
    select
        res.race_id
        ,res.driver_id
        ,res.constructor_id
        ,res.grid
        ,res.position
        ,res.position_text
        ,res.points
        ,res.laps
        ,res.time as finish_time
        ,res.milliseconds as finish_time_ms
        ,res.fastest_lap
        ,res.rank as fastest_lap_rank
        ,res.fastest_lap_time
        ,res.fastest_lap_speed
        ,res.status_id
        ,coalesce(sta.status != 'Finished', false) as is_retired
    from {{ ref('stg_results') }} as res
        left join {{ ref('stg_status') }} as sta
        on res.status_id = sta.status_id

)

select
    *
from race_results
