-- Data cleaning: Walmart_sales

-- 1. Convert sale_date (text) to a real date
ALTER TABLE Walmart_sales ADD COLUMN clean_date DATE;
UPDATE Walmart_sales
SET clean_date = TO_DATE(sale_date, 'DD-MM-YYYY');

-- 2. Check the conversion worked
SELECT MIN(clean_date) AS first_date,
       MAX(clean_date) AS last_date,
       COUNT(*) - COUNT(clean_date) AS failed_rows
FROM Walmart_sales;

-- 3. Check for duplicates
SELECT store, clean_date, COUNT(*) AS times
FROM Walmart_sales
GROUP BY store, clean_date
HAVING COUNT(*) > 1;

-- 4. Check for nulls
SELECT
  COUNT(*) - COUNT(store) AS null_store,
  COUNT(*) - COUNT(weekly_sales) AS null_sales,
  COUNT(*) - COUNT(holiday_flag) AS null_holiday,
  COUNT(*) - COUNT(temperature) AS null_temp,
  COUNT(*) - COUNT(fuel_price) AS null_fuel
FROM Walmart_sales;

-- 5. Check for odd values
SELECT MIN(weekly_sales), MAX(weekly_sales),
       MIN(temperature), MAX(temperature),
       MIN(fuel_price), MAX(fuel_price)
FROM Walmart_sales;