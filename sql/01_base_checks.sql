USE retail_intelligence;

-- Row counts
SELECT COUNT(*) FROM fact_sales;
SELECT COUNT(*) FROM dim_customer;
SELECT COUNT(*) FROM dim_product;
SELECT COUNT(*) FROM dim_date;

-- Null checks
SELECT COUNT(*) FROM fact_sales WHERE customer_key IS NULL;
SELECT COUNT(*) FROM fact_sales WHERE product_key IS NULL;
SELECT COUNT(*) FROM fact_sales WHERE date_key IS NULL;

SELECT IsCancelled, COUNT(*)
FROM fact_sales
GROUP BY IsCancelled;