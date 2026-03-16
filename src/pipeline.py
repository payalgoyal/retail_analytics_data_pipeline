from ingestion import load_data
from cleaning import clean_data
from feature_engineering import create_dimensions
from load_to_mysql import load_tables_to_mysql


def run_pipeline():

    print("===== RETAIL INTELLIGENCE PIPELINE STARTED =====")

    # Step 1 — Ingestion
    file_path = r"D:\Analyst\DigitalProduct\Automated_Retail_Intelligence\data\raw\online_retail.csv"
    df = load_data(file_path)

    # Step 2 — Cleaning
    df_clean = clean_data(df)

    # Step 3 — Modeling (Fact + Dimensions)
    create_dimensions(df_clean)

    # Step 4 — Load to MySQL
    load_tables_to_mysql()

    print("===== PIPELINE COMPLETED SUCCESSFULLY =====")


if __name__ == "__main__":
    run_pipeline()