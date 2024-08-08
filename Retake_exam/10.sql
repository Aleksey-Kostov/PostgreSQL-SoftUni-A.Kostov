CREATE OR REPLACE FUNCTION udf_category_productions_count(category_name VARCHAR(50))
RETURNS VARCHAR(50) AS $$
DECLARE
    count INT;
BEGIN
    SELECT COUNT(p.id) INTO count
    FROM categories c
    JOIN categories_productions cp ON c.id = cp.category_id
    JOIN productions p ON cp.production_id = p.id
    WHERE c.name = category_name;
    RETURN 'Found ' || count || ' productions.';
END;
$$ LANGUAGE plpgsql;