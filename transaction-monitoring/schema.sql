-- schema.sql
-- SQL schema for a basic banking system to analyze transaction behavior and detect suspicious activity

-- 1. Customer Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    city VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Accounts Table
CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type ENUM('Savings', 'Checking', 'Business') NOT NULL,
    balance DECIMAL(12,2) DEFAULT 0.00,
    opened_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- 3. Transactions Table
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_type ENUM('deposit', 'withdrawal') NOT NULL,
    transaction_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    transaction_status ENUM('success', 'failed', 'pending') DEFAULT 'success',
    FOREIGN KEY (account_id) REFERENCES accounts(account_id) ON DELETE CASCADE
);
