CREATE OR REPLACE PROCEDURE udp_awarded_production(production_title VARCHAR(70))
AS 
$$
DECLARE
    production_idi INT;
BEGIN
    SELECT p.id INTO production_idi
    FROM productions p
    WHERE p.title = production_title;
    
    IF FOUND THEN
        UPDATE actors
        SET awards = awards + 1
        WHERE id IN (
            SELECT pa.actor_id
            FROM productions_actors pa
            WHERE pa.production_id = production_idi
        );
    END IF;
END;
$$ LANGUAGE plpgsql;
