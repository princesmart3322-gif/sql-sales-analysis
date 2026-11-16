-- Question 5: Store growth, Feb-Oct 2010 vs Feb-Oct 2012
WITH periods AS (
  SELECT store,
         AVG(CASE WHEN EXTRACT(YEAR FROM clean_date) = 2010 THEN weekly_sales END) AS avg_2010,
         AVG(CASE WHEN EXTRACT(YEAR FROM clean_date) = 2012 THEN weekly_sales END) AS avg_2012
  FROM Walmart_sales
  WHERE EXTRACT(MONTH FROM clean_date) BETWEEN 2 AND 10
    AND EXTRACT(YEAR FROM clean_date) IN (2010, 2012)
  GROUP BY store
),
growth AS (
  SELECT store,
         ROUND(avg_2010, 0) AS avg_2010,
         ROUND(avg_2012, 0) AS avg_2012,
         ROUND((avg_2012 - avg_2010) / avg_2010 * 100, 1) AS pct_growth
  FROM periods
)
(SELECT 'fastest growing' AS type, store, avg_2010, avg_2012, pct_growth
 FROM growth ORDER BY pct_growth DESC LIMIT 5)
UNION ALL
(SELECT 'most declining', store, avg_2010, avg_2012, pct_growth
 FROM growth ORDER BY pct_growth ASC LIMIT 5);