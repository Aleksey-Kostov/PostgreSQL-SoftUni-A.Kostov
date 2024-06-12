SELECT 
a.name  AS name,
aty.animal_type AS animal_type,
to_char(a.birthdate, 'DD.MM.YYYY')
FROM animals AS a
JOIN animal_types AS aty 
ON a.animal_type_id = aty.id
ORDER BY a.name ASC;