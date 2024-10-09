SELECT person_data.name,
	CASE
	 	WHEN person_data.name = 'Denis' THEN 'true'
	 	ELSE 'false'
	END check_name
FROM
	(SELECT
		(SELECT name
		FROM person per
		WHERE per.id = per_o.person_id)
	FROM person_order AS per_o
	WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND order_date = '2022-01-07') AS person_data