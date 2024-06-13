CREATE OR REPLACE PROCEDURE ssp_courses_by_address() (
	IN address_name VARCHAR(100),
	OUT address_name VARCHAR(50),
    OUT full_name VARCHAR(100),
    OUT level_of_bill VARCHAR(20),
    OUT make VARCHAR(30),
    OUT condition CHAR(1),
    OUT category_name VARCHAR(50)
)
AS 
$$
BEGIN
	UPDATE
		accounts
	SET 
		balance = balance + money_amount
	WHERE 
		id = account_id;
END;
$$
LANGUAGE plpgsql;