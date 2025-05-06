import os
import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv

# Load environment variables from.env file
load_dotenv()

# Configs
db_host = os.environ.get('POSTGRES_HOST', 'postgres')
db_name = os.environ.get('POSTGRES_DB')
db_user = os.environ.get('POSTGRES_USER')
db_password = os.environ.get('POSTGRES_PASSWORD')
db_port = int(os.environ.get('POSTGRES_PORT', 5432))
db_schema = os.environ.get('RAW_SCHEMA')

# DATA_DIR = "D://MyFiles//VsCode//F1_project//dataset//raw_files"
DATA_DIR = '/opt/airflow/data/raw_files'

engine = create_engine(f"postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}")

def load_csv_to_postgres(file_path, table_name):
    df = pd.read_csv(file_path)
    print(f"Loading {file_path} → {db_schema}.{table_name}...")
    df.to_sql(table_name, engine, schema=db_schema, if_exists="replace", index=False)
    print(f"✅ Loaded {len(df)} rows into {db_schema}.{table_name}")

def main():
    for filename in os.listdir(DATA_DIR):
        if filename.endswith(".csv"):
            table_name = "raw_" +filename.replace(".csv", "")
            file_path = os.path.join(DATA_DIR, filename)
            load_csv_to_postgres(file_path, table_name)

if __name__ == "__main__":
    main()