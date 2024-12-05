-- Question 1
SELECT primary_poc,
       LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1) ||
       '.' ||
       RIGHT(primary_poc, LENGTH(primary_poc) -  STRPOS(primary_poc, ' ')) || '@' || name || '.com' AS email
FROM accounts;

-- Question 2
SELECT primary_poc,
       LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1) ||
       '.' ||
       RIGHT(primary_poc, LENGTH(primary_poc) -  STRPOS(primary_poc, ' ')) || '@' || REPLACE(name,' ','') || '.com' AS email
FROM accounts;

-- Question 3
SELECT primary_poc,
       LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1) ||
       '.' ||
       RIGHT(primary_poc, LENGTH(primary_poc) -  STRPOS(primary_poc, ' ')) || '@' || REPLACE(name,' ','') || '.com' AS email,
        LOWER(LEFT(primary_poc, 1)) || RIGHT(LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1), 1) ||  LOWER(LEFT(RIGHT(primary_poc, LENGTH(primary_poc) -  STRPOS(primary_poc, ' ')), 1)) || RIGHT(primary_poc, 1) || LENGTH(LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1)) || LENGTH(RIGHT(primary_poc, LENGTH(primary_poc) -  STRPOS(primary_poc, ' '))) || UPPER(REPLACE(name, ' ', '')) AS password
FROM accounts;