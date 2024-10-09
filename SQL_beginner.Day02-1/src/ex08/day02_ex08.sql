WITH
	men_list AS (
		SELECT id, name
			FROM person
				WHERE 
					gender = 'male' AND
					address IN ('Moscow', 'Samara')
	),
	menu_list AS (
		SELECT menu.id
			FROM menu
				WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')
	)
SELECT name
	FROM 
			person_order
		JOIN
			men_list
		ON
			person_order.person_id = men_list.id
		JOIN
			menu_list
		ON
			person_order.menu_id = menu_list.id
ORDER BY name DESC;
