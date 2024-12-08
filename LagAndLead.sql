SELECT occurred_at,
       total_amt_sum,
       LEAD(total_amt_sum) OVER (ORDER BY occurred_at) AS lead,
       LEAD(total_amt_sum) OVER (ORDER BY occurred_at) - total_amt_sum AS lead_difference
FROM (
SELECT occurred_at,
       SUM(total_amt_usd) AS total_amt_sum
  FROM orders 
 GROUP BY 1
 ) sub;