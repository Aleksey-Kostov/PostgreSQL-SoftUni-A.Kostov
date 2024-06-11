CREATE OR REPLACE PROCEDURE sp_customer_country_name(
	IN customer_full_name VARCHAR(50), OUT country_name VARCHAR(50)
)
AS 
$$
BEGIN
	SELECT 
	c.name 
    INTO country_name
    FROM customers as cu
    JOIN countries AS c ON c.id = cu.country_id
    WHERE (SELECT CONCAT(cu.first_name, ' ', cu.last_name)) = customer_full_name;
END;
$$
LANGUAGE plpgsql;
