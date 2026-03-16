CREATE OR REPLACE VIEW executive_overview_vw AS
SELECT
    d.Year,
    d.Month,
    d.MonthName,

    COUNT(DISTINCT f.invoice_no) AS total_orders,
    COUNT(DISTINCT c.CustomerId) AS unique_customers,
    f.country,

    SUM(f.quantity) AS total_quantity,
    SUM(f.total_amount) AS total_revenue,

    ROUND(SUM(f.total_amount) / COUNT(DISTINCT f.invoice_no),2) AS avg_order_value

FROM fact_sales f
JOIN dim_customer c
	ON f.customer_key = c.customer_key
JOIN dim_date d
    ON f.date_key = d.date_key

WHERE f.IsCancelled = 0

GROUP BY
    d.Year,
    d.Month,
    d.MonthName,
    f.country

ORDER BY
    d.Year,
    d.Month;