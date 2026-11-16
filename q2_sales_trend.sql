-- Question 2A: How do sales change year by year?
SELECT EXTRACT(YEAR FROM clean_date) AS year,
       ROUND(SUM(weekly_sales), 0) AS total_sales,
       ROUND(AVG(weekly_sales), 0) AS avg_weekly_sales,
       COUNT(DISTINCT clean_date) AS weeks_in_data
FROM Walmart_sales
GROUP BY 1
ORDER BY 1;

-- Question 2B: How do sales change month by month?
WITH monthly AS (
  SELECT DATE_TRUNC('month', clean_date)::date AS month,
         ROUND(AVG(weekly_sales), 0) AS avg_weekly_sales
  FROM Walmart_sales
  GROUP BY 1
)
SELECT month,
       avg_weekly_sales,
       LAG(avg_weekly_sales) OVER (ORDER BY month) AS prev_month,
       ROUND((avg_weekly_sales - LAG(avg_weekly_sales) OVER (ORDER BY month))
             / LAG(avg_weekly_sales) OVER (ORDER BY month) * 100, 1) AS pct_change
FROM monthly
ORDER BY month;

WITH monthly AS (
  SELECT DATE_TRUNC('month', clean_date)::date AS month,
         ROUND(AVG(weekly_sales), 0) AS avg_weekly_sales
  FROM Walmart_sales
  GROUP BY 1
)
(SELECT 'highest' AS type, month, avg_weekly_sales
 FROM monthly ORDER BY avg_weekly_sales DESC LIMIT 3)
UNION ALL
(SELECT 'lowest', month, avg_weekly_sales
 FROM monthly ORDER BY avg_weekly_sales ASC LIMIT 3);