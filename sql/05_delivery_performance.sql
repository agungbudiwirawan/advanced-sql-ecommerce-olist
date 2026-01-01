---Delivery Performance Analysis
SELECT
    CASE
        WHEN DATEDIFF(day, order_purchase_timestamp, order_delivered_customer_date) <= 7 THEN 'Fast'
        WHEN DATEDIFF(day, order_purchase_timestamp, order_delivered_customer_date) <= 14 THEN 'Medium'
        ELSE 'Slow'
    END AS delivery_speed,
    COUNT(*) AS total_orders
FROM orders
WHERE order_status = 'delivered'
GROUP BY
    CASE
        WHEN DATEDIFF(day, order_purchase_timestamp, order_delivered_customer_date) <= 7 THEN 'Fast'
        WHEN DATEDIFF(day, order_purchase_timestamp, order_delivered_customer_date) <= 14 THEN 'Medium'
        ELSE 'Slow'
    END;
