-- CREATE DATABASE nyc_property_sales;
USE nyc_property_sales;
-- SELECT DATABASE();
/*
CREATE TABLE property_sales (
    borough INT,
    borough_name VARCHAR(50),
    neighborhood VARCHAR(100),
    building_class_category VARCHAR(150),
    residential_units DOUBLE,
    commercial_units DOUBLE,
    total_units DOUBLE,
    land_square_feet DOUBLE,
    gross_square_feet DOUBLE,
    year_built DOUBLE,
    sale_price BIGINT,
    sale_date DATE,
    zip_code DOUBLE,
    latitude DOUBLE,
    longitude DOUBLE,
    nta VARCHAR(100)
);
*/

-- Table Data Import Wizard
-- Check if conversion was successful

/*
SELECT COUNT(*)
FROM property_sales;
*/

-- Set -1 to null

/*
SET SQL_SAFE_UPDATES = 0;
UPDATE property_sales
SET
    residential_units = NULLIF(residential_units, -1),
    commercial_units = NULLIF(commercial_units, -1),
    total_units = NULLIF(total_units, -1),
    land_square_feet = NULLIF(land_square_feet, -1),
    gross_square_feet = NULLIF(gross_square_feet, -1),
    year_built = NULLIF(year_built, -1),
    zip_code = NULLIF(zip_code, -1),
    latitude = NULLIF(latitude, -1),
    longitude = NULLIF(longitude, -1)
WHERE borough IN (1, 2, 3, 4, 5);
*/

-- Check if -1 values were successfully converted to NULL

/*
SELECT
    SUM(residential_units = -1) AS residential_minus1,
    SUM(commercial_units = -1) AS commercial_minus1,
    SUM(total_units = -1) AS total_minus1,
    SUM(year_built = -1) AS year_minus1,
    SUM(zip_code = -1) AS zip_minus1
FROM property_sales;
*/

-- =========================================================
-- NYC Property Sales Financial Analysis
-- Data Source: NYC Open Data
--
-- Main Question:
-- How have NYC property sales activity and prices changed
-- over time, and how do they differ across boroughs
-- and property types?
-- =========================================================

-- =========================================================
-- 1. Annual Transaction Activity and Average Sale Price
-- =========================================================

SELECT
    YEAR(sale_date) AS sale_year,
    COUNT(*) AS transaction_count,
    ROUND(AVG(sale_price), 0) AS average_sale_price
FROM property_sales
GROUP BY YEAR(sale_date)
ORDER BY sale_year;


-- =========================================================
-- 2. Transaction Activity and Average Sale Price by Borough
-- =========================================================

SELECT
    borough_name,
    COUNT(*) AS transaction_count,
    ROUND(AVG(sale_price), 0) AS average_sale_price
FROM property_sales
GROUP BY borough_name
ORDER BY transaction_count DESC;


-- =========================================================
-- 3. Transaction Activity and Average Sale Price by Property Type
-- =========================================================

SELECT
    building_class_category AS property_type,
    COUNT(*) AS transaction_count,
    ROUND(AVG(sale_price), 0) AS average_sale_price
FROM property_sales
GROUP BY building_class_category
ORDER BY transaction_count DESC
LIMIT 10;


-- =========================================================
-- 4. High-Value Transactions
-- IQR upper limit: $2,512,258.75
-- =========================================================

SELECT
    COUNT(*) AS high_value_transactions,
    ROUND(AVG(sale_price), 0) AS average_high_value_price
FROM property_sales
WHERE sale_price > 2512258.75;


-- =========================================================
-- 5. High-Value Transactions by Borough
-- =========================================================

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
-- =========================================================

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
-- =========================================================

SELECT
    building_class_category AS property_type,
    COUNT(*) AS high_value_transactions,
    ROUND(AVG(sale_price), 0) AS average_high_value_price
FROM property_sales
WHERE sale_price > 2512258.75
GROUP BY building_class_category
ORDER BY high_value_transactions DESC
LIMIT 10;