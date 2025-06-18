-- queries.sql

-- 1. Flag high-value transactions
SELECT * FROM transactions
WHERE amount > 100000;

-- 2. Multiple quick transactions from same account in <1 min
SELECT account_id, COUNT(*) as txn_count
FROM transactions
WHERE transaction_time BETWEEN '2025-06-15 10:00:00' AND '2025-06-15 10:01:00'
GROUP BY account_id
HAVING txn_count > 2;

-- 3. Join customers and transactions to see names with high-value transfers
SELECT c.name, t.amount, t.transaction_type, t.transaction_time
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
WHERE t.amount > 100000;
