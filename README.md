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
### Q2: How do sales change over time?
See `q2_sales_trend.sql`.

**Yearly:** Average weekly sales per store were about 1.06M in 2010, 1.05M in 2011 and 1.03M in 2012. 2010 covers 48 weeks and 2012 only 43 (data ends in October), so average weekly sales are used instead of totals.

**Monthly:** Sales peak in November and December (Dec 2010 about 1.28M, Dec 2011 about 1.28M, Nov 2011 about 1.17M) and are lowest in January (Jan 2011 about 0.91M, Jan 2012 about 0.94M), consistent with holiday-season shopping.

![Q2 yearly](q2a_result.png)
![Q2 monthly](q2b_result.png)
![Q2 highest and lowest months](q2c_result.png)

### Q3 onwards (planned)
- Holiday vs non-holiday weeks
- Effect of temperature, fuel price, CPI and unemployment on sales
- Fastest-growing and declining stores
