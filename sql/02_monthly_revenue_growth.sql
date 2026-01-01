---Monthly Revenue Growth (Window Function)
WITH monthly_revenue AS (
    SELECT 
        FORMAT(o.order_purchase_timestamp, 'yyyy-MM') AS month,
        SUM(oi.price) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY FORMAT(o.order_purchase_timestamp, 'yyyy-MM')
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month)) 
        * 100.0 / LAG(revenue) OVER (ORDER BY month), 2
    ) AS growth_percentage
FROM monthly_revenue;
