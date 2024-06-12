SELECT 
CONCAT(o.name, ' - ', aty.animal_type) AS "owners - animals",
o.phone_number AS phone_number,
c.id AS cage_id
FROM 
owners AS o 
JOIN 
animals AS a 
ON o.id = a.owner_id
JOIN 
cages AS c
ON a.animal_type_id = c.animal_type_id
JOIN animal_types AS aty 
ON aty.id = c.animal_type_id
ORDER BY o.name ASC,
         a.name DESC;