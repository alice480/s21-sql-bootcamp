SELECT 	pizza_name,
		price,
		name AS pizzeria_name
	FROM 
			menu
		JOIN
			pizzeria
		ON menu.pizzeria_id = pizzeria.id
			WHERE NOT EXISTS
				(SELECT *
					FROM person_order pers_ord
						WHERE menu.id = pers_ord.menu_id)
ORDER BY pizza_name, price;
