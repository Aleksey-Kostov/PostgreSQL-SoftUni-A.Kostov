CREATE OR REPLACE FUNCTION fn_stadium_team_name (
	stadium_name VARCHAR(30)
) RETURNS TABLE (team_name VARCHAR(50))
AS
$$
-- DECLARE 
-- 	full_name VARCHAR(101);
BEGIN
	RETURN QUERY
    SELECT 
	    t.name AS team_name
    FROM stadiums AS s
    JOIN teams AS t
    ON s.id = t.stadium_id
	WHERE s.name = stadium_name
    ORDER BY team_name;
END;
$$
LANGUAGE plpgsql;

SELECT fn_stadium_team_name('BlogXS')
