SELECT 
p.id AS photo_id,
p.capture_date,
p.description,
COUNT(c.id) AS comments_count
FROM photos AS p
JOIN comments AS c 
ON p.id = photo_id
WHERE description is NOT NULL
GROUP BY p.photo_id, p.capture_date, p.description
ORDER BY comments_count DESC, photo_id ASC
LIMIT 3