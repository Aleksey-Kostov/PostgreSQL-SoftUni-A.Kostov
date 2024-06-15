UPDATE addresses
SET country = CASE
            WHEN SUBSTRING(TRIM(country), 1, 1) = 'B' THEN 'Blocked'
            WHEN TRIM(SUBSTRING(TRIM(country), 1, 1)) = 'T' THEN 'Test'
            WHEN TRIM(SUBSTRING(TRIM(country), 1, 1)) = 'P' THEN 'In Progress'
            ELSE country
            END