CREATE DATABASE retail_analysis;
USE retail_analysis;
CREATE TABLE sales (
    transaction_id INT,
    sale_date DATE,
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    total_amount DECIMAL(10,2)
);
SELECT *
FROM retail_sales_dataset
LIMIT 10;
SELECT SUM(`Total Amount`) AS total_revenue
FROM retail_sales_dataset;
SELECT COUNT(DISTINCT `Transaction ID`)
       AS total_transactions
FROM retail_sales_dataset;
SELECT
    `Product Category`,
    SUM(`Total Amount`) AS revenue
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY revenue DESC;
SELECT COUNT(*) FROM sales;
SELECT
    MONTH(`Date`) AS month,
    SUM(`Total Amount`) AS revenue
FROM  retail_sales_dataset
GROUP BY MONTH(`Date`)
ORDER BY month;
SELECT
    gender,
    SUM(`Total Amount`) AS revenue
FROM  retail_sales_dataset
GROUP BY gender;
SELECT
    CASE
        WHEN age < 20 THEN 'Under 20'
        WHEN age < 30 THEN '20-29'
        WHEN age < 40 THEN '30-39'
        WHEN age < 50 THEN '40-49'
        ELSE '50 and above'
    END AS age_group,
    SUM(`Total Amount`) AS revenue
FROM retail_sales_dataset
GROUP BY age_group
ORDER BY revenue DESC;
SELECT
    AVG(`Total Amount`)
    AS average_transaction_value
FROM  retail_sales_dataset;
SELECT
    `Transaction ID`,
    `Customer ID`,
    `Total Amount`
FROM retail_sales_dataset
ORDER BY `Total Amount` DESC
LIMIT 5;
