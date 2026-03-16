-- Top Products
SELECT
    p.Description,
    SUM(f.quantity) AS total_quantity
FROM fact_sales f
JOIN dim_product p
    ON f.product_key = p.product_key
WHERE f.IsCancelled = 0
GROUP BY p.Description
ORDER BY total_quantity DESC
LIMIT 10;
