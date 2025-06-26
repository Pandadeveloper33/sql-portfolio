CREATE TABLE sellers (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    seller_id INT,
    buyer_id INT,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    shipping_region VARCHAR(50),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);

CREATE TABLE refunds (
    refund_id INT PRIMARY KEY,
    order_id INT,
    refund_date DATE,
    reason VARCHAR(100),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
