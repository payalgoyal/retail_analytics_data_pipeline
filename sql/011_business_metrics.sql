-- Total Revenue
SELECT
	ROUND(SUM(Revenue),2) as total_revenue
FROM fact_sales;

-- Total Orders
SELECT
	COUNT(DISTINCT(Invoice)) as total_orders
FROM fact_sales;

-- Total Customers
SELECT
	COUNT(CustomerId) as total_customer
FROM dim_customer;

-- Average Order Value
SELECT
    ROUND(
        SUM(total_amount) /
        COUNT(DISTINCT invoice_no),
        2
    ) AS avg_order_value
FROM fact_sales;

-- Revenue per Customer
SELECT
	ROUND(
		SUM(total_amount)/
        COUNT(Distinct 'CustomerId'),
        2) as revenue_per_customer
	FROM fact_sales;
    
