UPDATE coaches
	SET salary = salary * coach_level 
WHERE SUBSTRING(first_name, 1 , 1) = 'C' AND
id IN (
    SELECT DISTINCT coach_id
    FROM players_coaches
    WHERE coach_id IS NOT NULL
)