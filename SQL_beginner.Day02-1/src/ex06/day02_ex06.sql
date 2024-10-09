WITH 
	anna_denis_menu_id AS (
		SELECT menu_id
			FROM
					person_order
				JOIN
					(SELECT pers.id
						FROM person pers
							WHERE pers.name IN ('Anna', 'Denis')) AS anna_denis
				ON anna_denis.id = person_order.person_id	
	),
	menu_data AS (
		SELECT 
				pizza_name,
				pizzeria_id
			FROM
					anna_denis_menu_id
				JOIN
					menu
				ON anna_denis_menu_id.menu_id = menu.id
	)
SELECT 
		pizza_name, 
		piz.name AS pizzeria_name
	FROM 
			menu_data
		JOIN
			pizzeria piz
		ON menu_data.pizzeria_id = piz.id
ORDER BY pizza_name, pizzeria_name;
