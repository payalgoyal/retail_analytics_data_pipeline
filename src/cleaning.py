import pandas as pd

def clean_data(df):
    df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])

    df["Customer ID"] = (
        df["Customer ID"]
        .astype("Int64")
        .astype("string")
    )

    df = df.drop_duplicates()

    df = df[df["Description"].notna()]
    df = df[df["Customer ID"].notna()]
    df = df[df["Price"] > 0]

    df.rename(columns={"Customer ID": "CustomerId"}, inplace=True)
    df["IsCancelled"] = df["Invoice"].str.startswith("C")

    df["Revenue"] = df["Quantity"] * df["Price"]
    df["Date"] = df["InvoiceDate"].dt.date

    return df