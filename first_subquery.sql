SELECT *
FROM 
(SELECT DATE_TRUNC('day', occurred_at),
       channel,
       COUNT(*)
FROM web_events
GROUP BY 1, 2
ORDER BY 3 DESC) sub