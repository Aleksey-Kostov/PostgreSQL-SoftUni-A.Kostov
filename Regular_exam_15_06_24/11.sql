CREATE OR REPLACE PROCEDURE udp_modify_account(
	 address_street VARCHAR(30),
	 address_town VARCHAR(30)
)
AS 
$$
BEGIN
    UPDATE accounts
    SET job_title =
    CASE
    WHEN address_street IN (SELECT street FROM addresses) AND address_town IN (SELECT town FROM addresses) 
    THEN (SELECT 
    CONCAT('(Remote) ', a.job_title) AS job_title
    FROM accounts AS a 
    JOIN addresses AS ad
    ON a.id = ad.account_id
    WHERE address_street = ad.street AND address_town = ad.town)
    ELSE job_title
    END;
END;
$$
LANGUAGE plpgsql;




CREATE OR REPLACE PROCEDURE udp_modify_account(
	 address_street VARCHAR(30),
	 address_town VARCHAR(30)
)
AS 
$$
BEGIN

    CASE
    WHEN address_street IN (SELECT street FROM addresses) AND address_town IN (SELECT town FROM addresses) 
    THEN UPDATE accounts
    SET job_title = (SELECT 
    CONCAT('(Remote) ', a.job_title) AS job_title
    FROM accounts AS a 
    JOIN addresses AS ad
    ON a.id = ad.account_id
    WHERE address_street = ad.street AND address_town = ad.town)
    ELSE job_title = ''
    END;
END;
$$
LANGUAGE plpgsql;
