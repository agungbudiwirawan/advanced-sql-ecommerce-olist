---Top Seller Ranking (Revenue + Review Score), v2
-- v1 ranked sellers by (revenue * 0.6 + avg_review * 0.4). Revenue is in
-- thousands of BRL while review scores are 1-5, so the review weight had no
-- effect and the ranking was identical to a pure revenue ranking.
-- v2 puts both metrics on the same 0-1 scale with PERCENT_RANK() before
-- weighting, and only ranks sellers with enough orders for a stable average.
WITH seller_metrics AS (
    SELECT
        s.seller_id,
        SUM(oi.price) AS revenue,
        AVG(CAST(orv.review_score AS FLOAT)) AS avg_review,  -- avoid integer AVG
        COUNT(DISTINCT oi.order_id) AS total_orders
    FROM sellers s
    JOIN order_items oi ON s.seller_id = oi.seller_id
    JOIN order_reviews orv ON oi.order_id = orv.order_id
    GROUP BY s.seller_id
),
scored AS (
    SELECT
        *,
        PERCENT_RANK() OVER (ORDER BY revenue) AS revenue_pct,
        PERCENT_RANK() OVER (ORDER BY avg_review) AS review_pct
    FROM seller_metrics
    WHERE total_orders >= 30
)
SELECT
    seller_id,
    revenue,
    avg_review,
    total_orders,
    0.6 * revenue_pct + 0.4 * review_pct AS weighted_score,
    RANK() OVER (ORDER BY 0.6 * revenue_pct + 0.4 * review_pct DESC) AS seller_rank
FROM scored
ORDER BY seller_rank;
