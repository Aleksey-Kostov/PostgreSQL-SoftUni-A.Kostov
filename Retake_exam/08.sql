SELECT
    c.name AS country_name,
    COUNT(p.id) AS productions_count,
    COALESCE(AVG(pi.budget), 0) AS avg_budget
FROM
    countries c
JOIN
    productions p ON c.id = p.country_id
JOIN
    productions_info pi ON p.production_info_id = pi.id
GROUP BY
    c.name
HAVING
    COUNT(p.id) > 0
ORDER BY
    productions_count DESC,
    country_name ASC;