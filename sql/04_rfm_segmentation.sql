---Customer RFM Segmentation
WITH rfm AS (
    SELECT
        c.customer_unique_id,
        MAX(o.order_purchase_timestamp) AS last_order,
        COUNT(o.order_id) AS frequency,
        SUM(oi.price) AS monetary
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
),
rfm_score AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY last_order DESC) AS recency_score,
        NTILE(5) OVER (ORDER BY frequency DESC) AS frequency_score,
        NTILE(5) OVER (ORDER BY monetary DESC) AS monetary_score
    FROM rfm
)
SELECT *,
    recency_score + frequency_score + monetary_score AS rfm_total
FROM rfm_score;
