

-- Sales Trend Analysis - PostgreSQL Script


-- 1️⃣ Create Customers Table
DROP TABLE IF EXISTS customers CASCADE;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

-- 2️⃣ Create Products Table
DROP TABLE IF EXISTS products CASCADE;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

-- 3️⃣ Create Sales Table
DROP TABLE IF EXISTS sales CASCADE;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    ship_date DATE NOT NULL,
    customer_id INT REFERENCES customers(customer_id),
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);

-- 4️⃣ Import Data from CSV files
-- ⚠️ Make sure CSV files are placed in PostgreSQL accessible path
-- Update '/path/to/' to your actual file location

-- Import Customers
COPY customers(customer_id, customer_name, region)
FROM '/path/to/customers.csv'
DELIMITER ','
CSV HEADER;

-- Import Products
COPY products(product_id, product_name, category, unit_price)
FROM '/path/to/products.csv'
DELIMITER ','
CSV HEADER;

-- Import Sales
COPY sales(sale_id, order_date, ship_date, customer_id, product_id, quantity, unit_price)
FROM '/path/to/sales.csv'
DELIMITER ','
CSV HEADER;

-- 5️⃣ Monthly Revenue & Order Volume Analysis (Full Dataset)
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(quantity * unit_price) AS monthly_revenue,
    COUNT(DISTINCT sale_id) AS order_volume
FROM sales
GROUP BY year, month
ORDER BY year, month;

-- 6️⃣ Optional: Filter by Specific Period (Example: Jan 2024 - Dec 2024)
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(quantity * unit_price) AS monthly_revenue,
    COUNT(DISTINCT sale_id) AS order_volume
FROM sales
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY year, month
ORDER BY year, month;
