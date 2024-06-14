SELECT 
c.last_name,
CEIL(AVG(bg.rating)) AS average_rating,
p.name
FROM publishers AS p
JOIN board_games AS bg
ON p.id = bg.publisher_id
JOIN creators_board_games AS cbg
ON bg.id = cbg.board_game_id
JOIN creators AS c 
ON c.id = cbg.creator_id
GROUP BY last_name, p.name
HAVING p.name = 'Stonemaier Games'
ORDER BY average_rating DESC