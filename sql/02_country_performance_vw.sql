CREATE OR REPLACE VIEW country_performance_vw AS
SELECT
    f.country,

    COUNT(DISTINCT c.CustomerId) AS total_customers,
    COUNT(DISTINCT f.invoice_no) AS total_orders,

    SUM(f.quantity) AS total_quantity,
    SUM(f.total_amount) AS total_revenue,

    ROUND(SUM(f.total_amount)/COUNT(DISTINCT c.CustomerId),2) AS revenue_per_customer

FROM fact_sales f
JOIN dim_customer c
	ON f.customer_key = c.customer_key

WHERE f.IsCancelled = 0

GROUP BY
    f.country;