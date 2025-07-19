# 🧹 Data Cleaning in Snowflake – SQL Project

This project demonstrates how to perform data cleaning, transformation, and feature extraction using **Snowflake SQL**. It is structured around a cumulative challenge and a series of tasks focusing on retail sales and customer data.

## 📁 File

- `project_8_data_cleaning_in_snowflake.sql` – Main SQL script containing data loading, transformations, and analytical queries.

---

## 📌 Key Objectives

### ✅ Part 1: Cumulative Challenge – Top Products Sold in January 2023
- Load and structure `ORDERS` table.
- Clean city names using `TRIM()`.
- Parse product descriptions using `SPLIT_PART()`.
- Filter records for January 2023 using `TO_DATE()` and `BETWEEN`.
- Aggregate total quantity sold per product and city.
- Export top 5 results as CSV.

### ✅ Part 2: Data Cleaning Tasks

#### 🔢 Task 1: Standardize Phone Columns
- Use `LTRIM()` to remove country codes or leading characters.

#### 🕒 Task 2: Calculate Customer Age
- Use `DATEDIFF()` and `CURRENT_DATE()` to derive age from date of birth.

#### 🧹 Task 3: Remove Unwanted Characters
- Use `TRIM()` and `CONCAT()` to detect and clean whitespace or invalid prefixes.

#### ✂️ Task 4: Split Name Columns
- Use `SPLIT_PART()` to separate first and last names from a full name string.

#### 📅 Task 5: Convert Text to Date Format
- Use `TO_DATE()` to parse and convert string columns to proper date types.

#### 📆 Task 6: Compute "Days Since Last Transaction"
- Generate a new feature using `DATEDIFF()` between `LastTransaction` and `CURRENT_DATE()`.

#### 🔍 Task 7: Handle Missing Values
- Use `IS NULL` and `IFF()` for deletion or imputation strategies.

#### 🧬 Task 8: Eliminate Duplicates
- Use `RANK()` and `QUALIFY` to filter out duplicated records based on email.

#### 💾 Task 9: Create and Query View
- Combine all transformations into a view.
- Export filtered inactive customers to CSV.

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

By the end of this project, you will be able to:

- Clean and transform messy data in Snowflake using SQL functions.
- Derive meaningful features such as customer age and inactivity.
- Build structured views for reporting and export.
- Identify and handle data quality issues like missing values and duplicates.

---

## 📤 Export Instructions

- Use the Snowflake UI’s export feature (results pane) to download filtered results as CSV.

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