SELECT 
a.name AS animal,
EXTRACT (YEAR FROM a.birthdate) AS birth_year,
aty.animal_type AS animal_type
FROM animals As a
JOIN animal_types AS aty
ON aty.id = a.animal_type_id
WHERE a.owner_id is NULL and aty.animal_type <> 'Birds' and EXTRACT(YEAR FROM AGE('01/01/2022', a.birthdate)) < 5
ORDER BY a.name;