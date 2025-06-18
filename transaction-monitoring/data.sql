-- data.sql

INSERT INTO customers VALUES
(1, 'Ayesha Singh', 'Delhi'),
(2, 'Rohan Mehta', 'Mumbai');

INSERT INTO accounts VALUES
(101, 1, 'Savings'),
(102, 2, 'Checking');

INSERT INTO transactions VALUES
(1, 101, 150000, 'withdrawal', '2025-06-15 10:00:00'),
(2, 101, 1000, 'deposit', '2025-06-15 10:00:30'),
(3, 101, 1200, 'deposit', '2025-06-15 10:00:59'),
(4, 102, 250000, 'deposit', '2025-06-15 10:05:00'),
(5, 102, 80000, 'withdrawal', '2025-06-15 10:10:00');
