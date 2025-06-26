SELECT 
    s.seller_name,
    COUNT(r.refund_id) AS total_refunds
FROM 
    refunds r
JOIN 
    orders o ON r.order_id = o.order_id
JOIN 
    sellers s ON o.seller_id = s.seller_id
GROUP BY 
    s.seller_name
HAVING 
    COUNT(r.refund_id) >= 2;
SELECT 
    buyer_id, order_date, order_amount, COUNT(*) AS duplicate_count
FROM 
    orders
GROUP BY 
    buyer_id, order_date, order_amount
HAVING 
    COUNT(*) > 1;
SELECT 
    o.order_id,
    s.seller_name,
    s.region AS seller_region,
    o.shipping_region
FROM 
    orders o
JOIN 
    sellers s ON o.seller_id = s.seller_id
WHERE 
    s.region <> o.shipping_region;
SELECT 
    s.seller_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT r.refund_id) AS total_refunds,
    ROUND(COUNT(DISTINCT r.refund_id) * 100.0 / COUNT(DISTINCT o.order_id), 2) AS refund_rate_percent
FROM 
    sellers s
LEFT JOIN 
    orders o ON s.seller_id = o.seller_id
LEFT JOIN 
    refunds r ON o.order_id = r.order_id
GROUP BY 
    s.seller_name;
SELECT 
    s.seller_name,
    COUNT(r.refund_id) AS refund_count
FROM 
    refunds r
JOIN 
    orders o ON r.order_id = o.order_id
JOIN 
    sellers s ON o.seller_id = s.seller_id
GROUP BY 
    s.seller_name
ORDER BY 
    refund_count DESC
LIMIT 3;
