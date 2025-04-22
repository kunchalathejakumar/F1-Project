from kaggle.api.kaggle_api_extended import KaggleApi
import os

# Define the dataset owner and name
dataset_name = 'rohanrao/formula-1-world-championship-1950-2020'
download_dir = 'D:\\MyFiles\\VsCode\\F1_project\\dataset\\raw_files'

try:
    # Create the download directory if it doesn't exist
    os.makedirs(download_dir, exist_ok=True)

    # Initialize the Kaggle API client
    kaggle_api = KaggleApi()
    kaggle_api.authenticate()

    # Download the dataset files
    kaggle_api.dataset_download_files(dataset_name, path=download_dir, unzip=True)

    print(f"Dataset '{dataset_name}' downloaded successfully to '{download_dir}'.")

except Exception as e:
    print(f"An error occurred during dataset download: {e}")