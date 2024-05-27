SELECT 
    CASE
        WHEN age BETWEEN 0 AND 10 THEN '[0-10]'
	    WHEN age BETWEEN 10 AND 20 THEN '[11-20]'
	    WHEN age BETWEEN 20 AND 30 THEN '[21-30]'
	    WHEN age BETWEEN 30 AND 40 THEN '[31-40]'
	    WHEN age BETWEEN 40 AND 50 THEN '[41-50]'
	    WHEN age BETWEEN 50 AND 60 THEN '[51-60]'
	    ELSE '[61+]'
	END AS age_group,
    COUNT(*) AS count
FROM wizard_deposits
GROUP BY 
	age_group
ORDER BY
	age_group ASC;
