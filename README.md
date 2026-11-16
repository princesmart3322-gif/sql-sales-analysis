# Walmart Sales Analysis (SQL)

Analysis of Walmart weekly sales data using PostgreSQL.

## Dataset
- Source: Kaggle (Walmart sales dataset)
- 6,435 rows, 45 stores, weekly data from 5 Feb 2010 to 26 Oct 2012
- Columns: store, sale_date, weekly_sales, holiday_flag, temperature, fuel_price, cpi, unemployment

## Tools
PostgreSQL 18, pgAdmin 4

## Project Workflow
```mermaid
flowchart TD
    A([Start]) --> B[Load Walmart CSV into PostgreSQL]
    B --> C[Clean data: dates, nulls, duplicates]
    C --> D[Answer business questions with SQL]
    D --> E[Build dashboard]
    E --> F[Write findings in README]
    F --> G([End])
```

## Data Cleaning
See `data_cleaning.sql`.
- Converted `sale_date` from text to a proper date column (`clean_date`)
- Checked for duplicate store/week rows: none found
- Checked for null values: none found
- Checked value ranges: all realistic (temperature appears to be in Fahrenheit)

## Business Questions

### Q1: Which stores generate the most sales?
See `q1_store_ranking.sql`.

**Finding:** Store 20 ranks first with about 301.4M in total sales (about 2.11M per week), followed by Store 4 (about 299.5M) and Store 14 (about 289.0M).

![Q1 result](q1_result.png)

### Q2 onwards (planned)
- Holiday vs non-holiday weeks
- Effect of temperature, fuel price, CPI and unemployment on sales
- Fastest-growing and declining stores
