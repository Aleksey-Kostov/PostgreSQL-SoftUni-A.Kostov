SELECT 
	t.id AS team_id,
	t.name AS team_name,
	count(p.team_id) AS player_count,
	t.fan_base
FROM 
	teams AS t
LEFT JOIN players AS p
ON p.team_id = t.id
WHERE t.fan_base > 30000
GROUP BY t.name, t.id, t.fan_base
ORDER BY player_count DESC,
t.fan_base DESC
