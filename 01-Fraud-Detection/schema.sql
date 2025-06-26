-- Insert sellers
INSERT INTO sellers (seller_id, seller_name, region) VALUES
(1, 'AlphaTech', 'North'),
(2, 'QuickKart', 'West'),
(3, 'SnapShop', 'South'),
(4, 'Techies', 'North'),
(5, 'GizmoHub', 'East');

-- Insert orders
INSERT INTO orders (order_id, seller_id, buyer_id, order_date, order_amount, shipping_region) VALUES
(101, 1, 201, '2024-06-01', 1200.50, 'North'),
(102, 2, 202, '2024-06-02', 300.00, 'West'),
(103, 2, 202, '2024-06-02', 300.00, 'West'), -- duplicate order
(104, 3, 203, '2024-06-03', 150.75, 'South'),
(105, 4, 204, '2024-06-03', 199.99, 'South'), -- mismatched region
(106, 2, 202, '2024-06-04', 500.00, 'West'),
(107, 5, 205, '2024-06-04', 850.00, 'East'),
(108, 5, 206, '2024-06-05', 400.00, 'West'); -- mismatched region

-- Insert refunds
INSERT INTO refunds (refund_id, order_id, refund_date, reason) VALUES
(1, 102, '2024-06-05', 'Damaged'),
(2, 103, '2024-06-06', 'Duplicate'),
(3, 106, '2024-06-07', 'Customer Cancelled'),
(4, 108, '2024-06-08', 'Late Delivery');

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
