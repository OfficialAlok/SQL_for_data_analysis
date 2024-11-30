-- Question 1
SELECT a.name, r.name region
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON r.id = s.region_id;

-- to check 1st
SELECT DISTINCT name
FROM accounts


-- Question 2
SELECT s.id, s.name, COUNT(*) num
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num;

-- to check question 2
SELECT DISTINCT id, name
FROM sales_reps