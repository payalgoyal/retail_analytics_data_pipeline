import pandas as pd
from sqlalchemy import create_engine

def load_tables_to_mysql():
    print("Connecting to MySQL...")

    # ---- DATABASE CONNECTION ----
    username = "your_username"
    password = "your_password"
    host = "localhost"
    database = "retail_intelligence"

    engine = create_engine(
        f"mysql+mysqlconnector://{username}:{password}@{host}/{database}"
    )

    file_path = r"D:\Analyst\DigitalProduct\Automated_Retail_Intelligence\data\processed"

    # ---- LOAD FILE PATHS ----
    dim_date = pd.read_csv(file_path + "//dim_date.csv")
    dim_customer = pd.read_csv(file_path + "//dim_customer.csv")
    dim_product = pd.read_csv(file_path + "//dim_product.csv")
    fact_sales = pd.read_csv(file_path + "//fact_sales.csv")

    print("Loading tables into MySQL...")

    # ---- LOAD TABLES ----
    dim_date.to_sql("dim_date", engine, if_exists="replace", index=False,chunksize=5000, method="multi")
    dim_customer.to_sql("dim_customer", engine, if_exists="replace", index=False,chunksize=5000, method="multi")
    dim_product.to_sql("dim_product", engine, if_exists="replace", index=False,chunksize=5000, method="multi")
    fact_sales.to_sql("fact_sales", engine, if_exists="replace", index=False,chunksize=5000, method="multi")

    print("✅ Data successfully loaded into MySQL")