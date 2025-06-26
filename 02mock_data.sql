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

