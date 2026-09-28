USE nyc_property_sales;


-- =========================================================
-- NYC Property Sales Financial Analysis
-- Create / Replace Views
-- =========================================================


-- =========================================================
-- 1. Annual Sales Analysis
-- =========================================================

CREATE OR REPLACE VIEW annual_sales_analysis AS
SELECT
    YEAR(sale_date) AS sale_year,
    COUNT(*) AS transaction_count,
    ROUND(AVG(sale_price), 0) AS average_sale_price
FROM property_sales
GROUP BY YEAR(sale_date)
ORDER BY sale_year;


-- =========================================================
-- 2. Borough Sales Analysis
-- =========================================================

CREATE OR REPLACE VIEW borough_sales_analysis AS
SELECT
    borough_name,
    COUNT(*) AS transaction_count,
    ROUND(AVG(sale_price), 0) AS average_sale_price
FROM property_sales
GROUP BY borough_name
ORDER BY transaction_count DESC;


-- =========================================================
-- 3. Property Type Analysis
-- Top 10 property types by transaction count
-- =========================================================

CREATE OR REPLACE VIEW property_type_analysis AS
SELECT
    building_class_category AS property_type,
    COUNT(*) AS transaction_count,
    ROUND(AVG(sale_price), 0) AS average_sale_price
FROM property_sales
GROUP BY building_class_category
ORDER BY transaction_count DESC
LIMIT 10;


-- =========================================================
-- 4. High-Value Transactions - Overall
-- High-value threshold: $2,512,258.75
-- Based on IQR method in Python / NumPy
-- =========================================================

CREATE OR REPLACE VIEW high_value_overall_analysis AS
SELECT
    COUNT(*) AS high_value_transactions,
    ROUND(AVG(sale_price), 0) AS average_high_value_price
FROM property_sales
WHERE sale_price > 2512258.75;


-- =========================================================
-- 5. High-Value Transactions by Borough
-- =========================================================

CREATE OR REPLACE VIEW high_value_borough_analysis AS
SELECT
    borough_name,
    COUNT(*) AS high_value_transactions,
    ROUND(AVG(sale_price), 0) AS average_high_value_price
FROM property_sales
WHERE sale_price > 2512258.75
GROUP BY borough_name
ORDER BY high_value_transactions DESC;


-- =========================================================
-- 6. High-Value Transactions by Neighborhood
-- Top 15 neighborhoods by high-value transaction count
-- =========================================================

CREATE OR REPLACE VIEW high_value_neighborhood_analysis AS
SELECT
    borough_name,
    neighborhood,
    COUNT(*) AS high_value_transactions,
    ROUND(AVG(sale_price), 0) AS average_high_value_price
FROM property_sales
WHERE sale_price > 2512258.75
GROUP BY borough_name, neighborhood
ORDER BY high_value_transactions DESC
LIMIT 15;


-- =========================================================
-- 7. High-Value Transactions by Property Type
-- Top 10 property types by high-value transaction count
-- =========================================================

CREATE OR REPLACE VIEW high_value_property_analysis AS
SELECT
    building_class_category AS property_type,
    COUNT(*) AS high_value_transactions,
    ROUND(AVG(sale_price), 0) AS average_high_value_price
FROM property_sales
WHERE sale_price > 2512258.75
GROUP BY building_class_category
ORDER BY high_value_transactions DESC
LIMIT 10;


-- =========================================================
-- Check All Views
-- =========================================================

SELECT * FROM annual_sales_analysis;

SELECT * FROM borough_sales_analysis;

SELECT * FROM property_type_analysis;

SELECT * FROM high_value_overall_analysis;

SELECT * FROM high_value_borough_analysis;

SELECT * FROM high_value_neighborhood_analysis;

SELECT * FROM high_value_property_analysis;