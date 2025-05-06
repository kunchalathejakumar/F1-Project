FROM apache/airflow:3.0.0

USER airflow
RUN pip install --upgrade pip && \
    pip install \
        dbt-core==1.9.0 \
        dbt-postgres==1.9.0 \
        apache-airflow-providers-postgres \
        apache-airflow-providers-common-sql \
        gitpython \
        protobuf==5.29.1 \
        kaggle

# Switch to root to install system packages
USER root
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER airflow

# Initialize or migrate the Airflow DB
RUN airflow db migrate
# Alternative if it's a fresh DB setup:
# RUN airflow db init
