SELECT 
c.photo_id,
COUNT(l.id) AS likes_count,
COUNT(c.id) AS comments_count
FROM photos AS p
JOIN likes AS l 
ON p.id = l.photo_id
JOIN comments AS c 
ON p.id = c.photo_id
ORDER BY likes_count DESC, comments_count DESC, p.photo_id ASC