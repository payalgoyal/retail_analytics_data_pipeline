-- Total Revenue

SELECT
	Round(
		SUM(total_amount),
		2) AS total_revenue
FROM fact_sales
WHERE IsCancelled = 0;

-- Total Orders
SELECT
    COUNT(DISTINCT invoice_no) AS total_orders
FROM fact_sales
WHERE IsCancelled = 0;

-- Total Customers
SELECT
    COUNT(DISTINCT customer_key) AS total_customers
FROM fact_sales;

-- Average Order Value
SELECT
    Round(SUM(total_amount) / COUNT(DISTINCT invoice_no),2) AS avg_order_value
FROM fact_sales
WHERE IsCancelled = 0;

-- Monthly Revenue Trend
SELECT
    d.Year,
    d.Month,
    SUM(f.total_amount) AS monthly_revenue
FROM fact_sales f
JOIN dim_date d
    ON f.date_key = d.date_key
WHERE f.IsCancelled = 0
GROUP BY d.Year, d.Month
ORDER BY d.Year, d.Month;