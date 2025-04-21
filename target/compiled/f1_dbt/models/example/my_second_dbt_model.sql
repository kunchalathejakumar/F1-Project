-- Use the `ref` function to select from other models

select *
from "dbt_project_db"."f1_dbt_schema"."my_first_dbt_model"
where id = 1