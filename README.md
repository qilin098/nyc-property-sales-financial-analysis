# NYC Property Sales Financial Analysis

## Project Overview

This project analyzes NYC property sales data using Python, SQL, MySQL, and Power BI. The goal is to understand changes in property sales activity and prices over time and compare patterns across boroughs, neighborhoods, and property types.

The project uses NYC Open Data from the NYC Department of Finance.

## Tools

* Python
* Pandas
* NumPy
* Jupyter Notebook
* SQL
* MySQL
* Power BI

## Project Workflow

**NYC Open Data → Python / Pandas / NumPy → MySQL / SQL → Power BI**

### 1. Data Cleaning and Exploration

Used Python in Jupyter Notebook to:

* Clean and prepare NYC property sales data
* Convert dates and numeric fields
* Remove nominal/non-market sale prices from the market-price analysis
* Clean property type and borough information
* Identify high-value transactions using the IQR method
* Explore transaction volume and sale price patterns

### 2. SQL Analysis

Used MySQL to analyze:

* Annual property transaction volume
* Average sale prices by year
* Transaction activity by borough
* Average sale prices by borough
* Transaction activity by property type
* High-value transactions
* High-value transactions by borough, neighborhood, and property type

SQL analysis was organized into reusable views for Power BI.

### 3. Power BI Dashboard

Built an interactive Power BI dashboard to analyze:

* Property transaction trends over time
* Average sale prices
* Borough-level differences
* Property type differences
* High-value property transactions
* High-value neighborhoods

The dashboard includes KPI cards, line charts, bar charts, and column charts.

## Key Findings

* The dataset contains more than 570,000 property transactions after data cleaning.
* Annual transaction volume varied substantially across 2016–2025.
* Property transaction activity and average prices differed across NYC boroughs.
* Manhattan accounted for a large share of high-value transactions.
* High-value transactions were concentrated in specific neighborhoods and property types.
* Property types showed substantial differences in both transaction volume and average sale price.

## Files

| File                                         | Description                                   |
| -------------------------------------------- | --------------------------------------------- |
| `NYC_Property_Sales_Analysis.ipynb`          | Python data cleaning and exploratory analysis |
| `NYC_Property_Sales_Data.sql`                | MySQL database and data preparation SQL       |
| `NYC_Property_Sales_Views.sql`               | SQL analysis views used for the project       |
| `NYC_Property_Sales_Financial_Analysis.pbix` | Power BI dashboard                            |

## Data Source

NYC Open Data — NYC Citywide Annualized Calendar Sales Update

Dataset: NYC Department of Finance

## Project Purpose

This project was created as a portfolio project to demonstrate practical skills in Python, SQL, MySQL, data analysis, and Power BI.
