# 🧹 Data Cleaning in Snowflake – SQL Project

I completed this project to demonstrate **data cleaning, transformation, and feature extraction** using Snowflake SQL. The project is based on a cumulative challenge involving retail sales and customer datasets.

## 📁 File

- `project_8_data_cleaning_in_snowflake.sql` – Main SQL script containing all data loading, cleaning, transformations, and analytical queries.

---

## 📌 Key Objectives

### ✅ Part 1: Cumulative Challenge – Top Products Sold in January 2023
- Load and structure the `ORDERS` table.
- Clean city names using `TRIM()`.
- Parse product descriptions using `SPLIT_PART()`.
- Filter records for January 2023 using `TO_DATE()` and `BETWEEN`.
- Aggregate total quantity sold per product and city.
- Export top 5 results as CSV.

### ✅ Part 2: Data Cleaning Tasks

#### 🔢 Task 1: Standardize Phone Columns
- I used `LTRIM()` to remove country codes or leading characters from phone numbers.

#### 🕒 Task 2: Calculate Customer Age
- I derived age using `DATEDIFF()` and `CURRENT_DATE()` from date of birth.

#### 🧹 Task 3: Remove Unwanted Characters
- I applied `TRIM()` and `CONCAT()` to clean whitespace and invalid prefixes.

#### ✂️ Task 4: Split Name Columns
- I separated first and last names from full name strings using `SPLIT_PART()`.

#### 📅 Task 5: Convert Text to Date Format
- I used `TO_DATE()` to convert string columns into proper date types.

#### 📆 Task 6: Compute "Days Since Last Transaction"
- I generated a new feature using `DATEDIFF()` between `LastTransaction` and `CURRENT_DATE()`.

#### 🔍 Task 7: Handle Missing Values
- I applied `IS NULL` and `IFF()` for deletion or imputation strategies.

#### 🧬 Task 8: Eliminate Duplicates
- I filtered out duplicate records based on email using `RANK()` and `QUALIFY`.

#### 💾 Task 9: Create and Query View
- I combined all transformations into a view.
- Exported filtered inactive customers to CSV.

---

## 🧰 SQL Concepts Used

- `CREATE TABLE`, `INSERT INTO`
- `TRIM()`, `LTRIM()`, `SPLIT_PART()`, `CONCAT()`
- `TO_DATE()`, `DATEDIFF()`
- `GROUP BY`, `HAVING`, `ORDER BY`
- `RANK() OVER()`, `QUALIFY`
- `CREATE VIEW`, `WITH` clause
- `IS NULL`, `IFF()`

---

## 🧠 Learning Outcomes

By completing this project, I was able to:

- Clean and transform messy data in Snowflake using SQL functions.
- Derive meaningful features such as customer age and inactivity.
- Build structured views for reporting and export.
- Identify and handle data quality issues like missing values and duplicates.

---

## 📤 Export Instructions

- I used the Snowflake UI’s export feature (results pane) to download filtered results as CSV.

---

## 📦 Requirements

- **Snowflake Account**
- **Access to a Virtual Warehouse (e.g., COMPUTE_WH)**
- **ACCOUNTADMIN or similar privileges to create tables and views**

---

## 🧪 Sample Queries

```sql
-- Extract first name from NAME column
SELECT SPLIT_PART(TRIM(NAME, ' 0'), ', ', 1) AS FIRST_NAME FROM CUSTOMERS;

-- Compute days since last transaction
SELECT DATEDIFF(DAY, TO_DATE(LastTransaction, 'AUTO'), CURRENT_DATE()) AS DaysSinceLastTrans FROM CUSTOMERS;

-- Find duplicates
SELECT EMAIL, COUNT(*) FROM CUSTOMERS GROUP BY EMAIL HAVING COUNT(*) > 1;
