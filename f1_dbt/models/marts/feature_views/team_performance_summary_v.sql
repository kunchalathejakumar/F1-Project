{{
    config(
        materialized = 'table',
        unique_key = ['constructor_name', 'year']
    )
}}
with team_performance_summary as (
    SELECT
        co.constructor_name,
        r.year,
        COUNT(CASE WHEN fr.position = 1 THEN 1 END) AS wins,
        COUNT(CASE WHEN fr.position <= 3 THEN 1 END) AS podiums,
        SUM(fr.points) AS total_points,
        COUNT(fr.race_id) AS races_entered
    FROM {{ ref('fact_race_results') }} fr
    LEFT JOIN {{ ref('dim_constructors') }} co ON fr.constructor_id = co.constructor_id
    LEFT JOIN {{ ref('dim_races') }} r ON fr.race_id = r.race_id
    GROUP BY 1, 2
    ORDER BY co.constructor_name, r.year
)

SELECT * FROM team_performance_summary