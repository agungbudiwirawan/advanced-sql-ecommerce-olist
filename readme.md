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

**Key Insights:**
- Revenue shows clear seasonality
- Significant spikes occur toward the end of the year
- Revenue decline observed after peak seasons

### 2️⃣ Seller Performance Ranking
**Business Question:**
Which sellers perform best when considering both revenue and customer reviews?

**Approach:**
Weighted score combining:
-Revenue (60%)
-Average review score (40%)

**SQL Highlight (Window Function):**
```sql
RANK() OVER (
    ORDER BY (revenue * 0.6 + avg_review * 0.4) DESC
) AS seller_rank
```
📄 Full query

[03_seller_ranking.sql](https://github.com/agungbudiwirawan/advanced-sql-ecommerce-olist/blob/main/sql/03_seller_ranking.sql)

3️⃣ Customer Segmentation (RFM Analysis)

Business Question:
Who are the most valuable customers?

Metrics Used:

Recency: last purchase date

Frequency: total number of orders

Monetary: total spending

SQL Highlight:

NTILE(5) OVER (ORDER BY monetary DESC) AS monetary_score


📄 Full query:
➡️ sql/04_rfm_segmentation.sql

Key Insights:

A small percentage of customers contribute the majority of revenue

High-RFM customers are ideal targets for retention campaigns

4️⃣ Delivery Performance Analysis

Business Question:
How efficient is the delivery process?

📄 Full query:
➡️ sql/05_delivery_performance.sql

Key Insights:

Faster delivery correlates with higher review scores

Late deliveries negatively impact customer satisfaction

5️⃣ Repeat Customer Rate

Business Question:
How many customers place more than one order?

📄 Full query:
➡️ sql/06_repeat_customer.sql

Key Insights:

Repeat customers represent a critical revenue segment

Customer retention offers strong growth opportunities

🧠 SQL Techniques Used

Common Table Expressions (CTE)

Window Functions (LAG, RANK, NTILE)

Time Series Analysis

Aggregations & Conditional Logic

Business-oriented query design

📈 Key Business Insights (Summary)

Revenue is highly seasonal with strong end-of-year peaks

Seller performance should be evaluated beyond revenue alone

A small group of customers drives a large share of total revenue

Delivery speed plays a significant role in customer satisfaction

🚀 Future Enhancements

Build interactive dashboards using Power BI

Perform cohort and retention analysis

Extend analysis using Python for predictive modeling

👤 Author

Agung Budi Wirawan
Aspiring Data Analyst | SQL • Power BI • Python
