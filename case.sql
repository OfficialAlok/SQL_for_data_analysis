
-- using case
SELECT CASE WHEN total > 500 THEN 'Over 500'
            ELSE '500 or under' END AS total_group,
        COUNT(*) AS order_count
    FROM demo.orders
GROUP BY 1;

--using where
SELECT COUNT(*) AS orders_over_500_units
FROM orders
WHERE total > 500;


-- Question 1
SELECT account_id,
       total_amt_usd,
       CASE WHEN total_amt_usd >= 3000 THEN 'Large'
       ELSE 'Small' END AS level_of_order
FROM orders;

-- Question 2
SELECT CASE WHEN total >= 2000 THEN 'At least 2000'
            WHEN total BETWEEN 1000 AND 2000 THEN 'Between 1000 and 2000'
            WHEN total < 1000 THEN 'Less than 100'
            END AS categories,
        COUNT(*) total_count
FROM orders
GROUP BY 1

-- Question 3
SELECT a.name, 
       SUM(total_amt_usd) total_sales,
       CASE WHEN SUM(total_amt_usd)>= 200000 THEN 'greater than 200k'
            WHEN SUM(total_amt_usd) BETWEEN 100000 AND 200000 THEN 'between 200k and 100k'
            ELSE 'under 100 k' END AS level
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC;

-- Question 4
SELECT account_id,
       name,
       SUM(total_amt_usd),
       CASE WHEN SUM(total_amt_usd) >= 3000 THEN 'Large'
            ELSE 'Small' END AS level_of_order
FROM orders
JOIN accounts
ON accounts.id = orders.account_id
WHERE occurred_at BETWEEN '2016-01-01' AND '2018-01-01'
GROUP BY account_id, name
ORDER BY 3 DESC;

-- Question 5
SELECT s.name,
       COUNT(o.*) total_order,
       CASE WHEN COUNT(*) > 200 THEN 'top'
            ELSE 'not' END AS performance
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC;

-- Question 6
SELECT s.name,
       COUNT(o.*) total_order,
       SUM(o.total_amt_usd) total_sales,
       CASE WHEN COUNT(o.*) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
            WHEN (COUNT(o.*) > 150 AND  COUNT(o.*) <= 200) OR SUM(o.total_amt_usd) > 500000 THEN 'middle'
            ELSE 'low' END AS performance
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 3 DESC;