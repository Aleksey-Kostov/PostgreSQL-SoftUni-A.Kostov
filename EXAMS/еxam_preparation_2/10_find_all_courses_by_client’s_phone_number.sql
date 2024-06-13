CREATE OR REPLACE FUNCTION fn_courses_by_client (
	phone_num VARCHAR(20)
) RETURNS INT
AS
$$
-- DECLARE 
-- 	full_name VARCHAR(101);
BEGIN
	RETURN 
    (SELECT 
    COUNT(co.client_id) 
    FROM 
    clients AS c 
    JOIN courses AS co 
    ON c.id = co.client_id 
    WHERE c.phone_number = phone_num);
END;
$$
LANGUAGE plpgsql;