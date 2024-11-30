-- Question 1
SELECT MIN(occurred_at)
FROM orders
-- 2013-12-04

--Question 2
SELECT occurred_at
FROM orders
ORDER BY occurred_at
LIMIT 1

--Question 3
SELECT MAX(occurred_at)
FROM web_events
--2017-01-01


--Question 4
SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1

-- Question 5
SELECT AVG(standard_qty) standard, 
       AVG(gloss_qty) gloss, 
       AVG(poster_qty) poster, 
       AVG(standard_amt_usd) avg_std_amt, 
       AVG(gloss_amt_usd) avg_gloss_amt,
       AVG(poster_amt_usd) avg_poster_amt
FROM orders

-- Question 6
SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2