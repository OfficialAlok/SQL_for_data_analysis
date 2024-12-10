-- https://learn.udacity.com/courses/ud198/lessons/a869ee25-182d-40c8-b860-0f2bbf58be31/concepts/a8e2ee61-bf7f-4160-85b6-aa03e86054ff?lesson_tab=lesson
SELECT we1.id AS we1_id,
       we1.account_id AS we1_account_id,
       we1.occurred_at AS we1_occurred_at,
       we1.channel As we1_channel,
       we2.id AS we2_id,
       we2.account_id AS we2_account_id,
       we2.occurred_at AS we2_occurred_at,
       we2.channel As we2_channel
  FROM web_events we1
 LEFT JOIN web_events we2
   ON we1.account_id = we2.account_id
  AND we1.occurred_at > we2.occurred_at
  AND we1.occurred_at <= we2.occurred_at + INTERVAL '1 days'
ORDER BY we1.account_id, we2.occurred_at;