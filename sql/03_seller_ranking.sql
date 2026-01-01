---Top Seller Ranking (Revenue + Review Score)
WITH seller_metrics AS (
    SELECT
        s.seller_id,
        SUM(oi.price) AS revenue,
        AVG(orv.review_score) AS avg_review
    FROM sellers s
    JOIN order_items oi ON s.seller_id = oi.seller_id
    JOIN order_reviews orv ON oi.order_id = orv.order_id
    GROUP BY s.seller_id
)
SELECT *,
    RANK() OVER (ORDER BY (revenue * 0.6 + avg_review * 0.4) DESC) AS seller_rank
FROM seller_metrics;
