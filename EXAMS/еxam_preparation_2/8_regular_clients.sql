SELECT 
c.full_name AS full_name,
COUNT(c.id) AS count_of_cars,
SUM(co.bill) AS total_sum
FROM 
    clients AS c
JOIN
    courses AS co 
ON 
    c.id = co.client_id
WHERE (SUBSTRING(full_name, 2, 1)) = 'a'
GROUP BY full_name
HAVING COUNT(c.id) > 1
ORDER BY full_name
    