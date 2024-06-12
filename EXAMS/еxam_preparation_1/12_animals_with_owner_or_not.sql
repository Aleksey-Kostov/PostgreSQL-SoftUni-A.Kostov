CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
	IN animal_name VARCHAR(30),
	OUT owner_name TEXT)
AS 
$$
BEGIN
	SELECT 
    CASE
    WHEN a.owner_id is NOT NULL THEN o.name
    ELSE 'For adoption'
    END
    INTO
    owner_name
    FROM 
    animals AS a 
    LEFT JOIN owners AS o 
    ON a.owner_id = o.id
    WHERE a.name = animal_name;
END;
$$
LANGUAGE plpgsql;

CALL sp_animals_with_owners_or_not('Pumpkinseed Sunfish')