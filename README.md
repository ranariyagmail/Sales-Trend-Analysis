# Sales-Trend-Analysis- Using SQL

Analyze monthly revenue and order volume using SQL aggregation functions.

**Dataset**
The dataset contains the following columns:

sale_id: Unique ID for each sale

order_date: Date of the order

product: Name of the product sold

quantity: Number of units sold

price: Price per unit

total_amount: Calculated as quantity * price

**Tools Used**
PostgreSQL / MySQL / SQLite

SQL aggregation functions


**Analysis Performed:**

Extracted year and month from order_date

Calculated total revenue using SUM(amount

Counted unique order volume using COUNT(DISTINCT order_id)

Grouped and sorted by year & month
