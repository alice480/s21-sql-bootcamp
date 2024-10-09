WITH
	address_info AS (
		SELECT	address,
				round(MAX(age::numeric) - MIN(age::numeric) / MAX(age::numeric), 2) AS formula, 
				round(AVG(age), 2) AS average
			FROM person
		GROUP BY address
		ORDER BY address
	)
SELECT	address,
		formula,
		average,
		CASE
			WHEN formula > average THEN 'true'
			ELSE 'false'
		END comparison
	FROM
		address_info;
