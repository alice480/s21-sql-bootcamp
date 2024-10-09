SELECT
	(SELECT name
	FROM person per
	WHERE per.id = per_o.person_id) AS per_data
FROM person_order AS per_o
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND order_date = '2022-01-07'
