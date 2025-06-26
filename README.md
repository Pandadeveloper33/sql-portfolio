# 🕵️‍♀️ Fraud Detection in eCommerce using SQL

This project simulates real-world fraud detection for an online marketplace using structured SQL queries. As a risk analyst, the goal is to flag suspicious sellers, identify anomalies in shipping behavior, and detect abnormal refund patterns.

---

## 🗂️ Files Included

| File | Description |
|------|-------------|
| `01-schema.sql` | Defines the database tables: sellers, orders, refunds |
| `02-mock_data.sql` | Sample data to simulate real transactions and refund behavior |
| `03-queries.sql` | Contains SQL queries used to detect fraud patterns |

---

## 🧠 Problem Statement

> As an analyst in an eCommerce company, your job is to investigate seller behavior and uncover patterns that may indicate fraud, such as:
>
> - Repeated refunds from the same sellers  
> - Orders shipped to unusual locations  
> - Duplicate transactions by the same buyer  
> - Sellers with unusually high refund rates

---

## 🧪 Dataset Overview

We simulate a basic relational schema:

- **Sellers**: Seller name and their registered region  
- **Orders**: Buyer orders including amount and shipping region  
- **Refunds**: Refunds tied to orders with reasons  

*(Optional: Add an ER diagram or schema image here later)*

---

## 🧾 Key SQL Queries

| Objective | Description |
|----------|-------------|
| Refund Count | Find sellers with multiple refunds |
| Duplicate Orders | Detect same buyer ordering the same item more than once |
| Region Mismatch | Flag orders with different seller and shipping regions |
| Refund Rate | Calculate refund percentage for each seller |
| Top Risk Sellers | List top 3 sellers with most refunds |

---

## 💼 Real-World Relevance

This case study reflects the kind of work done by:
- 📊 Data Analysts in eCommerce
- 🔍 Risk Analysts in FinTech or payments
- 🛡️ Compliance teams monitoring seller behavior

---

## 🛠️ Tools Used

- MySQL
- MySQL Workbench
- GitHub

---

## ✨ Future Improvements

- [ ] Add Power BI dashboard for visualizing refund rates  
- [ ] Link with real data
