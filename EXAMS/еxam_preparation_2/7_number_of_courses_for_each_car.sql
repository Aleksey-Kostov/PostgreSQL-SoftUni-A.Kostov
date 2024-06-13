SELECT 
c.id AS car_id,
c.make AS make,
count(co.client_id) AS count_of_courses,
AVG(co.bill) AS average_bill
FROM cars AS c
LEFT JOIN courses AS co 
ON co.car_id = c.id
JOIN clients AS cl
ON cl.id = co.client_id
GROUP BY c.id, c.make
ORDER BY count_of_courses DESC, car_id