-- Question 1
SELECT SUM(poster_qty) total_poster
FROM orders;

-- Question 2
SELECT SUM(standard_qty) total_standard
FROM orders;

-- Question 3
SELECT SUM(total_amt_usd) total_dollar_amount
FROM orders;

-- Question 4
SELECT (standard_amt_usd + gloss_amt_usd) dollar_amount
FROM orders;

-- Question 5
SELECT SUM(standard_amt_usd) / SUM(standard_qty) standard_amt_usd_per_unit
FROM orders