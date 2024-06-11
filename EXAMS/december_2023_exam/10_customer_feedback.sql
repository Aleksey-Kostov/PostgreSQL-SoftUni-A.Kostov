CREATE OR REPLACE FUNCTION fn_feedbacks_for_product (
	product_name VARCHAR(25)) 
    RETURNS TABLE(customer_id INT,
    customer_name VARCHAR(75),
    feedback_description VARCHAR(255),
    feedback_rate NUMERIC(4, 2))
AS
$$

BEGIN 
	RETURN QUERY
	(SELECT 
	c.id AS customor_id,
	c.first_name AS customor_name,
	f.description AS feedback_description,
	f.rate AS feedback_rate
    FROM customers AS c
    JOIN feedbacks AS f
    ON c.id = f.customer_id
    JOIN products AS p
    ON p.id = f.product_id
    WHERE product_name = p.name
	ORDER BY c.id);
END;
$$
LANGUAGE plpgsql;