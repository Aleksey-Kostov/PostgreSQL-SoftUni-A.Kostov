DELETE FROM countries
WHERE id NOT IN (
    SELECT country_id FROM actors
    UNION
    SELECT country_id FROM productions
);