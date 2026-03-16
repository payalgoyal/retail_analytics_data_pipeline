📊 Retail Sales Intelligence — End-to-End Data Analytics Pipeline
📌 Project Overview

This project demonstrates an end-to-end Retail Analytics Data Pipeline built using Python, MySQL, SQL Analytics, and Power BI.

The objective of the project is to simulate a real-world analytics workflow — starting from raw transactional data ingestion to business-ready dashboards that generate actionable insights.

Instead of performing transformations directly inside Power BI, this project implements a structured analytics architecture where data preparation, modeling, and aggregations are handled upstream using Python and SQL.

🏗️ Architecture
Raw CSV Dataset
        ↓
Python ETL Pipeline
(Ingestion → Cleaning → Feature Engineering)
        ↓
MySQL Data Warehouse
(Fact & Dimension Tables)
        ↓
SQL Analytics Views
(Business Metrics Layer)
        ↓
Power BI Dashboard
(Insights & Visualization)


⚙️ Tech Stack
Layer	                Tools Used
Data Processing	      Python (Pandas)
Database	            MySQL
Data Modeling	        Star Schema
Analytics Layer	      SQL Views
Visualization	        Power BI
Version Control	      GitHub

🔄 Pipeline Workflow
1️⃣ Data Ingestion
    Raw retail transaction dataset loaded from CSV files.
    Structured ingestion using Python.

2️⃣ Data Cleaning
    Datetime standardization
    Handling cancellations
    Column normalization
    Data quality checks

3️⃣ Feature Engineering  
    Revenue calculation
    Date extraction
    Creation of analytical attributes
    Surrogate key generation

4️⃣ Data Warehouse Modeling
    Star schema design implemented:
    Fact Table
      fact_sales
    Dimension Tables
      dim_date
      dim_customer
      dim_product

5️⃣ SQL Analytics Layer  
    Business-ready analytics views created to shift aggregations from BI layer to database:
        Executive performance metrics
        Customer behavior analysis
        Product performance insights
        Market performance analysis
These views act as independent analytical datasets consumed directly by Power BI.

6️⃣ Power BI Dashboard

Interactive dashboards built using SQL views as source tables.
Dashboard Pages

✅ Executive Overview
Revenue trends
Order volume
Average order value
KPI monitoring

✅ Market Analysis
Revenue performance by country
Market comparison insights

✅ Product Performance
Top products by revenue and quantity
Product contribution analysis

✅ Customer Behavior
Customer growth trends
Purchase patterns

📈 Key Business Insights

Revenue demonstrates clear monthly seasonality trends.
A small group of products contributes disproportionately to total revenue.
Market performance is concentrated in key regions.
Customer growth directly impacts order volume expansion.

🧠 Key Concepts Demonstrated

End-to-End Data Pipeline Design
ETL using Python
Data Warehouse Modeling (Star Schema)
Surrogate Key Implementation
SQL Analytics Layer Design
Separation of Data Engineering and BI Layers
Business-Oriented Dashboard Development

📂 Project Structure
retail-analytics-data-pipeline/
│
├── src/                 # Python ETL scripts
├── sql/                 # Table creation & analytics views
├── powerbi/             # Power BI dashboard file
├── docs/                # Dashboard screenshots
└── README.md

🔐 Note on Credentials

Database credentials have been replaced with placeholders for security.
Update connection details locally before running the pipeline.

👩‍💻 Author
Payal Ag
Aspiring Data Analyst | Data Engineering Enthusiast
Focused on building practical, end-to-end analytics solutions.

⭐ Project Goal
This project showcases the transition from traditional dashboard creation to a modern analytics workflow, where data engineering, SQL analytics, and business intelligence work together to produce scalable insights.
