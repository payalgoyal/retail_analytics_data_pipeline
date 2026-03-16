-- Revenue by Weekday
SELECT
    d.Weekday,
    SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_date d
    ON f.date_key = d.date_key
WHERE f.IsCancelled = 0
GROUP BY d.Weekday
ORDER BY revenue DESC;

