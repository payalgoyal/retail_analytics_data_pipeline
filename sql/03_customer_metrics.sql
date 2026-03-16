-- Revenue per Customer
SELECT
    c.customer_key,
    SUM(f.total_amount) AS customer_revenue
FROM fact_sales f
JOIN dim_customer c
    ON f.customer_key = c.customer_key
WHERE f.IsCancelled = 0
GROUP BY c.customer_key
ORDER BY customer_revenue DESC;

-- Top Countries by Revenue
SELECT
    country,
    Round(SUM(total_amount),2) AS revenue
FROM fact_sales 
WHERE IsCancelled = 0
GROUP BY country
ORDER BY revenue DESC;
