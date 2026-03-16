import pandas as pd

def create_dimensions(df):
    date_range = pd.date_range(
        start=df["InvoiceDate"].min(),
        end=df["InvoiceDate"].max(),
        freq="D"
    )

    dim_date = pd.DataFrame({"Date": date_range})

    dim_date = dim_date.reset_index(drop=True)
    dim_date["date_key"] = dim_date.index + 1

    dim_date["Year"] = dim_date["Date"].dt.year
    dim_date["Month"] = dim_date["Date"].dt.month
    dim_date["MonthName"] = dim_date["Date"].dt.month_name()
    dim_date["Quarter"] = dim_date["Date"].dt.quarter
    dim_date["Weekday"] = dim_date["Date"].dt.day_name()

    dim_date["Date"] = dim_date["Date"].dt.date
    
    dim_date = dim_date[
        ["date_key","Date","Year","Month","MonthName","Quarter","Weekday"]
    ]

    dim_product = (
        df[["StockCode", "Description"]]
        .drop_duplicates()
        .sort_values("StockCode")
        .reset_index(drop=True)
    )

    dim_product["product_key"] = dim_product.index + 1

    dim_product = dim_product[
        ["product_key", "StockCode", "Description"]
    ]

    dim_customer = (
        df[["CustomerId"]]
        .dropna()
        .drop_duplicates()
        .sort_values("CustomerId")
        .reset_index(drop=True)
    )

    # surrogate key
    dim_customer["customer_key"] = dim_customer.index + 1

    # reorder columns
    dim_customer = dim_customer[["customer_key", "CustomerId"]]

    fact_sales = df[[
        "Invoice","StockCode","CustomerId","Country",
        "Date","Quantity","Price","Revenue","IsCancelled"
    ]].copy()

    fact_sales = fact_sales.merge(
        dim_date[["date_key","Date"]],
        on="Date",
        how="left"
    )

    fact_sales = fact_sales.merge(
        dim_customer,
        on="CustomerId",
        how="left"
    )

    fact_sales = fact_sales.merge(
        dim_product,
        on=["StockCode"],
        how="left"
    )

    fact_sales = fact_sales[
        [
            "Invoice",
            "customer_key",
            "product_key",
            "date_key",
            "Country",
            "Quantity",
            "Price",
            "Revenue",
            "IsCancelled"
        ]
    ].copy()  

    fact_sales.rename(columns={
        "Invoice": "invoice_no",
        "Country": "country",
        "Quantity": "quantity",
        "Revenue": "total_amount"
    }, inplace=True)

    file_path = r"D:\Analyst\DigitalProduct\Automated_Retail_Intelligence\data\processed"
    dim_date.to_csv(file_path + "\\dim_date.csv", index=False)
    dim_product.to_csv(file_path + "\\dim_product.csv", index=False)
    dim_customer.to_csv(file_path + "\\dim_customer.csv", index=False)
    fact_sales.to_csv(file_path + "\\fact_sales.csv", index=False)

    return dim_date, dim_product, dim_customer, fact_sales