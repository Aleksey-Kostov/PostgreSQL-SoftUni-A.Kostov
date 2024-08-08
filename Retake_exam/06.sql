SELECT
    p.id,
    p.title,
    pi.duration,
    ROUND(pi.budget, 1) AS budget,
    TO_CHAR(pi.release_date, 'MM-YY') AS release_date
FROM
    productions AS p
JOIN productions_info AS pi
    ON p.production_info_id = pi.id
WHERE
    (EXTRACT(YEAR from pi.release_date)) IN (2023, 2024)
    AND pi.budget > 1500000.00
ORDER BY
    budget ASC,
    duration DESC,
    pi.id ASC
LIMIT 3;