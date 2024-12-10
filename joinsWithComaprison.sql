SELECT a.name, a.primary_poc, s.name sales_rep
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
AND a.primary_poc < s.name;