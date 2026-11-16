SELECT store,
       ROUND(SUM(weekly_sales), 0) AS total_sales,
       ROUND(AVG(weekly_sales), 0) AS avg_weekly_sales,
       RANK() OVER (ORDER BY SUM(weekly_sales) DESC) AS sales_rank
FROM Walmart_sales
GROUP BY store
ORDER BY sales_rank;