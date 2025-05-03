# FROM ${AIRFLOW_IMAGE_NAME:-apache/airflow:3.0.0
FROM apache/airflow:3.0.0

USER airflow
RUN  pip install --upgrade pip \
    && pip install dbt-postgres \
    && pip install apache-airflow-providers-postgres \
    && pip install apache-airflow-providers-common-sql \
    && pip install gitpython \
    && pip install protobuf==5.29.1

USER root
RUN sudo apt-get update
RUN sudo apt-get install -y git

USER airflow
RUN airflow db migrate
#RUN airflow db init
#RUN airflow db upgrade