-- Question 3A: Holiday vs non-holiday weeks
SELECT holiday_flag,
       COUNT(DISTINCT clean_date) AS weeks,
       ROUND(AVG(weekly_sales), 0) AS avg_weekly_sales
FROM Walmart_sales
GROUP BY holiday_flag
ORDER BY holiday_flag;

-- Question 3B: Each holiday week vs the normal-week average
WITH normal AS (
  SELECT AVG(weekly_sales) AS avg_normal
  FROM Walmart_sales
  WHERE holiday_flag = 0
)
SELECT w.clean_date,
       ROUND(AVG(w.weekly_sales), 0) AS avg_weekly_sales,
       ROUND((AVG(w.weekly_sales) - n.avg_normal) / n.avg_normal * 100, 1) AS pct_vs_normal
FROM Walmart_sales w
CROSS JOIN normal n
WHERE w.holiday_flag = 1
GROUP BY w.clean_date, n.avg_normal
ORDER BY avg_weekly_sales DESC;