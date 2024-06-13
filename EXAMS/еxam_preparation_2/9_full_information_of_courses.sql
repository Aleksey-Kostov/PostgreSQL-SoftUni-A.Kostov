SELECT 
    a.name AS "address",
	CASE
	WHEN EXTRACT(HOUR FROM co.start) BETWEEN 6 and 20 THEN 'Day'
	ELSE 'Night'
	END AS day_time,
    co.bill AS bill,
	cl.full_name AS full_name,
	c.make AS make,
	c.model AS model,
	ca.name AS category_name
FROM 
	courses AS co 
LEFT JOIN 
	"addresses" AS a
ON 
	a.id = co.from_address_id
LEFT JOIN 
	clients AS cl 
ON 
	cl.id = co.client_id
LEFT JOIN 
	cars AS c
ON 
	c.id = co.car_id
LEFT JOIN 
	categories AS ca
ON 
	ca.id = c.category_id
ORDER BY co.id