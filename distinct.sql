-- Question 1
SELECT DISTINCT a.name, r.name region
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON r.id = s.region_id
ORDER BY name;

-- Question 2
SELECT DISTINCT a.name, s.name sales_rep
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id