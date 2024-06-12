CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department (
	searched_volunteers_department VARCHAR(30)) RETURNS INT
AS
$$
-- DECLARE 
-- 	full_name VARCHAR(101);
BEGIN
	RETURN (SELECT 
    count(v.department_id) 
    FROM volunteers AS v 
    JOIN volunteers_departments AS vd 
    ON vd.id = v.department_id
    WHERE vd.department_name = searched_volunteers_department);
END;
$$
LANGUAGE plpgsql;
