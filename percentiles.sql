-- 1. Use the NTILE functionality to divide the accounts into 4 levels in terms of the amount of standard_qty for their orders. Your resulting table should have the account_id, the occurred_at time for each order, the total amount of standard_qty paper purchased, and one of four levels in a standard_quartile column.
SELECT id,
       occurred_at,
       standard_amt_usd,
       NTILE(4) OVER (ORDER BY standard_amt_usd) AS standard_quartile
FROM orders
ORDER BY 1;

-- 2. Use the NTILE functionality to divide the accounts into two levels in terms of the amount of gloss_qty for their orders. Your resulting table should have the account_id, the occurred_at time for each order, the total amount of gloss_qty paper purchased, and one of two levels in a gloss_half column.
SELECT id,
       occurred_at,
       gloss_amt_usd,
       NTILE(2) OVER (ORDER BY gloss_amt_usd) AS gloss_half
FROM orders
ORDER BY 1;

-- 3. Use the NTILE functionality to divide the orders for each account into 100 levels in terms of the amount of total_amt_usd for their orders. Your resulting table should have the account_id, the occurred_at time for each order, the total amount of total_amt_usd paper purchased, and one of 100 levels in a total_percentile column.
SELECT id,
       occurred_at,
       total_amt_usd,
       NTILE(100) OVER (ORDER BY total_amt_usd) AS total_percentile
FROM orders
ORDER BY 1;