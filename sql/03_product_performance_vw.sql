CREATE OR REPLACE VIEW product_performance_vw AS
SELECT
    p.Description,
	f.country,
    COUNT(DISTINCT f.invoice_no) AS total_orders,
    SUM(f.quantity) AS total_quantity,
    Round(SUM(f.total_amount),2) AS total_revenue,

    ROUND(SUM(f.total_amount)/SUM(f.quantity),2) AS avg_price

FROM fact_sales f

JOIN dim_product p
    ON f.product_key = p.product_key

WHERE f.IsCancelled = 0

GROUP BY
    p.Description,
    f.country

HAVING SUM(f.quantity) > 100
ORDER BY total_revenue DESC;