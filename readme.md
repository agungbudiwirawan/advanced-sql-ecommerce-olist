# Advanced E-Commerce Analytics Using SQL  
*(Brazilian E-Commerce – Olist Dataset)*

## 📌 Project Overview
This project focuses on advanced SQL analysis to evaluate the performance of an e-commerce business using the **Brazilian E-Commerce Public Dataset by Olist**.  
The analysis covers revenue trends, seller performance, customer segmentation, and delivery efficiency to support data-driven business decisions.

This project is designed to demonstrate **advanced SQL capabilities** commonly required for **Data Analyst** and **Business Analyst** roles.

---

## 🎯 Objectives
- Analyze monthly revenue trends and growth
- Identify top-performing sellers using weighted metrics
- Segment customers based on RFM (Recency, Frequency, Monetary)
- Evaluate delivery performance and customer behavior
- Apply advanced SQL techniques for real-world business cases

---

## 🧰 Tools & Technologies
- **SQL Server / PostgreSQL**
- **Advanced SQL (CTE, Window Functions, Ranking)**
- Power BI *(optional – for visualization)*
- Dataset: Kaggle – Olist Brazilian E-Commerce

---

## 📂 Dataset Overview
Main tables used in this project:
- `orders`
- `order_items`
- `order_payments`
- `order_reviews`
- `customers`
- `sellers`
- `products`

Dataset source:  
🔗 [Brazilian E-Commerce Public Dataset by Olist (Kaggle)](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

---

## 📊 Business Questions & Analysis

### 1️⃣ Monthly Revenue Growth
**Business Question:**  
How does monthly revenue change over time, and what is the growth rate?

**SQL Highlight (Window Function):**
```sql
LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue
```
📄 Full query
[02_monthly_revenue_growth.sql](https://github.com/agungbudiwirawan/advanced-sql-ecommerce-olist/blob/main/sql/02_monthly_revenue_growth.sql)
