{{ 
    config(
        materialized='view'
        )
}}

with driver_race_features as (
    SELECT
        fr.race_id,
        fr.driver_id,
        fr.constructor_id,
        dr.full_name AS driver_name,
        dr.nationality AS driver_nationality,
        co.constructor_name,
        r.year AS race_year,
        r.round AS race_round,
        ci.circuit_name,
        ci.country AS circuit_country,
        fr.grid,
        fr.position,
        fr.points,
        fr.fastest_lap_time,
        fr.fastest_lap_speed,
        CASE WHEN fr.is_retired THEN 1 ELSE 0 END AS retired_flag
    FROM {{ ref('fact_race_results') }} fr
    LEFT JOIN {{ ref('dim_drivers') }} dr ON fr.driver_id = dr.driver_id
    LEFT JOIN {{ ref('dim_constructors') }} co ON fr.constructor_id = co.constructor_id
    LEFT JOIN {{ ref('dim_races') }} r ON fr.race_id = r.race_id
    LEFT JOIN {{ ref('dim_circuits') }} ci ON r.circuit_id = ci.circuit_id
)

SELECT * FROM driver_race_features