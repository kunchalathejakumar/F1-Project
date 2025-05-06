from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
# from airflow.timetables.interval import CronDataIntervalTimetable
from datetime import datetime, timedelta
import subprocess

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

def run_extract_script():
    subprocess.run(["python3", "/opt/airflow/data_extraction_scripts/data_extraction.py"], check=True)

def run_load_script():
    subprocess.run(["python3", "/opt/airflow/data_extraction_scripts/data_load_postgres.py"], check=True)

with DAG(
    dag_id='f1_data_pipeline',
    default_args=default_args,
    description='DAG to extract F1 data from Kaggle, load into PostgreSQL, and run DBT models',
    schedule='@daily',
    # schedule_interval='@daily',
    # timetable=CronDataIntervalTimetable("0 0 * * *", timezone="UTC"),
    start_date=datetime(2025, 5, 1),
    catchup=False,
    tags=['f1', 'dbt', 'etl'],
) as dag:

    extract_kaggle_data = PythonOperator(
        task_id='extract_kaggle_data',
        python_callable=run_extract_script,
    )

    load_to_postgres = PythonOperator(
        task_id='load_to_postgres',
        python_callable=run_load_script,
    )

    run_dbt_models = BashOperator(
        task_id='run_dbt_models',
        bash_command='cd /opt/airflow/dbt && dbt build',
    )

    extract_kaggle_data >> load_to_postgres >> run_dbt_models
