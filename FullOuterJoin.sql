SELECT a.id account, s.id
FROM accounts a
FULL OUTER JOIN sales_reps s
ON s.id = a.sales_rep_id