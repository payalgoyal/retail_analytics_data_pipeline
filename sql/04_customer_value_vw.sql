CREATE OR REPLACE VIEW customer_value_vw AS
SELECT
    c.CustomerId,
    f.Country,

    COUNT(DISTINCT f.invoice_no) AS total_orders,
    SUM(f.quantity) AS total_quantity,
    Round(SUM(f.total_amount),2) AS total_spent,

    ROUND(SUM(f.total_amount)/COUNT(DISTINCT f.invoice_no),2) AS avg_order_value

FROM fact_sales f

JOIN dim_customer c
    ON f.customer_key = c.customer_key

WHERE f.IsCancelled = 0

GROUP BY
    c.CustomerId,
    f.Country;