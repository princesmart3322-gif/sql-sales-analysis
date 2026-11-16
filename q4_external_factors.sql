-- Question 4A: Correlation of external factors with weekly sales (all rows)
SELECT ROUND(CORR(weekly_sales, temperature)::numeric, 3) AS temp_corr,
       ROUND(CORR(weekly_sales, fuel_price)::numeric, 3) AS fuel_corr,
       ROUND(CORR(weekly_sales, cpi)::numeric, 3) AS cpi_corr,
       ROUND(CORR(weekly_sales, unemployment)::numeric, 3) AS unemployment_corr
FROM Walmart_sales;

-- Question 4B: Correlation within each store, averaged across stores
WITH per_store AS (
  SELECT store,
         CORR(weekly_sales, temperature) AS temp_corr,
         CORR(weekly_sales, fuel_price) AS fuel_corr,
         CORR(weekly_sales, cpi) AS cpi_corr,
         CORR(weekly_sales, unemployment) AS unemployment_corr
  FROM Walmart_sales
  GROUP BY store
)
SELECT ROUND(AVG(temp_corr)::numeric, 3) AS avg_temp_corr,
       ROUND(AVG(fuel_corr)::numeric, 3) AS avg_fuel_corr,
       ROUND(AVG(cpi_corr)::numeric, 3) AS avg_cpi_corr,
       ROUND(AVG(unemployment_corr)::numeric, 3) AS avg_unemployment_corr
FROM per_store;