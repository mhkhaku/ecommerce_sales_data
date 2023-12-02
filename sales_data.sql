-- Creating Table And Importing Data
CREATE TABLE sales_data (
	invoice_no VARCHAR,
	stock_code VARCHAR,
	description TEXT,
	quantity INT,
	invoice_date VARCHAR,
	unit_price DECIMAL(10,2),
	customer_code VARCHAR,
	country TEXT

);

SELECT * FROM sales_data;

-- Data Cleaning

SELECT
    SUM(CASE WHEN invoice_no IS NULL OR invoice_no = '' THEN 1 ELSE 0 END) AS Missing_InvoiceNo,
    SUM(CASE WHEN stock_code IS NULL OR stock_code = '' THEN 1 ELSE 0 END) AS Missing_StockCode,
    SUM(CASE WHEN description IS NULL OR description = '' THEN 1 ELSE 0 END) AS Missing_Description,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Quantity,
    SUM(CASE WHEN invoice_date IS NULL OR invoice_date = '' THEN 1 ELSE 0 END) AS Missing_InvoiceDate,
    SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END) AS Missing_UnitPrice,
    SUM(CASE WHEN customer_code IS NULL THEN 1 ELSE 0 END) AS Missing_CustomerID,
    SUM(CASE WHEN country IS NULL OR country = '' THEN 1 ELSE 0 END) AS Missing_Country
FROM sales_data;

DELETE FROM sales_data WHERE description IS NULL OR description = '' OR customer_code IS NULL;

SELECT COUNT(*) FROM sales_data;

-- Converting invoice_date From VARCHAR To TIMESTAMP

ALTER TABLE sales_data ADD COLUMN invoice_timeStamp TIMESTAMP;

UPDATE sales_data SET invoice_timestamp = TO_TIMESTAMP(invoice_date, 'MM/DD/YYY HH24:MI')

ALTER TABLE sales_data DROP COLUMN invoice_date;

SELECT * FROM sales_data;

-- Aggregation

-- Total Sales Amount per Country
SELECT country, SUM(quantity * unit_price) AS total_sales
FROM sales_data
GROUP BY country;

-- Average Unit Price per Product
SELECT stock_code, description, AVG(unit_price) AS avg_unit_price
FROM sales_data
GROUP BY stock_code, description
ORDER BY AVG(unit_price) DESC;

-- Number of Invoices per Customer
SELECT customer_code, COUNT(DISTINCT invoice_no) AS num_invoices
FROM sales_data
GROUP BY customer_code
ORDER BY COUNT(DISTINCT invoice_no) DESC;

-- Total Quantity Sold per Month
SELECT EXTRACT(MONTH FROM invoice_timeStamp) AS month, SUM(quantity) AS total_quantity_sold
FROM sales_data
GROUP BY EXTRACT(MONTH FROM invoice_timeStamp);

-- Top Selling Products (based on total quantity sold)
SELECT stock_code, description, SUM(quantity) AS total_quantity_sold
FROM sales_data
GROUP BY stock_code, description
ORDER BY total_quantity_sold DESC
LIMIT 10;

-- Total Sales per Customer and Country
SELECT customer_code, country, SUM(quantity * unit_price) AS total_sales
FROM sales_data
GROUP BY customer_code, country
ORDER BY SUM(quantity * unit_price) DESC;

-- Customer Country With Highest Average Spending
SELECT country, AVG(quantity * unit_price) AS avg_spending_per_customer
FROM sales_data
GROUP BY country
ORDER BY avg_spending_per_customer DESC;

-- Sales of Each Product
SELECT stock_code, description, COUNT(*) AS num_sales
FROM sales_data
GROUP BY stock_code, description
ORDER BY num_sales DESC;

-- Contraints
-- Adding NOT NULL Constraint to sales_data description
ALTER TABLE sales_data
ALTER COLUMN description SET NOT NULL;

